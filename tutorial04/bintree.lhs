
A binary tree is either Nil or a Node.
The Node contains an element of type a, and left and right subtrees.

> data Tree a = Nil | Node a (Tree a) (Tree a)

If we want GHCi to be able to print our tree we need to say the Tree
datatype belongs in the Show typeclass (note we have to indent this
a little bit).

>  deriving (Show)

If we wanted to manually build a tree it would look like this.

> example :: Tree Int
> example = Node 5 (Node 2 Nil (Node 1 Nil Nil)) (Node 6 Nil Nil)

This is the example tree:

      5
     / \
    2   6
     \
      1

This is the function for computing the size of a tree.

> sizeTree :: Tree a -> Int

Size of an empty tree is 0.

> sizeTree Nil = 0

Size of a non-empty tree is 1 + size of the subtrees.

> sizeTree (Node _ left right) = 1 + (sizeTree left) + (sizeTree right)

To test this function we can use our example tree.

> testSize = sizeTree example == 4
> testSizeEmpty = sizeTree Nil == 0

