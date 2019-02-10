def reverse_string(s)
  reverse_string_recursively(0, s)
end

def reverse_string_recursively(index, s)
  return '' if index >= s.size
  reverse_string_recursively(index + 1, s) + s[index]
end

def reverse_string_recursive(low, high, s)
  if (low >= high)
    return s
  end

  temp = s[low]
  s[low] = s[high]
  s[high] = temp 
  reverse_string_recursive(low+1, high-1, s)
end

puts reverse_string("hello")
puts reverse_string_recursive(0, 4, "hello")