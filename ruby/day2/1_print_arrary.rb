# 有一个数组，包含16个数字。仅用each方法打印数组中的内容，一次打印4个数字。然后，用可枚举模块的each_slice方法重做一遍

numbers = (1..16).to_a

# 1. use each
i = 1
numbers.each do |num|
  unless i % 4 == 0
    print "#{num} "
  else
    puts num
  end
  i += 1
end

puts '-'*10

# 2. use each_slice
numbers.each_slice(4) {|slice| puts slice.join(' ')}
