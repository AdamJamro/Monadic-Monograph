newtype Writer a b = Writer (a,b)
instance Functor (Writer a) where
    fmap f (Writer (alpha, beta)) =
        Writer (alpha, f beta)

newtype Writer' a b = Writer' (a, b)
instance Functor (Writer' a) where
    fmap :: (b -> c) -> Writer' a b -> Writer' a c
    fmap f (Writer' (alpha, beta)) =
        Writer' ((,) alpha (f beta))


newtype Reader a b = Reader (a -> b)
instance Functor (Reader a) where
    fmap :: (b1 -> b2) -> Reader a b1 -> Reader a b2
    fmap f (Reader g) = Reader (f . g)

-- Note: this is just a functor (regular covariant functor)
-- even thoug InvReader a b = constr (b -> a) would be contravariant
newtype Reader2 a b = Reader2 ((b -> a) -> a)
instance Functor (Reader2 a) where
    fmap :: (b1 -> b2) -> Reader2 a b1 -> Reader2 a b2
    fmap f (Reader2 g) = Reader2 (\h -> g (h . f))

-- Note: in general a composition of contravariant functors is a covariant functor


-- *actually we could also ask haskell to do the following for us automatically:
runReader :: Reader b a -> b -> a
runReader (Reader g) = g

runReader2 :: Reader2 a b -> (b -> a) -> a
runReader2 (Reader2 g) = g