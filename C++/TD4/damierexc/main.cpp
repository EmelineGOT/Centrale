#include <iostream>

using namespace std;

#include "damierexc.h"



int main()
{
    /*DamierExc D(3,5);
    try{
        D.Set(4,2,8);
    }

    catch (const char* message){
        cerr << message << endl;
    }*/

    DamierExc D(3,5,4);
    D.Set(1,2,8);
    D.Init(6);

}

