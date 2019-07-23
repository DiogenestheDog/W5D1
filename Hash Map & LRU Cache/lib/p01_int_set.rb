class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(@max) {false}
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num >= @store.length
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self.include?(num)
      self[num] << num
      @count += 1
      if @count == num_buckets
        resize!
      end
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  def inspect
    @store
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    if @count == num_buckets
      #Create 2x size array
      new_store = ResizingIntSet.new(num_buckets * 2)
      #sort old_items into new array 
      @store.each do |sub_arr|
        sub_arr.each do |num|
          new_store.insert(num)
        end
      end
      @store = new_store.store
      # set new variables, remove old ones
    end
  end
end
