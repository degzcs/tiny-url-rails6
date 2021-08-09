require 'rails_helper'

describe UrlInfoController, type: :controller do
  context '#index' do
    it 'should render the home page' do
      get :index
      assert_response 200
    end
  end

  context '#redirect' do
    let(:url) { 'http://google.com.co' }
    let(:token) { 'this-is-a-token' }
    let(:url_info) { UrlInfo.create(url: url, token: token) }

    it 'should render the info of a short url' do
      get :redirect, params: { token: url_info.token }
      assert_response 302
    end
  end

  context '#show' do
    let(:url) { 'http://google.com.co' }
    let(:token) { 'this-is-a-token' }
    let(:url_info) { UrlInfo.create(url: url, token: token) }

    it 'should render the info of a short url' do
      get :show, params: { token: url_info.token }
      assert_response 200
    end
  end

  context '#create' do
    let(:url) { 'http://google.com.co' }

    it 'should render the info of a short url' do
      post :create, params: { url: url }
      assert_response 201
    end
  end
end
