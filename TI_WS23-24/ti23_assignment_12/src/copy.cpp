#include <cstdint>
#include <cstdlib>
#include <iostream>

extern "C" {
    void copy_c( uint64_t const * i_a,
                 uint64_t       * o_b );
    void copy_asm( uint64_t const * i_a,    //x0
                   uint64_t       * o_b );  //x1
    void copy_asm_loop( uint64_t const * i_a,   //x0
                        uint64_t       * o_b ); //x1
}

int main() {
    uint64_t l_a[7] = { 1, 21, 43, 78, 89, 91, 93 };
    uint64_t l_b_0[7] = { 0 };
    uint64_t l_b_1[7] = { 0 };

    uint64_t l_b_2[7] = { 0 };

    // copy_c
    std::cout << "### calling copy_c ###" << std::endl;
    copy_c( l_a,l_b_0 );

    for( unsigned short l_va = 0; l_va < 7; l_va++ ) {
        std::cout << l_a[l_va] << " / " << l_b_0[l_va] << std::endl;
    }


    // copy_asm
    std::cout << "### calling copy_asm ###" << std::endl;
    copy_asm( l_a,l_b_1 );
  
    for( unsigned short l_va = 0; l_va < 7; l_va++ ) {
        std::cout << l_a[l_va] << " / " << l_b_1[l_va] << std::endl;
    }


    // copy_asm mit loop
    std::cout << "### calling copy_asm_loop ###" << std::endl;
    copy_asm_loop( l_a, l_b_2 );
  
    for( unsigned short l_va = 0; l_va < 7; l_va++ ) {
        std::cout << l_a[l_va] << " / " << l_b_2[l_va] << std::endl;
    }

    return EXIT_SUCCESS;
}

/**
 * The 2 functions copy_asm and copy_c in the template shall perform the same task:
 * copying 7 consecutive 64bit values from memory to 7 other consecutive adresses in memory, namely, from an array i_a to another array o_b
 **/