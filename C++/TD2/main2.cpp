#include <iostream>
#include "damierdyn.h"

using namespace std;

int main()
{
    DamierDyn D1(4,5);
    D1.Init(7);
    D1.Set(2,4,-2);
    DamierDyn D2(D1);
    DamierDyn D3(4,5);
    D3=D1; //Si on modifie D3, D1 n'est pas modifié

    //D1.Print();
    //D2.Print();

    DamierDyn D4(4,5);
    D4=D1+D2;
    D4.Print();

    D1+=3;
    cout << D1;
}
