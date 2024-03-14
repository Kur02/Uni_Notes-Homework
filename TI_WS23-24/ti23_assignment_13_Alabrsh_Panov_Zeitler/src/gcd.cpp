#include <cstdint>
#include <cstdlib>
#include <iostream>

extern "C" {
    uint64_t gcd_c ( uint64_t x, uint64_t y);
    uint64_t gcd_s ( uint64_t x, uint64_t y);
}

int main() {
    uint64_t l_x = 105;
    uint64_t l_y = 30;
    uint64_t l_r;

    std::cout << "### Computing GCD in C ###" << std::endl;
    l_r = gcd_c ( l_x, l_y );
    std::cout   << "x=" << l_x << ", " << "y=" << l_y << ", "
                << "r=" << l_r << std::endl;

    std::cout << "### Computing GCD in ASM ###" << std::endl;
    l_r = gcd_s ( l_x, l_y );
    std::cout   << "x=" << l_x << ", " << "y=" << l_y << ", "
                << "r=" << l_r << std::endl;

    return EXIT_SUCCESS;
}