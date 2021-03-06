# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-
# stub: active_merchant_payfort 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "active_merchant_payfort"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jan De Poorter", "Simon Menke"]
  s.date = "2015-01-08"
  s.description = "A plugin for Payfort support in ActiveRecord. "
  s.email = "github@defv.be"
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.homepage = "http://github.com/DefV/active_merchant_payfort/tree/master"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.4.5"
  s.summary = "A plugin for Payfort support in ActiveRecord."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemerchant>, [">= 1.4.2"])
    else
      s.add_dependency(%q<activemerchant>, [">= 1.4.2"])
    end
  else
    s.add_dependency(%q<activemerchant>, [">= 1.4.2"])
  end
end
