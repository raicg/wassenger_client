# frozen_string_literal: true

module WassengerClient
  class Pricing < WassengerClient::Client
    class << self
      def base_url
        WassengerClient::Client.base_url + 'pricing'
      end
    end
  end
end
