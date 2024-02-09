#include <stdint.h>

uint64_t mod_c ( uint64_t x_in, uint16_t y_in){
    uint64_t l_x = x_in;
    uint64_t l_y = y_in;
    while ( l_x >= l_y ) {
        l_x = l_x - l_y;
    }
    return l_x;
}

uint64_t gcd_c ( uint64_t x_in, uint64_t y_in ) {
    uint64_t l_x = x_in;
    uint64_t l_y = y_in;
    uint64_t l_r;
    if (l_x == 0) {
        return l_y;
    }
    while (l_y != 0 ) {
        l_r = mod_c (l_x, l_y);
        l_x = l_y;
        l_y = l_r;
    }
    return l_x;
}

int main() {
    return 0;
}