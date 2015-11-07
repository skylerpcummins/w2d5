class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
  end

  def remove(num)
    validate!(num)
  end

  def include?(num)
    validate!(num)
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets

    i = num % num_buckets
    unless include?(num)
      @store[i] << num
      @count += 1
    end
  end

  def remove(num)
    i = num % num_buckets
    @count -=1 if @store[i].delete(num)

  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    numbers = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }

    numbers.each { |el| insert(el) }
    @count = numbers.length
  end
end
