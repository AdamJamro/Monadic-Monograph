-- approx calculates the e constant i.e. the sum of 1/k! for k from 0 to n

-- inefficient and overflows
approx :: Int -> Double
approx n = sum $ map (\k -> 1 / fromIntegral (factorial k)) [0..n]
    where factorial 0 = 1
          factorial k = k * factorial (k - 1)

-- optimized
approx' :: Int -> Double
approx' n = sum $ foldl (\acc x -> (head acc / fromIntegral x) : acc ) [1] [1..n]
