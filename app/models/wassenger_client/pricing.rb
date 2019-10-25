# frozen_string_literal: true

module WassengerClient
  class Pricing < OpenStruct
    class << self
      def base_url
        WassengerClient::Client.base_url + 'pricing'
      end

      def get
        WassengerClient::Client.get(base_url)
      end
    end
  end
end
