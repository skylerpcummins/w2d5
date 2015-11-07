class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable

  attr_reader :head

  def initialize
    @head = Link.new
    @tail = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.nil?
  end

  def get(key)
    current_link = @head
    until current_link == nil
      if current_link.key == key
        return current_link.val
      else
        current_link = current_link.next
      end
    end
    nil
  end

  def include?(key)
    current_link = @head
    until current_link == nil
      return true if current_link.key == key
      current_link = current_link.next
    end
    false
  end

  def insert(key, val)
    x = Link.new(key, val)
    @tail.next = x
    @tail = x
  end

  def remove(key)
    if @head.key == key
      @head == @head.next
    else
      current_link = @head
      removed = false
      until removed || current_link.nil?
        if current_link.next.key == key
          current_link.next = current_link.next.next
          current_link.next = nil
          removed = true
        else
          current_link = current_link.next
        end
      end
    end
  end

  def each(&blk)
    current_link = @head
    until current_link == nil
      blk.call(current_link)
      current_link = current_link.next
    end
    
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
