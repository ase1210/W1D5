require 'byebug'

class PolyTreeNode

    attr_reader :children, :parent, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node)
        if @parent == nil 
            @parent = node 
            node.children << self unless node.children.include?(self)
        elsif node == nil
            old_parent = self.parent 
            old_parent.children.delete(self)
            @parent = node
        else 
            old_parent = self.parent 
            old_parent.children.delete(self)
            @parent = node
            node.children << self unless node.children.include?(self)
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent = nil
        raise unless children.include?(child_node)
    end

    def dfs(target)
        return self if self.value == target

        self.children.each do |child|
            node = child.dfs(target)
            return node unless node == nil
        end
        nil
    end

    def bfs(target)
        q = []
        return self if self.value == target

        q += self.children 
        until q.empty?
            curr_node = q.shift
            return curr_node if curr_node.value == target 
            q += curr_node.children
        end
        nil
    end

end