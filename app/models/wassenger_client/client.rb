# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

module WassengerClient
  class Client < OpenStruct
    class << self
      def client
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http
      end

      def url
        URI(base_url)
      end

      def request(type = :get, params = {}, id = '0')
        request = Net::HTTP::Get.new(url) if type == :get
        request = Net::HTTP::Post.new(url) if type == :post
        request = Net::HTTP::Update.new(URI(base_url.concat("/#{id}"))) if type == :update
        request = Net::HTTP::Delete.new(URI(base_url.concat("/#{id}"))) if type == :delete
        request = Net::HTTP::Get.new(URI(base_url.concat("/#{id}"))) if type == :get_details
        request['content-type'] = 'application/json'
        request['token'] = ENV['WASSENGER_TOKEN']
        request.body = "#{params.to_json}" if !params.blank?
        request
      end

      def post(params = {})
        request = request(:post, params)
        client.request(request).read_body
      end

      def get(params = {})
        request = request(:get, params)
        client.request(request).read_body
      end

      def update(id)
        request = request(:update, {}, id)
        client.request(request).read_body
      end

      def delete(id)
        request = request(:delete, {}, id)
        client.request(request).read_body
      end

      def get_details(id)
        request = request(:get_details, {}, id)
        client.request(request).read_body
      end

      def base_url
        'https://api.wassenger.com/v1/'
      end
    end
  end
end