#include "vecteur.h"

void IndiceValide(int i, int n)
{
    if (i < 0 || i >= n)
        throw("indice hors bornes");
}

Vecteur::Vecteur(int size)
{
    N = size;
    tab = new double[N];
}

Vecteur::~Vecteur()
{
    if (tab != NULL) {
        delete [] tab;
        tab = NULL;
    }
}

void Vecteur::SetValue(int ind, double val)
{
    IndiceValide(ind, N);
    tab[ind] = val;
}
