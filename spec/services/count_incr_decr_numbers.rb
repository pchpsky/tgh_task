require 'rails_helper'

RSpec.describe CountIncrDecrNumbers do
  subject { described_class.new }

  describe '#call' do
    cases = [
      [0, 1],
      [1, 10],
      [2, 100],
      [3, 475],
      [4, 1675],
      [5, 4954],
      [6, 12952]
    ]

    cases.each do |n, expected|
      it "returns #{expected} for #{n}" do
        expect(subject.call(n)).to eq(expected)
      end
    end
  end
end
