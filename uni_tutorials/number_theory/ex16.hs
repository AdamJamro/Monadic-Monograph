
dcp:: Int -> Double
dcp n = let
           n2 = n * n
           coPrimes = [(k,l) | k<-[1..n], l<-[1..(k-1)], gcd k l == 1 ]
        in fromIntegral (length coPrimes) / fromIntegral( n2)


-- 0.31
-- 0.3043
-- 0.304191
-- 0.30397485 = dcp 10000
-- 0.3045

dcpList:: Int -> [Double]
dcpList n = [fromIntegral coPrimes / fromIntegral(t*t) | t<-[1..n],
              let coPrimes = 2 * length [(k,l) | k<-[1..t], l<-[1..(k-1)], gcd k l == 1]]


coprimeCounter :: Int -> Int
coprimeCounter 1 = 1
coprimeCounter n = coprimeCounter (n-1) + 2 * length [k | k<-[1..(n-1)], gcd k n == 1]

dcpRec:: Int -> Double
dcpRec n = fromIntegral(coprimeCounter n) / fromIntegral(n * n)


coprimeCountList = 0 : zipWith (\x y -> x + length [k | k<-[1..(y-1)], gcd k y == 1]) coprimeCountList [1..]
dcpList2 = zipWith (\x y -> fromIntegral(x)/fromIntegral(y*y)) coprimeCountList [1..]
