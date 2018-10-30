#include <iostream>
#include "damierstat.h"

using namespace std;

int main()
{
    DamierStat D1;
    D1.Init(7);
    D1.Set(2,4,-2);
    D1.Print();

    DamierStat *pD2;
    pD2 = new DamierStat();  //Mémoire Dynamique
    pD2->Print(); //Raccourcis pour avoir accès à l'objet que pointe le pointeur et lui appliquer une fonction
    //Cela revient à (*pD2).Print();


    DamierStat *pD3;
    DamierStat D3;
    pD3 = &D3;  //Mémoire statique


}
