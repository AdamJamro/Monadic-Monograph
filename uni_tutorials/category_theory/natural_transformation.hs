-- Maybe -> []

alpha :: Maybe a -> [a]
alpha Nothing = []
alpha (Just x) = [x]

beta :: Maybe a -> Either () a
beta Nothing = Left ()
beta (Just x) = Right x