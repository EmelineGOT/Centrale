#include <iostream>
using namespace std;

#include "VectT.h"
#include "badrange.h"

int main()
{
    VectT V(10,3);

    //Déclenchement Exception
    try{
        V.Set(4,-4);
        V.Set(6,87);
        V.Set(14,-1);
    }
    catch ( const bad_range & b ){
        cerr << b.what() << "\n";
    }

    cout << endl;
    return 0;
}
