#include <iostream>

int main() {
    // f(x) = 1 + x * (x + 1)
    auto f = [](int x) { return 1 + x * (x + 1); };
    
    // g(x, y) = x + y^2
    auto g = [](int x, int y) { return x + y * y; };

    // h(y, x) = x + y^2
    auto h = [](int y, int x) { return x + y * y; };

    std::cout << "f(2) = " << f(2) << std::endl;
    std::cout << "g(2, 3) = " << g(2, 3) << std::endl;
    std::cout << "h(3, 2) = " << h(3, 2) << std::endl;

    return 0;
}