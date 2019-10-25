# frozen_string_literal: true

module WassengerClient
  class File < WassengerClient::Client
    class << self
      def base_url
        WassengerClient::Client.base_url + 'files'
      end
    end
  end
end
