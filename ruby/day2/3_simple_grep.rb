# 写一个简单的grep程序，把文件中出现某词组的行全都打印出来。这需要使用简单的正则表达式匹配，并从文件中读取各行。（这在Ruby中超乎想象地简单。）如果你愿意的话，还可以加上行号

filename = '1_print_arrary.rb'
word = 'number'

File.foreach(filename).with_index(1) do |line, line_number|
  if line.match?(/#{word}/)
    puts "#{line_number}: #{line}"
  end
end
