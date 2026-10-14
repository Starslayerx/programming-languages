=begin
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end
=end

# 我们前面实现了一个有趣的树类Tree，但它不具有简洁的用户接口，来设置一棵新树，为它写一个初始化方法，接受散列表和数组嵌套的结构。写好之后，你可以这样设置新树：{'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }

class NewTree
  attr_accessor :node_name, :children

  def initialize(data)
    data.each do |name, children_data|
      @node_name = name
      @children = []

      children_data.each do |child_name, descendants|
        children << NewTree.new({child_name => descendants})
      end
    end
  end

  def visit_all(&block)
    visit(&block)
    children.each { |child| child.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end
end

new_tree =NewTree.new({
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {},
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {},
    },
  },
})

new_tree.visit {|node| puts node.node_name}

puts

new_tree.visit_all {|node| puts node.node_name}
