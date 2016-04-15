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


  describe '#left' do
    let(:woman) { Woman.new }
    subject { woman.left }

    it 'rotates from north to west' do
      woman.direction = :north
      expect(subject).to eq :west
    end

    it 'rotates from west to south' do
      woman.direction = :west
      expect(subject).to eq :south
    end

    it 'rotates from south to east' do
      woman.direction = :south
      expect(subject).to eq :east
    end

    it 'rotates from east to north' do
      woman.direction = :east
      expect(subject).to eq :north
    end

    #FIXME add better validation for setting direction
    it "doesn't move if facing in an unknown direction" do
      woman.direction = :foo
      expect(subject).to eq :foo
    end
  end
end
