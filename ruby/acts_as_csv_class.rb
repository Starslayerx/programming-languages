=begin
class ActsAsCsv
  def self.act_as_csv  # 类方法
    define_method 'read' do  # 给类添加实例方法
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @result << row.chomp.split(', ')
      end
    end

    define_method 'headers' do
      @headers
    end

    define_method 'csv_contents' do
      @result
    end

    define_method 'initialize' do
      @result = []
      read
    end
  end
end

class RubyCsv < ActsAsCsv  # 继承
  act_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
=end


module ActAsCsv
  def self.included(base)  # hooks: include 时自动调用
    base.extend ClassMethods  # 扩展 类方法
  end

  module ClassMethods
    def act_as_csv
      include InstanceMethods  # 扩展 实例方法
    end
  end

  module InstanceMethods
    # 实例方法：初始化读取 csv
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end
  end
end

class RubyCsv  # 非继承，mixin
  include ActAsCsv  # 混入 ActAsCsv 并安装 ClassMethods 类方法
  act_as_csv  # 使用 ClassMethods 里面的 类方法 act_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
