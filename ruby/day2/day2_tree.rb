#! /usr/bin/ruby 

# author: Chris Wood
# date: 12/30/12
# exercise: 7 Languages in 7 Weeks by Bruce Tate

# The Tree class was interesting, but it did not allow you to specify 
# a new tree with a clean user interface. Let the initializer accept 
# a nested structure of hashes. You should be able to specify a tree 
# like this: 
# 	{'grandpa' => 
# 		{ 'dad' => {'child 1' => {}, 'child 2' => {} },
# 		  'uncle' => {'child 3' => {}, 'child 4' => {} } 
# 	    } 
#   }.

class Tree
	attr_accessor :children, :node_name
	
	def initialize(structure={},name='') 
		puts "Building node #{name} with structure #{structure}"
		
		@node_name = name
		if name.empty? # the root case
			@node_name = structure.keys[0]
			structure = structure[@node_name]
		end
		@children = []

		structure.keys.each do |key_name|
			@children.push Tree.new(structure[key_name],key_name)
		end
	end

	def visit_all(&block)
		visit &block
		children.each { |c| c.visit_all &block }
	end

	def visit(&block) 
		block.call self
	end 
end

tree = Tree.new({'grandpa' => 
	{ 'dad' => {'child 1' => {}, 'child 2' => {} },
	  'uncle' => {'child 3' => {}, 'child 4' => {} } 
    } 
})

puts "visiting entire tree"
tree.visit_all {|node| puts node.node_name}