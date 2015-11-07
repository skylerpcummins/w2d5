class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total = 0
    values = self.map {|el| el.hash}

    values.each_with_index do |el, i|
      total += el * (i+1)
    end

    total.hash
  end
end

class String
  def hash
    chars = self.split("")

    ascii_vals = chars.map { |char| char.ord }

    ascii_vals.hash
  end
end

class Hash
  def hash
    values = self.values.sort.hash
    keys = self.keys.sort.hash

    (values + keys).hash
  end
end
