# frozen_string_literal: true

module WassengerClient
  class Message < OpenStruct
    class << self
      def base_url
        WassengerClient::Client.base_url + 'messages'
      end

      def get(query = {})
        WassengerClient::Client.get(base_url, '', {}, '', query)
      end

      def send(params = {})
        WassengerClient::Client.post(base_url, '', params)
      end

      def get_details(id = '0', query = {})
        WassengerClient::Client.get(base_url, id, {}, '', query)
      end

      def update(id = '0', params = {})
        WassengerClient::Client.patch(base_url, id, params)
      end

      def delete(id = '0')
        WassengerClient::Client.delete(base_url, id)
      end

      def data
        self[:data]
      end
    end
  end
end
