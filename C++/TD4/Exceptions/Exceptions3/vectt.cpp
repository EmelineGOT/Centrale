#include "vectt.h"

VectT::VectT(int taille, int init_val)
{
    Taille = taille;
    Tab = new int[Taille];
    for (int i = 0; i < Taille; i++)
        Tab[i] = init_val;
}

VectT::~VectT()
{
    if (Tab != NULL) {
        delete [] Tab;
        Tab = NULL;
    }
}

void VectT::Set(int pos, int val)
{
    if ((pos < 0) || (pos >= Taille)) {
        bad_range e(pos, Taille);
        throw (e);
    }

    try {
        Tab[pos] = val;
    } catch (...) {
        cerr << endl << "Y'a une erreur mais je sais pas encore laquelle!";
        //cerr << endl << e.what();
        exit(1);
    }
}

ostream& operator<< (ostream& sortie, VectT& V)
{
    for (int i = 0; i < V.Taille; i++)
        sortie << "Tab[" << i << "] = " << V.Tab[i] << endl;
    return sortie;
}
