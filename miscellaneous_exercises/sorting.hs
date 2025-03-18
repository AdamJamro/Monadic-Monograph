qS [] = []
qS (x:xs) = (qS [y| y<-xs, y<x]) ++
            [x] ++
            (qS [y| y<-xs, y>=x])


partition _ [] = ([],[])
partiiton p (x:xs) = if p x then ((x:l),r)
                     else (l,(x:r))
                     where (l,r) = partition p xs


qSort []     = []
qSort [x]    = [x] -- mini optimization
qSort (x:xs) = (qSort l) ++ [x] ++ (qSort r)
                where
                  (l,r) = partition (<x) xs


inSort [] = []
inSort [x]= [x]
inSort (x:xs) = l ++ [x] ++ r
                where axs = inSort xs
                      (l,r) = partition (<x) axs
