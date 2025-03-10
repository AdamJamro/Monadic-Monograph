#include <iostream>
#include <stdio.h>
#include <functional>
#include <string>
#include <math.h>

typedef unsigned long natural;
const natural argument = 10;

natural foo(const std::function<natural(natural)>& f, natural bound) {
    natural sum = 0;
    for (natural i = 0; i <= bound; i++) {
        sum += f(i);
    }
    return sum;
}

natural bar(const std::function<natural(natural)>& f, const natural& bound, const natural& accumulator = 0) {
    if (bound < 0 ) {
        throw std::invalid_argument("Error: The bound must be a natural number.");
    }
    if (bound == 0) {
        return f(bound) + accumulator;
    }
    return bar(f, bound - 1, f(bound) + accumulator);
}

double bim(const double x) {
    return [x](const double y) { return y * (y + 1) + x; }(std::sin(x));
}

int main(int argc, char** argv) {
    // if (argc < 2) {
        // std::cerr << "Error: At least two arguments are required." << std::endl;
        // return 1;
    // }

    // natural arg = std::stoul(argv[1]);
    
    auto my_lambda = [](natural x) -> natural { return x + 1; };

    std::cout << "foo(" << argument <<") = " << foo(my_lambda, argument) << std::endl;
    std::cout << "boo(" << argument <<") = " << bar(my_lambda, argument, 0) << std::endl;
    std::cout << "bim = " << bim(3.1415) << std::endl;
    return 0;
}