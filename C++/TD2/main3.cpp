#include <iostream>
#include "damierdyng.h"

using namespace std;

int main()
{

    DamierDynG<bool> Dbool(3,4);
    Dbool.Init(true);
    Dbool.Set(1, 1, false);
    Dfloat += false;
    DamierDynG<bool> Dbool2(3,4);
    Dbool2.Set(2, 2, true);
    cout << Dbool;
    cout << Dbool2;
    Dbool2 += Dbool;
    cout << Dbool2;
    return 0;
}

