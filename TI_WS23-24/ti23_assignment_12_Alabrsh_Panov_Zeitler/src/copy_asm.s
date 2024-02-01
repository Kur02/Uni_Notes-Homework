        .text
        .align 4
        .type   copy_asm, %function
        .type   copy_asm_loop, %function
        .global copy_asm_loop
        .global copy_asm

// TODO: Implement copy_asm 
copy_asm:
        ldr x2, [x0], #8        // erste Element aus x0 wird in x2 geladen und man geht #8Byte weiter in x0 zum 2ten Element
        ldp x3, x4, [x0], #16   // 2tes und 3tes Element werden aus x0 jeweils in x3 und x4 geladen und man geht 16 Byte weiter in x0 zum 4ten Element 
        ldp x5, x6, [x0], #16   // 4tes und 5tes Element werden aus x0 jeweils in x5 und x6 geladen und man geht 16 Byte weiter in x0 zum 6ten Element
        ldp x7, x8, [x0]        // 6tes und 7tes Element werden aus x0 jeweils in x7 und x8 geladen --> alle 7 Elemente  geladen in x2 bis x8
        //man kann auch schreiben: ldp x7, x8, [x0, #16]! ohne ], #16 in Zeile davor

        str x2, [x1], #8        // Element aus x2 wird in Memory x1 gespeichert (als erstes Element) und man geht #8 Byte weiter in x1
        stp x3, x4, [x1], #16   // Elemente aus x3 und x4 werden in Memory x1 gespeichert (als 2tes und 3tes Element) und man geht 16 Byte weiter in x1
        stp x5, x6, [x1], #16   // Elemente aus x5 und x6 werden in Memory x1 gespeichert (als 4tes und 5tes Element) und man geht 16 Byte weiter in x1
        stp x7, x8, [x1]        // Elemente aus x7 und x8 werden in Memory x1 gespeichert (als 6tes und 7tes Element) 
        ret                     //  --> alle 7 Elemente in x1 gespeichert        
        .size   copy_asm, (. - copy_asm)

//Implement a new function copy_asm_loop in the file copy_asm.s. In this implementation use a loop to copy the seven values
copy_asm_loop:
        mov x2, #0 //mit move wird das Register x2 auf den Wert 0 gesetzt (inizialisieren der Laufvariable)
        b loop  //man geht in branch "loop" (ist nicht unbedigt nötig, da man danach eh in loop geht )
loop: 
        cmp x2, #7       // der Wert in x2 wird mit dem Wert 7 verglichen
        b.ge end_loop    // wenn der Wert in x2 größer gleich 7, dann geht man in "end_loop" und der Algorithmus ist beendet
        ldr x3, [x0], #8 // wenn der Wert in x2 kleiner 7 ist, dann wird erste Element aus x0 in x3 geladen und man geht #8Byte weiter in x0
        str x3, [x1], #8 // dann wird der Wert aus x3 in x1 gespeichert und man geht #Byte weiter in x3
        add x2, x2, #1   // dann wird der Wert aus x2 addiert mit 1 und Ergebniss wird wieder in x2 geschrieben (x2 = x2 + 1) -> erhöhen der Laufvariable
        b loop  //man beginnt wieder am Anfang von "loop" (solange bis man alle 7 Elemente durch hat und auf "end_loop" kommt)

end_loop:
        ret //Ende


//Konzept: in Register x0 stehen 7 Elemente, diese sollen in Register x1 kopiert werden
// (als "Zwischenspeicher", werden die Register x2 bis x8 genutzt)

// ldr -> laden eines Elements aus Speicher(Memory)
// ldp -> laden von 2 Elementen aus Speicher 

// str -> Speichern eines Registers im Speicher
// stp -> Speichern von 2 Registern im Speicher



        