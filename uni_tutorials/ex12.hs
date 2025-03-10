-- round x returns the nearest integer to x 
-- or the even integer if x is equidistant between two integers
myRound :: forall a b. (RealFrac a, Integral b) => a -> b
myRound = round

convertIntToFloat :: Int -> Float
convertIntToFloat = fromIntegral

convertIntToDouble :: Int -> Double
convertIntToDouble = fromIntegral

convertIntegerToFloat :: Integer -> Float
convertIntegerToFloat = fromIntegral

convertIntegerToDouble :: Integer -> Double
convertIntegerToDouble = fromIntegral

main :: IO ()
main = do
    let intVal = 42 :: Int
    let integerVal = 1234567890123456789 :: Integer

    print $ convertIntToFloat intVal       -- Output: 42.0
    print $ convertIntToDouble intVal      -- Output: 42.0
    print $ convertIntegerToFloat integerVal -- Output: 1.2345679e18
    print $ convertIntegerToDouble integerVal -- Output: 1.2345678901234568e18