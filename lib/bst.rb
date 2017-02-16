require 'byebug'
class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root == nil
      @root = BSTNode.new(value)
    else
      BinarySearchTree.insert!(@root, value)
    end

  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
BinarySearchTree.postorder!(@root)
  end

  def preorder
BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    if node == nil
      return BSTNode.new(value)
    end
    if value > node.value
      node.right = BinarySearchTree.insert!(node.right, value)
    else
      node.left = BinarySearchTree.insert!(node.left, value)
    end
    return node
  end

  def self.find!(node, value)
    return nil if node == nil

    return node if node.value == value
    if value > node.value
      BinarySearchTree.find!(node.right, value)

    else
      BinarySearchTree.find!(node.left, value)

    end
  end

  def self.preorder!(node)
    return [] if node == nil
    return [node.value] if node.left == nil && node.right == nil
    return [node.value] + BinarySearchTree.preorder!(node.left) + BinarySearchTree.preorder!(node.right)

  end

  def self.inorder!(node)

    return [] if node == nil
    return [node.value] if node.left == nil && node.right == nil
    return BinarySearchTree.inorder!(node.left) + [node.value] + BinarySearchTree.inorder!(node.right)
  end

  def self.postorder!(node)
    return [] if node == nil
    return [node.value] if node.left == nil && node.right == nil
    return BinarySearchTree.postorder!(node.left) + BinarySearchTree.postorder!(node.right) + [node.value]
  end

  def self.height!(node)
    return -1 if node == nil
    return 0 if node.right == nil && node.left == nil

    left = 1 + BinarySearchTree.height!(node.right)
    right = 1 + BinarySearchTree.height!(node.left)

    left > right ? left : right

  end

  def self.max(node)
    return node if node.right == nil
    BinarySearchTree.max(node.right)
  end

  def self.min(node)
    return node if node.left == nil
    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)
    return nil if node == nil
    if node.left == nil
      node = nil
      return node
    end
    if node.left.left == nil
      node.left = node.left.right
      return node.left
    end
    BinarySearchTree.delete_min!(node.left)

  end

  def self.delete!(node, value)
    return nil if node == nil
    return nil if node.left == nil && node.right == nil
    if node.right && node.right.value == value
      node.right = node.right.right || nil
      return node.right
    end
    if node.left && node.left.value == value
      node.left = node.left.left || nil
      return node.left
    end
    BinarySearchTree.delete!(node.left, value) if value < node.value
    BinarySearchTree.delete!(node.right, value) if value > node.value
  end
end
