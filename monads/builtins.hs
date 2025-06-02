-- List monad: nondeterminsm
msublists [] = [[]]
msublists (x:xs) = do
    t <- [False, True]
    y <- msublists xs
    return $ if t then x : y else y


-- either
safeDiv :: Int -> Int -> Either String Int
safeDiv x 0 = Left $ "Cannot perform " ++ show x ++ "/0 ==> NaN"
safeDiv x y = Right (x `div` y)

eitherExample :: Either String Int
eitherExample = do
    a <- safeDiv 10 2
    b <- safeDiv a 3
    c <- safeDiv b 0  -- This will cause an error
    d <- safeDiv c 5
    return c
