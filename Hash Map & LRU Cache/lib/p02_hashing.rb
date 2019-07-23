class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    
  end
end

class String
  def hash
    self.split("").each_with_index.reduce(0) {|acc, (char, i)| acc + (char.ord / 11 * i)}
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
