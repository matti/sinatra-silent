require "bundler/setup"
require "sinatra/base"
require "sinatra/silent"

require "net/http"
require_relative "shared_examples"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after do
    subject.stop! if subject.respond_to? :stop!
  end
end

require_relative "helper_methods"
