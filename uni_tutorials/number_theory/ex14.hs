
divides:: Int -> Int -> Bool
divides x y = (mod y x == 0)

perfect n = [y | y<-[1..n], y == sum [z | z<-[1..(y-1)], z `divides` y]]


-- perfect 100 000
-- [6,28,496,8128]
