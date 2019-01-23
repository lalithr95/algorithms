def is_substring(a, b)
  !!a.index(/#{b}/)
end

def is_rotation(a, b)
  c = a + a
  is_substring(c, b)
end


print is_rotation('waterbottle', 'erbottlewat')