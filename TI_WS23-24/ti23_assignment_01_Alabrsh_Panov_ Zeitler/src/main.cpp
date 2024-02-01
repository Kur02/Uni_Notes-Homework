#include <bitset>
#include <iostream>

int main( int argc, char * argv[] ) {
/*unsigned char l_data = 5;
std::cout << "data␣=␣" << std::bitset< 8 >( l_data ) << std::
 endl;
return EXIT_SUCCESS;
*/

unsigned char l_data1 = 1;
unsigned char l_data2 = 255;
unsigned char l_data3 = l_data2 + 1;
unsigned char l_data4 = 0xF0;
unsigned char l_data5 = 0b10111;
unsigned char l_data6 = 'J';
char l_data7 = -11;
unsigned int l_data8 = 1u << 7;
unsigned int l_data9 = l_data8 << 23;
unsigned int l_data10 = 0xFFFFFFFF >> 3;
unsigned int l_data11 = 0b1001 ^ 0b11011;
unsigned int l_data12 = ~0b0011;
unsigned int l_data13 = 0xB0 & 0b1010101;
unsigned int l_data14 = 0b011 | 0b110;
unsigned int l_data15 = 0x7c0;
int l_data16 = -1984;

std::cout << "l_data1:  " << std::bitset<8>(l_data1) << std::endl;
std::cout << "l_data2:  " << std::bitset<8>(l_data2) << std::endl;
std::cout << "l_data3:  " << std::bitset<8>(l_data3) << std::endl;
std::cout << "l_data4:  " << std::bitset<8>(l_data4) << std::endl;
std::cout << "l_data5:  " << std::bitset<8>(l_data5) << std::endl;
std::cout << "l_data6:  " << std::bitset<8>(l_data6) << std::endl;
std::cout << "l_data7:  " << std::bitset<8>(l_data7) << std::endl;
std::cout << "l_data8:  " << std::bitset<32>(l_data8) << std::endl;
std::cout << "l_data9:  " << std::bitset<32>(l_data9) << std::endl;
std::cout << "l_data10: " << std::bitset<32>(l_data10) << std::endl;
std::cout << "l_data11: " << std::bitset<32>(l_data11) << std::endl;
std::cout << "l_data12: " << std::bitset<32>(l_data12) << std::endl;
std::cout << "l_data13: " << std::bitset<32>(l_data13) << std::endl;
std::cout << "l_data14: " << std::bitset<32>(l_data14) << std::endl;
std::cout << "l_data15: " << std::bitset<32>(l_data15) << std::endl;
std::cout << "l_data16: " << std::bitset<32>(l_data16) << std::endl;

return EXIT_SUCCESS;

}