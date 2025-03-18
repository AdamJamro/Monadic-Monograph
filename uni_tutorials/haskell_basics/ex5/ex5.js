// f(x) = 1 + x * (x + 1)
const f = x => 1 + x * (x + 1);

// g(x, y) = x + y^2
const g = (x, y) => x + y * y;

// h(y, x) = x + y^2
const h = (y, x) => x + y * y;

console.log(f(2));    // Wynik: 7
console.log(g(2, 3)); // Wynik: 11
console.log(h(3, 2)); // Wynik: 11