# frozen_string_literal: true

module WassengerClient
  class File < OpenStruct
    class << self
      def base_url
        WassengerClient::Client.base_url + 'files'
      end

      def get(query = {})
        WassengerClient::Client.get(base_url, '', {}, '', query)
      end

      def upload(params = {}, query = {})
        WassengerClient::Client.post(base_url, '', params, '', query)
      end

      def preview_image(id = '0')
        WassengerClient::Client.get(base_url, id, {}, '/preview')
      end

      def download(id = '0')
        WassengerClient::Client.get(base_url, id, {}, '/download')
      end

      def get_details(id = '0')
        WassengerClient::Client.get(base_url, id)
      end

      def update(id = '0', params = {})
        WassengerClient::Client.patch(base_url, id, params)
      end

      def delete(id = '0')
        WassengerClient::Client.delete(base_url, id)
      end
    end
  end
end
