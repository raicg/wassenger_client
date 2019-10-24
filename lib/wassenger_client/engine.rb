# frozen_string_literal: true

require 'rails/all'

module WassengerClient
  class Engine < ::Rails::Engine
    isolate_namespace WassengerClient

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end
  end
end
