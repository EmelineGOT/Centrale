#ifndef VECTEUR_H
#define VECTEUR_H

#include<iostream>
using namespace std;

class Vecteur
{
    public:
        Vecteur(int size);
        ~Vecteur();
        void SetValue(int ind, double val);
    private:
        double* tab;
        int N;
};

#endif 
