newtype T1 a = T1 (Int -> a)
instance Functor T1 where
    fmap :: (a -> b) -> T1 a -> T1 b
    fmap f (T1 g) = T1 (f . g)

-- newtype T2 a = T2 (a -> Int)
-- instance Functor T2 where
--     fmap :: (a -> b) -> T2 a -> T2 b
--     fmap f (T2 g) = T2 (g . f)

newtype T4 a = T4 ((a -> Int) -> Int)
instance Functor T4 where
    fmap :: (a -> b) -> T4 a -> T4 b
    fmap f (T4 g) = T4 (\h -> g (h . f))