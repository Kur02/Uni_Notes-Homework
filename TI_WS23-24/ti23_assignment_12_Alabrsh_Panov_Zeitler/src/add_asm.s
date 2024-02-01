        .text
        .align 4
        .type   add_asm, %function
        .global add_asm

add_asm:
        mov x4, #0 // der Wert in x4 wird auf 0 gesetzt (Zählervariable wird initialisiert)

add_loop: 
        cmp x4, x0      // der Wert in x4 wird verglichen mit dem Wert 10 in x0 (Anzahl der Array-Elemente)
        b.ge end_loop   // wenn  der Wert in x4 größer gleich 10 ist, dann geht er in "end_loop" und endet den Algorithmus
        ldr x5, [x1],#8 // wenn der Wert in x4 kleiner ist als 10, dann wird das (erste) Element von x1 in x5 geladen und man geht #8Byte weiter in x1
        ldr x6, [x2],#8 // und das (erste) Element in x2 wird in x6 geladen  und man geht #8Byte weiter in x2
        
        add x7, x5, x6  // wenn man dann beide Elemente hat aus x5 und x6, werden diese Addiert und als Ergebnis in x7 geschrieben 
        str x7, [x3],#8 // dann wird das Ergebnis aus x7 in x3 gespeichert 
        add x4, x4, #1  // dann wird der Wert aus x4 addiert mit 1 und Ergebnis wird wieder in x4 geschrieben -> erhöhen der Laufvariable
        b add_loop  //man beginnt wieder am Anfang von "loop" (solange bis man alle 10 Elemente durch hat und auf "end_loop" kommt)

end_loop:
        ret //Ende


//Kontext: - in x0 steht der Wert 10 (Anzahl der Elemente in jedem Register/Array)
//         - dann gibt es register x1 und x2 
//         - jedes Elemennt aus x1 wird jeweils mit dem analogen Element aus x2 addiert und in x3 Gespeichert (x1 + x2 = x3)
//         - als "Zwischenspeicher" zum arbeiten werden x4 bis x7 verwendet