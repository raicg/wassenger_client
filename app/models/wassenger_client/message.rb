# frozen_string_literal: true

module WassengerClient
  class Message < WassengerClient::Client
    class << self
      def base_url
        WassengerClient::Client.base_url + 'messages'
      end

      def send(params = {})
        post(params)
      end
    end
  end
end
