paddedZerosOfFactorial :: Int -> Int
paddedZerosOfFactorial n = 
  min factorsOfTwo factorsOfFive
    where
      factorsOfFive = sum $ takeWhile (>0) $ map (\x -> n `div` (5^x)) [1..]
      factorsOfTwo = sum $ takeWhile (>0) $ map (\x -> div n (2^x)) [1..]

factorial :: Integer -> Integer
factorial n = product [1..n]