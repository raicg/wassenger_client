# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

module WassengerClient
  class Client < OpenStruct
    class << self
      def client
        http = Net::HTTP.new(url_endpoint.host, url_endpoint.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http
      end

      def url_endpoint(url = base_url, id = '', endpoint = '')
        id.blank? ? URI(url+endpoint) : URI(url+"/"+id+endpoint)
      end

      def request(url = base_url, type = :get, id = '', params = {}, endpoint = '', query = {})
        uri = url_endpoint(url, id, endpoint)
        uri.query = URI.encode_www_form(query)
        request = Net::HTTP::Get.new(uri) if type == :get
        request = Net::HTTP::Post.new(uri) if type == :post
        request = Net::HTTP::Patch.new(uri) if type == :patch
        request = Net::HTTP::Delete.new(uri) if type == :delete
        request['content-type'] = 'application/json'
        request['token'] = ENV['WASSENGER_TOKEN']
        request.body = "#{params.to_json}" if !params.blank?
        request
      end

      def post(url = base_url, id = '', params = {}, endpoint = '', query = {})
        request = request(url, :post, id, params, endpoint, query)
        response = client.request(request).read_body
        JSON.parse(response) if !response.nil?
      end

      def get(url = base_url, id = '', params = {}, endpoint = '', query = {})
        request = request(url, :get, id, params, endpoint, query)
        response = client.request(request).read_body
        JSON.parse(response) if !response.nil?
      end

      def update(url = base_url, id = '', params = {}, endpoint = '', query = {})
        request = request(url, :patch, id, params, endpoint, query)
        response = client.request(request).read_body
        JSON.parse(response) if !response.nil?
      end

      def delete(url = base_url, id = '', params = {}, endpoint = '', query = {})
        request = request(url, :delete, id, params, endpoint, query)
        response = client.request(request).read_body
        JSON.parse(response) if !response.nil?
      end

      def base_url
        'https://api.wassenger.com/v1/'
      end
    end
  end
end