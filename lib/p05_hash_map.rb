require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    i = key.hash % num_buckets
    @store[i].include?(key)
  end

  def set(key, val)
    resize! if @count == num_buckets
    i = key.hash % num_buckets
    if include?(key)
      link = @store[i].find { |link| link.key == key }
      link.val = val
    else
      @store[i].insert(key, val)
      @count += 1
    end
  end

  def get(key)
    i = key.hash % num_buckets
    @store[i].get(key)
  end

  def delete(key)
    i = key.hash % num_buckets
    if include?(key)
      @store[i].remove(key)
      @count -= 1
    end
  end

  def each(&blk)
    # @store.each do |list|
    #   list.each {|key, value| blk.call(link) }
    # end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    links = []
    @store.each do |list|
      list.each do |link|
        links << link
      end
    end
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    @count = 0
    links.each { |link| set(link.key, link.val)}

  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
