require 'minitest/spec'
require 'minitest/autorun'
require 'spiralize'

describe Spiralize do
   it "returns an empty string for an empty matrix" do
    matrix = Matrix[]
    puts matrix.spiralize
    matrix.spiralize.must_equal ""
  end

  it "returns a spiralized matrix of one element properly" do
    matrix = Matrix[["A"]]
    matrix.spiralize.must_equal "a"
  end

  it "returns a spiralized matrix of a small number of elements properly" do
    matrix = Matrix[["a","b"], ["c","d"]]
    matrix.spiralize.must_equal "a b d c"
  end

  it "returns a spiralized matrix of a large number of elements properly" do
    matrix = Matrix.columns([["A","E","I"],["B","F","J"],["C","G","K"],["D","H","L"]])
    matrix.spiralize.must_equal "a b c d h l k j i e f g"
  end

  it "returns a spiralized matrix with some duplicate elements properly" do
    matrix = Matrix.columns([["A","E","I"],["B","F","J"],["C","G","K"],["B","E","C"]])
    matrix.spiralize.must_equal "a b c b e c k j i e f g"
  end
end
