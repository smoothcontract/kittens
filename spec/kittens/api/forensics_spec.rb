require 'spec_helper'

describe Kittens::Api::Forensics do
  include_context 'api tests'

  describe '.directions' do
    let(:url) { "#{domain}/api/#{email}/directions" }
    let(:body) do
      '{"directions":["forward","right","forward","left","forward"]}'
    end

    before do
      stub_request(:get, url).to_return(status: 200, body: body)
    end

    subject { described_class.directions }

    it 'provides a list of directions' do
      expect(subject).to eq %w(forward right forward left forward)
    end

    context 'with server error' do
      before do
        stub_request(:get, url).to_return(status: 500, body: '{"error":"something"}')
      end

      it 'throws exception' do
        expect do
          subject
        end.to raise_error(Kittens::Errors::InvalidApiResponse)
      end
    end

    context 'with invalid JSON' do
      before do
        stub_request(:get, url).to_return(status: 200, body: 'foobar!')
      end

      it 'throws exception' do
        expect do
          subject
        end.to raise_error(Kittens::Errors::InvalidApiResponse)
      end
    end
  end
end
