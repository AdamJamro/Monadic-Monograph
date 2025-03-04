import Criterion.Main

main :: IO ()
main = defaultMain [
            bgroup "fib" [
                bench "fib1" $ whnf fib 25,
                bench "fib2" $ whnf (\n -> fib2 !! n) 25
            ]
        ]

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

fib2 = 1 : 1 : [ a+b | (a,b) <- zip fib2 (tail fib2) ]

fib3 = 0:1: zipWith (+) fib3 (tail fib3)
