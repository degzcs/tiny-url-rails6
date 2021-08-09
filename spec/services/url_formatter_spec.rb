require 'rails_helper'

describe UrlFormatter do
  let(:token) { 'this-is-a-token' }

  context '#call' do
    it 'should return the tiny url for a given token' do
      subject.call(token: token)
      expect(subject.short_url).to eq 'localhost:3000/this-is-a-token'
    end
  end

  context 'missing host' do
    before :each do
      Rails.application.routes.default_url_options[:host] = nil
    end

    it 'raise an error' do
      expect{ subject }.to raise_error UrlFormatter::ConfigError
    end
  end
end
