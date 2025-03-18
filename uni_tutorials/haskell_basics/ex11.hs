ff :: (Integral b, Num a) => b -> a
ff = (2 ^)

gg :: Num a => a -> a
gg = (^ 2)


main :: IO ()
main = do
  print $ "ff(1..10) = " <> show (map ff [1..10])
  print $ "gg(1..10) = " <> show (map gg [1..10])

-- Output:
-- "ff(1..10) = [2,4,8,16,32,64,128,256,512,1024]"
-- "gg(1..10) = [1,4,9,16,25,36,49,64,81,100]"
--
-- The function ff is equivalent to 2^x, while gg is equivalent to x^2.