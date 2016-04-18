require 'spec_helper'

describe Kittens::Api::Location do
  include_context 'api tests'

  let(:url) { "#{domain}/api/#{email}/location/1/2" }

  subject { described_class.search(1, 2) }

  describe '.search' do
    context 'with correct coordinates' do
      let(:body) { '{"message":"Congratulations!"}' }

      before do
        stub_request(:get, url).to_return(status: 200, body: body)
      end

      it 'returns congratulations message' do
        expect(subject).to match 'Congratulations'
      end
    end

    context 'with incorrect coordinates' do
      let(:url) { "#{domain}/api/#{email}/location/1/2" }
      let(:body) { '{"message":"Unfortunately, the search party failed"}' }

      before do
        stub_request(:get, url).to_return(status: 200, body: body)
      end

      it 'returns failure message' do
        expect(subject).to match 'Unfortunately'
      end
    end

    context 'with server error' do
      before do
        stub_request(:get, url).to_return(
          status: 500,
          body: '{"error":"something"}'
        )
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
