{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use lambda-case" #-}
newtype T1 a b c = TT1 ( b -> a , c -> a )
newtype T2 a b c = TT2 (Either b c -> a)

foo :: T1 a b c -> T2 a b c
foo (TT1 (f, g)) = TT2 (
    \x -> case x of
        Left b -> f b
        Right c -> g c  
    )

bar :: T2 a b c -> T1 a b c
bar (TT2 f) = TT1 (
        f . Left,
        f . Right
    )