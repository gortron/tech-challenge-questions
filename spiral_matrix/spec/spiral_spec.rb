require 'spiralize'
require 'rspec'
# require 'spec_helper'

describe "spiralize" do
  context "for invalid inputs" do
    it "for empty input returns an empty array" do
      empty_matrix = []
      expect(spiralize(empty_matrix)).to eq([])
    end
    it "for nil input it returns an empty array" do
      nil_matrix = nil
      expect(spiralize(nil_matrix)).to eq([])
    end
  end
  context "for valid inputs" do
    it "spiralizes a square matrix" do
      square_matrix = [[1,2,3],[4,5,6],[7,8,9]]
      expect(spiralize(square_matrix)).to eq([1,2,3,6,9,8,7,4,5])
    end
    it "spiralizes a rectangular matrix" do
      rect_matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
      expect(spiralize(rect_matrix)).to eq([1,2,3,4,8,12,11,10,9,5,6,7])
    end
    it "spiralizes a linear matrix" do 
      lin_matrix = [[1],[2],[3]]
      expect(spiralize(lin_matrix)).to eq([1,2,3])
    end
  end
end