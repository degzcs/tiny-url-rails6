require 'rails_helper'

RSpec.describe UrlInfo, type: :model do
  context 'attributes' do
    let(:url) { 'http://somenthing.com' }
    let(:token) { 'this-is-a-token' }
    let(:url_info) { UrlInfo.new(url: url, token: token) }

    it 'checks the attributes' do
      expect(url_info.url).to eq url
      expect(url_info.token).to eq token
    end
  end
end
