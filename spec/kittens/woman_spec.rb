require 'spec_helper'

describe Kittens::Woman do
  describe '.initialize' do
    subject { described_class.new }

    it 'sets starting x position to 0' do
      expect(subject.x_position).to eq 0
    end

    it 'sets starting y position to 0' do
      expect(subject.y_position).to eq 0
    end

    it 'sets starting direction to north' do
      expect(subject.direction).to eq :north
    end
  end

  describe '#forward' do
    subject { described_class.new(direction: direction).forward }

    context 'when facing north' do
      let(:direction) { :north }

      it 'increments y position' do
        expect(subject.y_position).to eq 1
      end

      it 'keeps x position' do
        expect(subject.x_position).to eq 0
      end
    end

    context 'when facing east' do
      let(:direction) { :east }

      it 'increments x position' do
        expect(subject.x_position).to eq 1
      end

      it 'keeps y position' do
        expect(subject.y_position).to eq 0
      end
    end

    context 'when facing south' do
      let(:direction) { :south }

      it 'decrements y position' do
        expect(subject.y_position).to eq(-1)
      end

      it 'keeps x position' do
        expect(subject.x_position).to eq 0
      end
    end

    context 'when facing west' do
      let(:direction) { :west }

      it 'decrements x position' do
        expect(subject.x_position).to eq(-1)
      end

      it 'keeps y position' do
        expect(subject.y_position).to eq 0
      end
    end
  end

  describe '#move' do
    subject { described_class.new }

    it 'allows forward movement' do
      subject.move(:forward)
      expect(subject.x_position).to eq(0)
      expect(subject.y_position).to eq(1)
    end

    it 'allows rotation left' do
      subject.move(:left)
      expect(subject.direction).to eq(:west)
    end

    it 'allows rotation right' do
      subject.move(:right)
      expect(subject.direction).to eq(:east)
    end

    it 'throws exception for unknown movement' do
      expect do
        subject.move('down')
      end.to raise_error(Kittens::Errors::InvalidDirection)
    end
  end
end
