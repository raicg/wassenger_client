# frozen_string_literal: true

module WassengerClient
  class Device < WassengerClient::Client
    class << self
      def base_url
        WassengerClient::Client.base_url + 'devices'
      end

      def create(params = {})
        post(params)
      end
    end
  end
end
