#include "joueur.h"
#include <string>
#include <iostream>
using namespace std;

joueur::joueur(string name, bool activ)
{
nom=name;
if(activ) {active();}
else unactive();
cout<<"joueur cree"<<endl;

}

void joueur::active(){
   choisi=true;
}

void joueur::unactive(){
    choisi=false;
}

bool joueur::isActive(){
    return choisi;
}

string joueur::getName(){
    return nom;
}
