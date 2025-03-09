-- think up functions with some certain signatures

foo :: (Int -> Int) -> Int
foo f = f 0

bar :: (Int -> Int) -> (Int -> Int)
bar f = f

foobar :: (Int -> Int) -> (Int -> Int) -> (Int -> Int)
foobar f g = f . g