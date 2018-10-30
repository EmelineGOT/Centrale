#ifndef VECTT_H
#define VECTT_H

#include <iostream>
using namespace std;
#include <cmath>
#include <cstdlib>

#include "badrange.h"

class VectT
{
    protected:
        int* Tab;
        int Taille;
    public:
        VectT(int taille = 10, int init_val = -1);
        ~VectT();

        int GetTaille() { return Taille; }
        int GetElem(int i) { return Tab[i]; }

        void Set(int pos, int val);

        friend ostream& operator<< (ostream& sortie, VectT& V);
};

#endif // VECTT_H

