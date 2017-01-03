source "https://rubygems.org"

group :test do
  gem "rake"
  gem "puppet", ENV['PUPPET_GEM_VERSION'] || '~> 4.8.0'
  gem "rspec"
  gem "rspec-puppet"
  gem "puppet-lint"
  gem "puppetlabs_spec_helper"
  gem "metadata-json-lint"
  gem "rspec-puppet-facts"

  gem 'json_pure', '<= 2.0.1' if RUBY_VERSION < '2.0.0'
end


group :system_tests do
  gem "beaker"
  gem "beaker-rspec"
  gem "beaker-puppet_install_helper"
end
