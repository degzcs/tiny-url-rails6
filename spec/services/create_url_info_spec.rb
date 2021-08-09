require 'rails_helper'

describe CreateUrlInfo do
  let(:url) { 'http://url.com' }
  let(:timestamp) { 123456789 }
  let(:token) { 'FeKw08M4' }

  context '#token_builder' do
    context 'when token does not exists' do
      before :each do
        allow(subject).to receive(:exits?).and_return(false)
      end

      it 'should return a new token' do
        subject.token_builder(timestamp: timestamp)
        expect(subject.token).to eq token
      end
    end

    context 'when the token already exist' do
      before :each do
        UrlInfo.create(url: url, token: token)
      end

      it 'should return a new token' do
        subject.token_builder(timestamp: timestamp)
        expect(subject.token).to eq 'jvnWLrIo'
      end
    end

    context '#call' do
      it 'should create a UrlInfo and return a short_url' do
        expect do
          subject.call(url: url)
        end.to change { UrlInfo.count}.by(1)
        expect(subject.short_url).not_to be_empty
      end
    end

    context 'errors' do
      before :each do
        allow(UrlInfo).to receive(:create).and_return(false)
      end

      it 'handle an error' do
        subject.call(url: url)
        expect(subject.valid?).to eq false
      end
    end
  end
end
