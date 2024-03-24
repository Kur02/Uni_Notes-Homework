    .text
    .type   low_lvl_0, %function
    .type   low_lvl_1, %function
    .type   low_lvl_2, %function
    .type   low_lvl_3, %function
    .type   low_lvl_4, %function
    .type   low_lvl_5, %function
    .type   low_lvl_6, %function
    .type   low_lvl_7, %function
    .global low_lvl_0
    .global low_lvl_1
    .global low_lvl_2
    .global low_lvl_3
    .global low_lvl_4
    .global low_lvl_5
    .global low_lvl_6
    .global low_lvl_7

// Gibt ersten Eingabeparameter zurück (steht in w0)
low_lvl_0:
    ret


// Hier wird der Wert 0 zurückgegeben 
low_lvl_1:
    mov x0, #0 // Wert 0 wird in Register x0 kopiert
    ret


// es wird geprüft ob erster Eingabeparameter kleiner als 32 ist, dann wird 1 zurückgegeben, asnosten 0
low_lvl_2:
    cmp w0, #32 // Vergleiche den Wert in Register w0 mit 32
    b.lt lvl2_setTo1 // wenn der Wert in w0 kleiner als 32 wird zu lvl2_setTo1 gesprungen
    mov w0, #0 // Wert in Register wo wird auf 0 getsetz
    ret

lvl2_setTo1: //Hier wird der Wert 1 zurückgegeben 
    mov w0, #1 // Wert in Register w0 auf 1 gestezt
    ret


//Low Level 3 
low_lvl_3:
    ldr w0, [x0] // Lädt den Wert aus dem Speicher (aus erstem Pointer), auf den x0 zeigt, in das Register w0
    cmp w0, #25 // Vergleicht den Wert in w0 mit 25
    b.lt lvl3_setTo1 // Wenn w0 kleiner als 25 ist, springe zu lvl3_setTo1
    mov w0, #0 // Ansosnten setze den Wert in w0 auf 0
    str w0, [x1] // Speichert den Wert in w0 an der Speicherstelle, auf die x1 zeigt
    ret

lvl3_setTo1: 
    mov w0, #1 // Wert in wo wird auf 1 gesetzt
    str w0, [x1] // Speichert den Wert in w0 an der Speicherstelle, auf die x1 zeigt
    ret


//Low Level 4
low_lvl_4:
    mov w3, #0 // Wert in Register w3 wird auf 0 getsezt (Initialisieren der Laufvariable)
    cmp w0, w1 // Werte in Registern w0 und w1 werden verglichen 
    b.lt lvl4_cond0 // Wenn w0 kleiner als w1 ist, springe zu lvl4_cond0 (in if gesprungen)
    b lvl4_cond1 // Ansonsten springe zu lvl4_cond1 

lvl4_cond0: // wird geprüft: x < z
    cmp w0, w2 // Werte in den Registern w0 und w2 werden verglichen
    b.lt lvl4_setTo1 // wenn w0 kleiner als w2 ist, springe zu lvl4_setTo1
    b lvl4_cond1 // Ansonsten springe zu lvl4_cond1

lvl4_setTo1: 
    mov w0, #1 // Wert in Register w0 wird auf 1 gesetzt (Rückgabe 1)
    ret

lvl4_cond1:// wird geprüft: y < z 
    cmp w1, w2 // Werte in den Registern w1 und w2 werden verglichen
    b.lt lvl4_setTo2 // Wenn w1 kleiner als w2 ist, springe zu lvl4_setTo2
    mov w0, #3 // Ansonsten wird Wert in Register w0 auf 3 gesetzt (Rückgabe 3)
    ret
    
lvl4_setTo2: 
    mov w0, #2 // Wert in Register w0 wird auf 2 gesetzt (Rückgabe 2)
    ret


//Low Level 5
low_lvl_5:
    // i_nIters ist w0 (Wert)
    // *io_value ist x1 (Adresse)
    mov w2 , #0 // Wert in Register w2 wird auf 0 gesetzt (Laufvariabele w2 wird inizialisiert)
    ldr w3, [x1] // Lädt den Wert aus der Speicherstelle (Adresse), auf die x1 zeigt, in das Register w3 (weil 32bit)

lvl5_loop:
    cmp w2 , w0 // Werte in den Registern w2 und w0 werden verglichen 
    b.ge lvl5_save // Wenn w2 größer oder gleich w0 ist, springe zu lvl5_save
    add w2, w2, #1 // Addiert 1 zu w2 (Laufvariable wird um 1 erhöht, wenn w2 nicht größer gleich w0 ist 
    add w3, w3, #1 // Addiert 1 zu w3
    b lvl5_loop // Springt zurück zu lvl5_loop

lvl5_save:
    str  w3, [x1] // Speichert den Wert in w3 an der Speicherstelle, auf die x1 zeigt
    ret


//Low Level 6
low_lvl_6:
    //i_nIters in x0
    //i_inc in x1
    //* io_value in x2
    ldr x3, [x2] // Lädt den Wert aus der Speicherstelle (Adresse), auf die x2 zeigt, in das Register x3 (io_value)
    
lvl6_loop:
    add x3, x3, x1 // Wert in x1 zu x3 wird addiert
    subs x0, x0, #1 // Subtrahiert 1 von x0 und aktualisiert das Ergebnis in x0
    b.ne lvl6_loop // Wenn x0 nicht gleich 0 ist, springe zu lvl6_loop 
    str x3, [x2] // Ansonsten, Speichert den Wert in x3 an der Speicherstelle, auf die x2 zeigt  
    ret
    

//Low Level 7
low_lvl_7:
    //i_nValues = x0
    //* i_valuesIn = x1
    //* i_valuesOut = x2 
    mov x5, #0 // Wert in Register x5 wird auf 0 gesetzt (Laufvariable auf 0 gesetzt)
    
lvl7_loop:
    cmp x5, x0 // Werte in den Registern x5 und x0 werden verglichen
    b.ge lvl7_ret // Wenn x5 größer oder gleich x0 ist, springe zu lvl7_ret (nValues)
    ldr x4, [x1], #8 // Lädt den Wert aus der Speicherstelle (Adresse), auf die x1 zeigt, in x4 und offset von 8byte in x1
    str x4, [x2], #8 // Speichert den Wert in x4 an der Speicherstelle (Adresse), auf die x2 zeigt und offset von 8byte in x2     
    add x5, x5, #1  // Addiert 1 zu x5 (Laufvariable wird erhöht)
    b lvl7_loop // Springt zurück zu lvl7_loop und Schleife wird wiederholt bis lvl7_ret
    
lvl7_ret
    ret //beendet die Funktion