module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    return self
  end

  def my_select
    i = 0
    while i < self.length
      if yield(self[i]) == false
        self.delete_at(i)
        i -= 1
      end
      i += 1
    end
    return self
  end

  def my_all?
    i = 0
    while i < self.length
      if yield(self[i]) == false
        return false
      end
      i += 1
    end
    return true
  end

  def my_any?
    i = 0
    while i < self.length
      if yield(self[i]) == true
        return true
      end
      i += 1
    end
    return false
  end

  def my_none?
    i = 0
    while i < self.length
      if yield(self[i]) == true
        return false
      end
      i += 1
    end
    return true
  end

  def my_count
    if block_given? == false
      return self.size
    end

    i = 0
    count = 0
    while i < self.length
      if yield(self[i]) == true
        count += 1
      end
      i += 1
    end
    return count
  end

  def my_map
    i = 0
    while i < self.length
      self[i] = yield(self[i])
      i += 1
    end
    return self
  end

  def my_inject(init_value = 0)
    value = init_value
    i = 0
    while i < self.length
      value = yield(value, self[i])
      i += 1
    end
    return value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    return self
  end
end
