# 修改前面的 CSV 应用程序 (acts_as_csv_class.rb) ，使它可以用 each 方法返回 CsvRow 对象。然后，在 CsvRow 对象上，对某个给定标题，用 method_missing 方法返回标题所在列的值


class CsvRow
  attr_accessor :headers, :values

  def initialize(headers, values)
    @headers = headers
    @values = values
  end

  # 处理不存在的方法
  def method_missing(name, *args)
    index = @headers.index(name.to_s)
    return super if index.nil?
    @values[index]
  end

  # 声明支持哪些动态方法
  def respond_to_missing?(name, include_private = false)
    @headers.include?(name.to_s) || super
  end
end


class ActsAsCsv
  def self.act_as_csv
    define_method 'read' do
      File.open(self.class.to_s.downcase + '.txt') do |file|
        @headers = file.gets.chomp.split(', ')
        file.each do |row|
          @result << CsvRow.new(@headers, row.chomp.split(', '))
        end
      end
    end

    define_method 'headers' do
      @headers
    end

    define_method 'rows' do
      @result
    end

    define_method 'initialize' do
      @result = []
      read
    end

    # 传入代码块
    define_method 'each' do |&block|
      rows.each(&block)
    end
  end
end

class RubyCsv < ActsAsCsv  # 继承
  act_as_csv
end

m = RubyCsv.new
m.each {|row| puts row.name}
puts
m.each {|row| puts row.age}
