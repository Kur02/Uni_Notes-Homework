#include <bitset>
#include <iostream>

int main(int argc, char* argv[]) {

    unsigned char l_data1 = 1; // Normale Binärdarstellung der Zahl
    unsigned char l_data2 = 255; // Normale Binärdarstellung der Zahl
    unsigned char l_data3 = l_data2 + 1; // Wird um 1 erhöht, was aber vom unsigned char aufgrund der Speicherbegrenzung nicht gespeichert wird; somit nur Nullen
    unsigned char l_data4 = 0xA1; // Normale Binärdarstellung der Hexadezimalen Zahl (A: 1010, 1: 0001)
    unsigned char l_data5 = 0b1001011; // Bereits binär angegeben
    unsigned char l_data6 = 'H'; // ASCII-Code: 48 -> 0100 1000
    char l_data7 = -4; // Darstellung mittels Komplement (Bitflip von 4: 11111011; +1 addieren: 1111100 (wie Ergebnis))
    unsigned int l_data8 = 1u << 11; // 1u -> unsigned 1; wird 11 Stellen nach Links geschoben
    unsigned int l_data9 = l_data8 << 21; // Ergebnis von l_data 8 wird um weitere 21 Stellen nach Links geschoben (11+21=32, die 1 ist somit auf dem 33. Bit und nicht mehr darstellbar)
    unsigned int l_data10 = 0xFFFFFFFF >> 5; // Alles Einsen und dann 5 Stellen nach rechts geschoben
    unsigned int l_data11 = 0b1001 ^ 0b01111; // XOR wird auf die Zahlen angewandt
    unsigned int l_data12 = ~0b1001; // Bitweises Komplement -> Bitflip
    unsigned int l_data13 = 0xF0 & 0b1010101; // Bitweises AND (0xF0: 1111 0000 AND 0101 0101)
    unsigned int l_data14 = 0b001 | 0b101; // Bitweises OR
    unsigned int l_data15 = 7743; // Normale Binärdarstellung der Zahl: 1111000111111
    int l_data16 = -7743; // Zweierkomplement der Zahl (Bitflip: 11...10000111000000; +1 -> 11...10000111000001)

    // Char sind 8 Bit groß; Int 32 Bit
    std::cout << "data1 = " << std::bitset<8>(l_data1) << std::endl;
    std::cout << "data2 = " << std::bitset<8>(l_data2) << std::endl;
    std::cout << "data3 = " << std::bitset<8>(l_data3) << std::endl;
    std::cout << "data4 = " << std::bitset<8>(l_data4) << std::endl;
    std::cout << "data5 = " << std::bitset<8>(l_data5) << std::endl;
    std::cout << "data6 = " << std::bitset<8>(l_data6) << std::endl;
    std::cout << "data7 = " << std::bitset<8>(l_data7) << std::endl;
    std::cout << "data8 = " << std::bitset<32>(l_data8) << std::endl;
    std::cout << "data9 = " << std::bitset<32>(l_data9) << std::endl;
    std::cout << "data10 = " << std::bitset<32>(l_data10) << std::endl;
    std::cout << "data11 = " << std::bitset<32>(l_data11) << std::endl;
    std::cout << "data12 = " << std::bitset<32>(l_data12) << std::endl;
    std::cout << "data13 = " << std::bitset<32>(l_data13) << std::endl;
    std::cout << "data14 = " << std::bitset<32>(l_data14) << std::endl;
    std::cout << "data15 = " << std::bitset<32>(l_data15) << std::endl;
    std::cout << "data16 = " << std::bitset<32>(l_data16) << std::endl;

    return EXIT_SUCCESS;
}