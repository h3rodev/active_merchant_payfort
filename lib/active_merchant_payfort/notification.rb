require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Payfort
        class Notification < ActiveMerchant::Billing::Integrations::Notification

          # params on a successfull payment
          #           orderID=order_342
          #           currency=EUR
          #           amount=50
          #           PM=CreditCard
          #           ACCEPTANCE=test123
          #           STATUS=9
          #           CARDNO=XXXXXXXXXXXX1111
          #           PAYID=2396925
          #           NCERROR=0
          #           BRAND=VISA
          #           IPCTY=BE
          #           CCCTY=US
          #           ECI=7
          #           CVCCheck=NO
          #           AAVCheck=NO
          #           VC=NO
          #           SHASIGN=FE220C6F4492165533488E35F47F231D6BC357FC
          #           IP=82.146.99.233

          STATUS_MAPPING = {
            0  => 'Incomplete or invalid',
            1  => 'Cancelled by client',
            2  => 'Authorization refused',
            4  => 'Order stored',
            41 => 'Waiting client payment',
            5  => 'Authorized',
            51 => 'Authorization waiting',
            52 => 'Authorization not known',
            55 => 'Stand-by',
            59 => 'Authoriz. to get manually',
            6  => 'Authorized and cancelled',
            61 => 'Author. deletion waiting',
            62 => 'Author. deletion uncertain',
            63 => 'Author. deletion refused',
            64 => 'Authorized and cancelled',
            7  => 'Payment deleted',
            71 => 'Payment deletion pending',
            72 => 'Payment deletion uncertain',
            73 => 'Payment deletion refused',
            74 => 'Payment deleted',
            75 => 'Deletion processed by merchant',
            8  => 'Refund',
            81 => 'Refund pending',
            82 => 'Refund uncertain',
            83 => 'Refund refused',
            84 => 'Payment declined by the acquirer',
            85 => 'Refund processed by merchant',
            9  => 'Payment requested',
            91 => 'Payment processing',
            92 => 'Payment uncertain',
            93 => 'Payment refused',
            94 => 'Refund declined by the acquirer',
            95 => 'Payment processed by merchant',
            99 => 'Being processed'
          }

          OK_STATUSSES = [4,5,9]

          def initialize(post, options={})
            super

            unless params['STATUS'].match(/^\d+$/)
              raise PayfortError, "Faulty Payfort result: '#{params['STATUS']}'"
            end

            sign = Payfort::inbound_message_signature(params, options[:signature])
            unless params['SHASIGN'] == sign
              raise PayfortError, "Faulty Payfort SHA1 signature: '#{params['SHASIGN']}' != '#{sign}'"
            end
          end

          def status
            OK_STATUSSES.include?(params['STATUS'].to_i) ? 'Completed' : 'Failed'
          end

          def status_message # needed?
            STATUS_MAPPING[params['STATUS'].to_i]
          end

          def gross
            params['amount'].to_f
          end

          def complete?
            status == 'Completed'
          end

          def payment_method
            params['PM']
          end

          def order_id
            params['orderID']
          end

          def transaction_id
            params['PAYID']
          end

          def brand
            params['BRAND']
          end

          def currency
            params['currency']
          end

          def acknowledge
            true
          end
          
          def scoring
            params['SCORING'].to_i if params['SCORING']
          end
          
          def scoring_category
            case params['SCO_CATEGORY']
            when 'G' then :green
            when 'O' then :orange
            when 'R' then :red
            else nil
            end
          end
          
        end
      end
    end
  end
end
