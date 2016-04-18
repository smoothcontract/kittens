require 'spec_helper'

describe Kittens::Compass do
  describe '#direction' do
    subject { described_class.new }

    it 'throws exception when setting an unknown direction' do
      expect do
        subject.direction = :foo
      end.to raise_error(Kittens::Errors::InvalidDirection)
    end
  end

  describe '#left' do
    let(:compass) { described_class.new }
    subject { compass.left }

    it 'rotates from north to west' do
      compass.direction = :north
      expect(subject).to eq :west
    end

    it 'rotates from west to south' do
      compass.direction = :west
      expect(subject).to eq :south
    end

    it 'rotates from south to east' do
      compass.direction = :south
      expect(subject).to eq :east
    end

    it 'rotates from east to north' do
      compass.direction = :east
      expect(subject).to eq :north
    end
  end

  describe '#right' do
    let(:compass) { described_class.new }
    subject { compass.right }

    it 'rotates from north to east' do
      compass.direction = :north
      expect(subject).to eq :east
    end

    it 'rotates from east to south' do
      compass.direction = :east
      expect(subject).to eq :south
    end

    it 'rotates from south to west' do
      compass.direction = :south
      expect(subject).to eq :west
    end

    it 'rotates from west to north' do
      compass.direction = :west
      expect(subject).to eq :north
    end
  end
end
