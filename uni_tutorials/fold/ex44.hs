arithmeticMean :: Fractional a => [a] -> a
arithmeticMean xs = sum xs / fromIntegral (length xs)

harmonicMean :: Fractional a => [a] -> a
harmonicMean xs = fromIntegral (length xs) / sum (map (1/) xs)

geometricMean :: Floating a => [a] -> a
geometricMean xs = product xs ** (1 / fromIntegral (length xs))

quadraticMean :: Floating a => [a] -> a
quadraticMean xs = sqrt . sum $ map (^2) xs

variance :: Fractional a => [a] -> a
variance [] = 0
variance xs = sum (map (\x -> (x - mean) ^ 2) xs) / fromIntegral (length xs)
    where mean = sum xs / fromIntegral (length xs)