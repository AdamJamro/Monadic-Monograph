f = \x -> 1 + x * (x + 1)

g = \x y -> x + y^2

h = \y x -> x + y^2

main :: IO()
main = do
    print $ f 2     -- result: 7
    print $ g 2 3   -- result: 11
    print $ h 3 2   -- result: 11

