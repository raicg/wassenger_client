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

      def request(type = :get, params = {})
        request = Net::HTTP::Get.new(url) if type == :get
        request = Net::HTTP::Post.new(url) if type == :post
        request = Net::HTTP::Delete.new(url) if type == :delete
        request['content-type'] = 'application/json'
        request['token'] = ENV['WASSENGER_TOKEN']
        request.body = "#{params.to_json}"
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

      def delete(params = {})
        request = request(:delete, params)
        client.request(request).read_body
      end

      def base_url
        'https://api.wassenger.com/v1/'
      end
    end
  end
end