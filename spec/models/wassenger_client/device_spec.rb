# frozen_string_literal: true

require 'net/http'
require 'json'

RSpec.describe WassengerClient::Device, type: :model do
  it 'it should connect with the api endpoint' do
    response = Net::HTTP.get(URI.parse(WassengerClient::Device.base_url))
    expect(JSON.parse(response)['status']).to be_in([200, 403])
  end
end
