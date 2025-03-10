myUncurry :: ((a, b) -> c) -> a -> b -> c
myUncurry f x y = f (x, y)

myCurry :: (a -> b -> c) -> (a, b) -> c
myCurry f (x, y) = f x y