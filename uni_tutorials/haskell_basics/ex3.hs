-- module Ex3 where


f :: Int -> Int
f x = x ^2

g:: Int -> Int -> Int
g x y = x + 2 * y

h :: Int -> Int -> Int
h x y = f (g x y)


bar = \x y -> f (g x y)

-- bim x = f (g x)

-- foo x = x

-- bar f = f 0

-- foobar:: (Int -> Int) -> (Int -> Int)
-- foobar f = f

