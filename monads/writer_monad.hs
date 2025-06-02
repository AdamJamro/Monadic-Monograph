import Data.Foldable
import Data.Monoid




newtype MyWriter m a = W { runWriter :: (a, m) } deriving (Show, Eq)
instance (Monoid a, Monoid m) => Semigroup (MyWriter m a) where
    (<>) (W (x1, m1)) (W (x2, m2)) = W (x1 <> x2, m1 <> m2)
instance (Monoid a, Monoid m) => Monoid (MyWriter m a) where
    mempty = W (mempty, mempty)
    mappend = (<>)

instance Functor (MyWriter m) where
    fmap f (W (a, m)) = W (f a, m)

instance Monoid m => Applicative (MyWriter m) where
    pure x = W (x, mempty)
    W (f, m1) <*> W (x, m2) = W (f x, m1 <> m2)

instance Monoid m => Monad (MyWriter m) where
    return = pure
    W (x, m1) >>= f = let W (y, m2) = f x in W (y, m1 <> m2)


trSin x = W (sin x, "sin(" ++ show x ++ ");")
trCos x = W (cos x, "cos(" ++ show x ++ ");")
trScc x = W (x + 1, "scc(" ++ show x ++ ");")

-- WrAdd (W (x, m1)) (W (y, m2)) = W (x + y, m1 <> m2)

-- WrMul (W (x, m1)) (W (y, m2)) = W (x * y, m1 <> m2)

plusInDo :: (Monad m, Num b) => m b -> m b -> m b
plusInDo mx my = do
    x <- mx
    y <- my
    return (x + y)


-- mx >> my === mx >>= \_ -> my

-- class (Monoid w, Monad m) => MyMonadWriter w m where
--     writer :: (a,w)         -> m a
--     tell :: w               -> m ()
--     listen :: m a           -> m (a, w)
--     pass :: m (a, w -> w)   -> m a

-- instance Monoid m => MyMonadWriter m (MyWriter m) where
--     writer (a, w) = W (a, w)
--     tell w = W ((), w)
--     listen (W (a, w)) = W (a, w)
--     pass (W (a, f)) = W (a, f mempty)