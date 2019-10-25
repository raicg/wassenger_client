# frozen_string_literal: true

module WassengerClient
  class Webhook < WassengerClient::Client
    class << self
      def base_url
        WassengerClient::Client.base_url + 'webhooks'
      end

      def register(params = {})
        post(params)
      end
    end
  end
end
