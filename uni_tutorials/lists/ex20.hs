import Data.List (inits, tails)
splits xs = [(take n xs, drop n xs) | n<-[1..(length xs - 1)]]

splits2 xs = [splitAt n xs | n<-[1..(length xs - 1)]]

splits3 xs = zip (inits xs) (tails xs)

