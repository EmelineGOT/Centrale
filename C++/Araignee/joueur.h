#ifndef JOUEUR_H
#define JOUEUR_H
#include <string>

using namespace std;

class joueur
{
public:
    joueur(string nom, bool activ=false);
    void active(); //changer l'etat entre active et inactive
    void unactive();
    string getName();
    bool isActive();
private:
    bool choisi; //active=choisi
    string nom;

};

#endif // JOUEUR_H
