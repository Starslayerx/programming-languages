# 打印字符串"This is sentence number 1."，其中的数字1会一直变化到10

=begin
(1..10).each {|i| puts "This is sentence number #{i}."}
=end

(1..10).each do |i|
  puts "This is sentence number #{i}."
end
