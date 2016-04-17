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

end
