/*
*******************************************************
* Exemple 1.1 : Calcul de la moyenne de deux entiers *
*******************************************************
*/

#include <iostream>     // declarations des fonctions d'E/S de bibliotheque
using namespace std;    // utilisations de noms courts pour la biliotheque
int main()              // fonction principale (main)
{
    int a,b,c;          // variables entières locales a la fonction main
    cout<<"Entrez les deux nombres entiers"<<endl; // ecriture
    cout<<"a : "; cin>>a;         // ecriture puis lecture
    cout<<"b : "; cin>>b;         // ecriture puis lecture
    c=(a+b)/2;                    // calcul
    cout<<"c = "<<c<< endl;        // ecriture resultat
    return 0;
}


