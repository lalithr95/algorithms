def is_valid(s)
  brackets = []
  for i in 0..(s.size - 1) do
    if ['[', '(', '{'].include? s[i]
      brackets << s[i]
    end

    return false if s[i] == ']' && brackets.pop != '['
    return false if s[i] == '}' && brackets.pop != '{'
    return false if s[i] == ')' && brackets.pop != '('
  end

  brackets.size == 0
end

s = '([)]'
print is_valid(s)