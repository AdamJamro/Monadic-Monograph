main = do
    putStrLn "hello"
    putStrLn ("please look: " ++ show (filter odd [10..20]))
    print (fact01 5)


fact01 n = if n==0 then 1 else fact01 (n-1)

fact02 0 = 1
fact02 1 = 1
fact02 n = n * fact02 (n-2) 

fib 0 = 1
fib 1 = 1
fib n = fib(n-1) + fib(n-2)
