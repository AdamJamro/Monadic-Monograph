#include <iostream>
#include <stdio.h>
#include <functional>
#include <string>

typedef unsigned long natural;

natural foo(std::function<natural(natural)> f, natural n) {
    natural sum = 0;
    for (natural i = 0; i < n; i++) {
        sum += f(i);
    }
    return sum;
}

int main(int argc, char** argv) {
    if (argc < 2) {
        std::cerr << "Error: At least two arguments are required." << std::endl;
        return 1;
    }

    natural arg = std::stoul(argv[1]);
    std::cout << foo([](natural x) -> natural { return x; }, arg) << std::endl;
    return 0;
}