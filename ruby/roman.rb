class Roman
  def self.method_missing name, *args
    # - name: 方法名
    roman = name.to_s

    # ! 表示替换并直接修改
    roman.gsub!('IV', 'IIII')
    roman.gsub!('IX', 'VIIII')
    roman.gsub!('XL', 'XXXX')
    roman.gsub!('XC', 'LXXXX')

    (roman.count('I') +
     roman.count('V') * 5 +
     roman.count('X') * 10 +
     roman.count('L') * 50 +
     roman.count('C') * 100)
  end
end

puts Roman.X
puts Roman.XC
puts Roman.XII
puts Roman.X
