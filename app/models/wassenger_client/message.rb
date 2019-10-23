# frozen_string_literal: true

module WassengerClient
  class Message < WassengerClient::Client
    class << self
      def base_url
        WassengerClient::Client.base_url + 'messages'
      end
    end
  end
end
