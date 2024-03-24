.text
.align 4
.type   gcd_s, %function
.global gcd_s

    mov x2, x0          // Zwischenwerte der Differenz sollen in x2 gespeichert werden. Initialisiert mit x in x0.
mod_s:                  // Zunächst zu berechnen: x mod y mit x = [x0] und y = [x1].
    cmp x1, x2          // Vergleiche [x1] mit [x2].
    b.ge endmod         // Wenn [x1] >= [x2], dann springe zu endmod.
    sub x2, x2, x1      // Speichere in x2 das Resultat von [x2] minus [x1].
    b mod_s             // Springe zu mod_s (neuer Schleifendurchlauf).
endmod:    

gcd_s:
    cbz x1, endgcd      // Abbruchbedingung von GCD: wenn [x1] = 0, springe zu endgcd. x2 soll am Ende den ggT enthalten.
    mov x0, x1          // x := y.
    mov x1, x2          // y := r.
    b mod_s             // Springe zurück zu mod_s.
endgcd:
    ret

// NOTIZEN
// Ich muss im GCD probably nicht checken, ob x = 0, oder?
// Nach dem Checken von x1 wird ja x0 mit x1 überschrieben.
// Also wenn x0 = 0 sein soll, muss vorher x1 = 0 gewesen sein. In dem Fall ist die Schleife aber schon abgebrochen.
// Andererseits soll im Fall x0 = 0 aber ja nicht x, sondern y ausgegeben werden. Ob das gutgeht?