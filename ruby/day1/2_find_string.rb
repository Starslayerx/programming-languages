# 在字符串"Hello, Ruby."中，找出"Ruby."所在下标

text = 'Hello, Ruby.'
target = 'Ruby.'

=begin
i = 0
while text[i...(i+target.size)] != target
  i += 1
end

puts "Index of `#{target}` in `#{text}` is #{i}!"
=end

index = text.index(target)
puts index.nil? ? '未找到' : "下标是 #{index}"
