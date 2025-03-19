import Data.List (nub)

type Hetman = [Int]

generateHetman :: Int -> [Hetman]
generateHetman n = go n []
                   where
                      go 0 queens = [queens]
                      go k queens = [q : qeens | q <- [0..n-1]

generateHetman
