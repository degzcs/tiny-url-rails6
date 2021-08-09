require 'rails_helper'

RSpec.describe Visit, type: :model do
  context 'attributes' do
    let(:ip_address) { '192.168.1.1' }
    let(:url) { 'http://somenthing.com' }
    let(:token) { 'this-is-a-token' }
    let(:url_info) { UrlInfo.create(url: url, token: token) }
    let(:visit) { Visit.new(url_info_id: url_info.id, ip_address: ip_address) }

    it 'checks the attributes' do
      expect(visit).to be_valid
      expect(visit.ip_address).to eq ip_address
      expect(visit.url_info_id).to eq url_info.id
    end
  end
end
