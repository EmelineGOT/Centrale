#include <iostream>

using namespace std;

#include "damierstat.h"
#include "damierdyn.h"

int main(int argc, char *argv[])
{
    DamierStat D1;		// Création du Damier et init des cases à 0
    D1.Init(7);         // Initialisation de toutes les cases à 7
    D1.Set(2, 4, -2);	// Modif. de la case (2, 4) avec valeur -2
    D1.Print();         // Affichage du tableau

    DamierDyn D2(3, 5);
    D2.Init(-10);
    D2.Set(1,1, -343);
    D2.Print();
    DamierDyn D3(D2);
    D3.Set(1,1, 20000);
    D2.Print();
    D3.Print();

    D3.ReDim(2,4);
    D3.Print();

    D2 = D3;
    D2.Print();

    D2+= D3;
    D2.Print();

    DamierDyn D4(4, 4);
    D4 = D3 + D2;
    D4.Print();
    cout << D4;

    /*
    DamierDyn* pointDamier = new DamierDyn(3, 5);
    pointDamier->Print();
    delete pointDamier;
    */
    return 0;
}
