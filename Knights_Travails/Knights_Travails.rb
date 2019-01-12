require_relative '../skeleton/lib/00_tree_node'

class KnightPathFinder

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        build_move_tree
    end

    def build_move_tree

    end 

    def find_path

    end

    def new_move_positions

    end

    def self.valid_moves(pos)
        [
            [pos[0] - 2, pos[1] - 1],
            [pos[0] - 2, pos[1] + 1],
            [pos[0] - 1, pos[1] - 2],
            [pos[0] - 1, pos[1] + 2],
            [pos[0] + 2, pos[1] + 1],
            [pos[0] + 2, pos[1] - 1],
            [pos[0] + 1, pos[1] + 2],
            [pos[0] + 1, pos[1] - 2]
        ].select {|sub| sub.first >= 0 && sub.last >= 0 && sub.first <= 7 && sub.last <= 7}
    end
end