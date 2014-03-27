source 'https://rubygems.org'

rakeversion = RUBY_VERSION =~ /^1.8/ ? "<10.2.0" : ">= 0"
gem 'rake', rakeversion

if ENV.key?('PUPPET_VERSION')
  puppetversion = "~> #{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['>= 2.7']
end

gem 'puppet',  puppetversion
gem 'puppet-lint'
gem 'puppetlabs_spec_helper', '>=0.2.0'
