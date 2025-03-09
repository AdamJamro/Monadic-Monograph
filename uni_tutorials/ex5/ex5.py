# f(x) = 1 + x * (x + 1)
f = lambda x: 1 + x * (x + 1)

# g(x, y) = x + y^2
g = lambda x, y: x + y ** 2

# h(y, x) = x + y^2
h = lambda y, x: x + y ** 2

print(f(2))        # Wynik: 7
print(g(2, 3))     # Wynik: 11
print(h(3, 2))     # Wynik: 11