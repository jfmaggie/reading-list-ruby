require "rails_helper"

class Calculator

  def self.add(first, second)
    first + second
  end

  def add(first, second)
    first + second
  end

  def subtract(first, second)
    first - second
  end
end

RSpec.describe Calculator do
  describe 'Class Methods' do
    describe '#self.add' do
      it 'should receive two arguments and return the sum' do
        expect(Calculator.add(1, 2)).to eq(3)
      end

      it 'should handle negative numbers' do
        expect(Calculator.add(-5, -6)).to eq(-11)
      end
    end
  end

  describe 'Instance Methods' do
    before :each do
      @calculator = Calculator.new
    end

    describe '#add' do
      it 'should receive two arguments and return the sum' do
        expect(@calculator.add(4, 5)).to eq(9)
      end
    end

    describe '#subtract' do
      it 'should receive two arguments and return the difference between the first and the second' do
        expect(@calculator.subtract(3, 2)).to eq(1)
      end

      it 'should handle negative properly' do
        expect(@calculator.subtract(-4, -5)).to eq(1)
      end
    end
  end
end
