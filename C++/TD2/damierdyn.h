#ifndef DAMIERDYN_H
#define DAMIERDYN_H

#include <iostream>
using namespace std;

class DamierDyn
{
public:
    DamierDyn(int x, int y, int v=0);
    DamierDyn(const DamierDyn &D);   //Constructeur de recopie
    ~DamierDyn();       //Destructeur

    DamierDyn& operator=(const DamierDyn &D);  //Operateur d'affectation
    friend DamierDyn operator+(const DamierDyn& D, const DamierDyn& B);
    DamierDyn& operator+=(int a);
    friend ostream& operator<< (ostream& sortie, DamierDyn& D);

    void Init(int x);
    void Set(int x, int y, int v);
    void Redim(int x, int y);
    void Print();

private:
    int nb_lignes;
    int nb_colonnes;
    int **m;

};

#endif // DAMIERDYN_H
