# frozen_string_literal: true

module WassengerClient
  class Device < OpenStruct
    class << self
      def base_url
        WassengerClient::Client.base_url + 'devices'
      end

      def get(query = {})
        WassengerClient::Client.get(base_url, '', {}, '', query)
      end

      def create(params = {})
        WassengerClient::Client.post(base_url, '', params)
      end

      def sync(id = '0')
        WassengerClient::Client.get(base_url, id, {}, '/sync')
      end

      def scan(id = '0', query = {})
        WassengerClient::Client.get(base_url, id, {}, '/scan', query)
      end

      def reset(id = '0', query = {})
        WassengerClient::Client.post(base_url, id, {}, '/reset', query)
      end

      def remove_chats(id = '0', params = {})
        WassengerClient::Client.post(base_url, id, params, '/removechats')
      end

      def reboot(id = '0', query = {})
        WassengerClient::Client.post(base_url, id, {}, '/reboot', query)
      end

      def queue(id = '0')
        WassengerClient::Client.get(base_url, id, {}, '/queue')
      end

      def route_messages(id = '0', params = {})
        WassengerClient::Client.patch(base_url, id, params, '/queue')
      end

      def empty_queue(id = '0', query = {})
        WassengerClient::Client.delete(base_url, id, {}, '/queue', query)
      end

      def get_profile_image(id = '0')
        WassengerClient::Client.get(base_url, id, {}, '/profile/image')
      end

      def get_profiles(id = '0', query = {})
        WassengerClient::Client.get(base_url, id, {}, '/profile', query)
      end

      def update_profile(id = '0', params = {})
        WassengerClient::Client.patch(base_url, id, params, '/profile')
      end

      def download_invoice(id = '0', invoice_id = '0')
        WassengerClient::Client.get(base_url, id, {}, "/invoices/#{invoice_id}/pdf")
      end

      def invoices(id = '0', query = {})
        WassengerClient::Client.get(base_url, id, {}, '/invoices', query)
      end

      def health(id = '0')
        WassengerClient::Client.get(base_url, id, {}, '/health')
      end

      def groups(id = '0')
        WassengerClient::Client.get(base_url, id, {}, '/groups')
      end

      def auto_reply(id = '0', params = {})
        WassengerClient::Client.post(base_url, id, params, '/autoreply')
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
