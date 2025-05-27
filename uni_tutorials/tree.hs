
data STree a = Leaf a | Node (STree a) (STree a)
  deriving (Show, Eq)



