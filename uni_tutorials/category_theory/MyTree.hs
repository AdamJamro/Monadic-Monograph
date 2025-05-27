data MyTree a = Empty | Leaf a | Node (MyTree a) (MyTree a)
    deriving (Eq)

instance Show a => Show (MyTree a) where
    show = myShow 0
        where
        myShow depth Empty = "(Nil)"
        myShow depth (Leaf x) = "(Leaf " ++ show x ++ ")"
        myShow depth (Node left right) =
            "(Node \n"
            ++ padding (depth + 1) ++ myShow (depth + 1) left ++ "\n"
            ++ padding (depth + 1) ++ myShow (depth + 1) right ++ "\n"
            ++ padding depth ++ ")"
        padding :: Int -> String
        padding n = concat (replicate n "\t")

instance Functor MyTree where
    fmap _ Empty = Empty
    fmap f (Leaf x) = Leaf (f x)
    fmap f (Node left right) = Node (fmap f left) (fmap f right)

instance Foldable MyTree where
    foldMap :: Monoid m => (a -> m) -> MyTree a -> m
    foldMap _ Empty = mempty
    foldMap f (Leaf x) = f x
    foldMap f (Node left right) = foldMap f left `mappend` foldMap f right
    -- foldr :: (a -> b -> b) -> b -> MyTree a -> b
    -- foldr _ acc Empty = acc
    -- foldr f acc (Leaf x) = f x acc
    -- foldr f acc (Node left right) = foldr f (foldr f acc right) left


height :: MyTree a -> Int
height Empty = 0
height (Leaf _) = 1
height (Node left right) = 1 + max (height left) (height right)



fooTree = Node
    (Node
        (Node
            (Node
                (Leaf 1)
                (Leaf 2)
            )
            (Leaf 3)
        )
        (Leaf 4)
    )
    (Node
        (Leaf 5)
        (Node
            (Leaf 6)
            (Node
                Empty
                Empty
            )
        )
    )


bfsTree :: MyTree a -> [a]
bfsTree tree = bfs [tree]
  where
    bfs [] = []
    bfs tree = concatMap getLeafs tree ++ bfs (concatMap getAncestors tree)
      where
        getLeafs :: MyTree a -> [a]
        getLeafs (Leaf x) = [x]
        getLeafs _ = []
        getAncestors :: MyTree a -> [MyTree a]
        getAncestors (Node left right) = [left, right]
        getAncestors _ = []

nbLeafs :: MyTree a -> Int
nbLeafs = foldr (\x acc -> acc + 1) 0

nbNodes :: MyTree a -> Int
nbNodes Empty = 0
nbNodes (Leaf x) = 0
nbNodes (Node left right) = 1 + nbNodes left + nbNodes right
