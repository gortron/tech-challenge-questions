require 'rspec'

# class Array
def spiralize(input)
  matrix = input
  return [] if !matrix or matrix.empty?

  output = []

  # -> in this context is interchangeable with Proc.new and lambda
  actions = {
    top: ->{matrix.shift},
    right: ->{matrix.map{|row| row.pop}},
    bottom: ->{matrix.pop.reverse},
    left: ->{matrix.map{|row| row.shift}.reverse}
  }

  # top, right, bottom, left, top, right ...
  cases = actions.keys.cycle

  output.concat(actions[cases.next].call()) until matrix.empty?

  output

  # until matrix.empty? do
  #   # top
  #   output.push(matrix.shift)
  #   # right
  #   output.push(matrix.map{|row| row.pop}) if !matrix.empty?
  #   # bottom
  #   output.push(matrix.pop.reverse) if !matrix.empty?
  #   # left
  #   output.push(matrix.map{|row| row.shift}.reverse) if !matrix.empty?
  # end
  # output.flatten
end
# end

def make_spiral(height, width)
  # make an empty array with given dimensions
  output = Array.new(height) {Array.new(width, nil)}
  val = 1
  top, left = 0, 0
  bottom, right = height - 1, width - 1

  # output[row][col]
  while (top <= bottom and left <= right) do
    # Fill the first row from remaining rows
    (left..right).each do |i|
      output[top][i] = val
      val += 1
    end
    top += 1

    # Fill the last column from remaining columns
    (top..bottom).each do |i|
      output[i][right] = val
      val += 1
    end
    right -= 1
    
    # Fill the last row from remaining rows
    if top < bottom
      (right).downto(left).each do |i|
        output[bottom][i] = val
        val += 1
      end
      bottom -= 1
    end

    # Fill the first column from remaining columns
    if left < right
      (bottom).downto(top).each do |i|
        output[i][left] = val
        val += 1
      end
      left += 1
    end
  end
  output
end


describe 'Spiralizers' do
  let! (:empty) { [] }
  let! (:nil_input) { nil }
  let! (:matrix) {[[1,2,3],[4,5,6],[7,8,9]]}
  let! (:uneven_matrix) {[[1,2,3,4],[5,6,7,8],[9,10,11,12]]}
  describe '#spiralize' do
    context "invalid inputs" do
      it "returns [] for empty input" do
        expect(spiralize(empty)).to eql([])
        # expect(array.spiralize).to eql([1,2,3,6,9,8,7,4,5])
      end
      it "returns [] for nil input" do
        expect(spiralize(nil_input)).to eql([])
        # expect(array.spiralize).to eql([1,2,3,6,9,8,7,4,5])
      end
    end

    context "valid inputs" do
      it "returns array for square matrix" do
        expect(spiralize(matrix)).to eql([1,2,3,6,9,8,7,4,5])
      end
      it "returns array for uneven matrix" do
        expect(spiralize(uneven_matrix)).to eql([1,2,3,4,8,12,11,10,9,5,6,7])
      end
    end
  end
  describe '#make_spiral' do
    context "invalid inputs" do
      it "returns [] for 0, 0" do
        expect(make_spiral(0, 0)).to eql([])
      end
    end
    context "valid inputs" do
      it "returns square matrix for equal inputs" do
        expect(make_spiral(3, 3)).to eql([[1,2,3],[8,9,4],[7,6,5]])
      end
    end
  end
end
























# require 'rspec'

# class Array
#   # matrix[y][x]
#   # 1 2 3
#   # 4 5 6 => 1 2 3 6 9 8 7 4 5
#   # 7 8 9

#   def to_spiral_array_recursive
#     @spiral_array = []
#     recurse_top_left_to_bottom_right(0, 0, self.first.size-1, self.size-1)
#     @spiral_array
#   end

#   private

#   # 1 2 3 4      5 6 7      6 7
#   # 5 6 7 8   => 9 10 11 => 
#   # 9 10 11 12

#   def recurse_top_left_to_bottom_right(x1, y1, x2, y2)
#     top_left_to_bottom_right(x1, y1, x2, y2)
#     recurse_bottom_right_to_top_left(x1, y1+1, x2-1, y2) if x2 >= x1 and y2 >= y1
#   end

#   def recurse_bottom_right_to_top_left(x1, y1, x2, y2)
#     bottom_right_to_top_left(x1, y1, x2, y2)
#     recurse_top_left_to_bottom_right(x1+1, y1, x2, y2-1) if x2 >= x1 and y2 >= y1
#   end

#   def top_left_to_bottom_right(x1, y1, x2, y2)
#     # top left to top right
#     (x1..x2).each do |i|
#       @spiral_array << self[y1][i]
#     end

#     # top right (except top row) to bottom right
#     (y1+1..y2).each do |j|
#       @spiral_array << self[j][x2]
#     end
#     @spiral_array
#   end

#   def bottom_right_to_top_left(x1, y1, x2, y2)
#     # bottom right to bottom left
#     (x2).downto(x1).each do |i|
#       @spiral_array << self[y2][i]
#     end

#     # bottom left to top left
#     (y2-1).downto(y1).each do |j|
#       @spiral_array << self[j][x1]
#     end
#     @spiral_array
#   end



# end

# describe 'Array' do
#   let! (:array) {[[1,2,3],[4,5,6],[7,8,9]]}
#   let! (:uneven_array) do
#     [
#       [1,2,3,4,],
#       [5,6,7,8],
#       [9,10,11,12]
#     ]
#   end

#   describe '#to_spiral_array_recursive' do
#     it 'returns a clockwise array recursively' do
#       expect(array.to_spiral_array_recursive).to eql([1,2,3,6,9,8,7,4,5])
#       expect(uneven_array.to_spiral_array_recursive).to eql([1,2,3,4,8,12,11,10,9,5,6,7])
#     end
#   end
# end