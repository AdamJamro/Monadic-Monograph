data Logger a = Logger [String] a
    deriving (Show, Eq)

printLogs :: Logger a -> [String]
printLogs (Logger logs _) = logs

instance Functor Logger where
    fmap f (Logger logs a) = Logger logs (f a)

instance Applicative Logger where
    pure = Logger [] -- empty log wrapper constructor
    Logger logs1 f <*> Logger logs2 a = Logger (logs1 ++ logs2) (f a)

instance Monad Logger where
    return :: a -> Logger a
    return = pure
    (>>=) :: Logger a -> (a -> Logger b) -> Logger b
    Logger logs1 a >>= f = let Logger logs2 b = f a
                          in Logger (logs1 ++ logs2) b



logAdd :: Int -> Int -> Logger Int
logAdd x y = Logger ["+" ++ show y] (x + y)


appendLog :: Logger Int -> [String] -> Logger Int
appendLog (Logger logs x) postfixLog = Logger (logs ++ postfixLog) x

idLogger :: Logger Int -> Logger Int
idLogger (Logger logs x) = appendLog (Logger logs x) [show x]


addLogger :: Logger Int -> Int -> Logger Int
addLogger (Logger logs x) y = Logger logs x >>= \a -> Logger (logs ++ ["+" ++ show y]) (a + y)

loggerExample :: Logger Int
loggerExample = do
    a <- idLogger (pure 0)
    b <- logAdd a 10
    c <- logAdd b 30
    d <- logAdd c 40
    Logger [] d