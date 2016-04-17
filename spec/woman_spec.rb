require 'spec_helper'

describe 'Woman' do
  describe '.initialize' do
    subject { Woman.new }

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
    subject { Woman.new(direction: direction).forward }

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
        expect(subject.y_position).to eq -1
      end

      it 'keeps x position' do
        expect(subject.x_position).to eq 0
      end
    end

    context 'when facing west' do
      let(:direction) { :west }

      it 'decrements x position' do
        expect(subject.x_position).to eq -1
      end

      it 'keeps y position' do
        expect(subject.y_position).to eq 0
      end
    end
  end
end