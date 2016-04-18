require 'spec_helper'

describe Kittens::Investigation do
  describe '#conduct' do
    let(:directions) { %w(forward right forward left forward) }
    let(:investigation) { described_class.new }

    before do
      allow(investigation).to receive(:puts)
      allow(Kittens::Api::Forensics).to receive(:directions) { directions }
      allow(Kittens::Api::Location).to receive(:search) { 'Yay!' }
    end

    subject { investigation.conduct! }

    it 'conducts an investigation into lost kittens' do
      expect(subject).to be_a(Kittens::Woman)
    end

    it 'determines final location of kitten' do
      expect(subject.x_position).to eq(1)
      expect(subject.y_position).to eq(2)
    end
  end
end
