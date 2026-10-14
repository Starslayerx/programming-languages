# 写一个选随机数的程序。该程序让玩家猜随机数是多少，并告诉玩家是猜大了还是猜小了

=begin
MIN = 1
MAX = 100

print "猜数字 #{MIN} 到 #{MAX} 之间："
input = gets.chomp.to_i
rand_num = rand(MIN..MAX)

while input != rand_num
  if input < rand_num
    puts '猜小了'
  else
    puts '猜大了'
  end
  print "猜错了，再猜一次："
  input = gets.chomp.to_i
end

puts "猜对了！答案是 #{rand_num}"
=end

=begin
MIN = 1
MAX = 100
rand_num = rand(MIN..MAX)

print "猜数字 #{MIN} 到 #{MAX} 之间："

input = 0
while input != rand_num
  line = gets
  break if line.nil?

  input = Integer(line, exception: false)

  if input.nil?
    print '请输入有效的整数：'
    next
  end

  unless (MIN..MAX).cover?(input)
    print "请输入 #{MIN} 到 #{MAX} 之间的整数："
    next
  end

  if input < rand_num
    print '猜小了：'
  elsif input > rand_num
    print '猜大了：'
  else
    puts "猜对了！答案是 #{rand_num}"
  end
end
=end


MIN = 1
MAX = 100
rand_num = rand(MIN..MAX)

print "猜数字 #{MIN} 到 #{MAX} 之间："

loop do
  line = gets
  break if line.nil?

  input = Integer(line, exception: false)

  if input.nil?
    print '请输入有效的整数：'
    next
  end

  unless (MIN..MAX).cover?(input)
    print "请输入 #{MIN} 到 #{MAX} 之间的整数："
    next
  end

  if input < rand_num
    print '猜小了：'
  elsif input > rand_num
    print '猜大了：'
  else
    puts "猜对了！答案是 #{rand_num}"
    break
  end
end
