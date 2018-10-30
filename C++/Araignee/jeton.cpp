#include "jeton.h"
#include <iostream>
using namespace std;

jeton::jeton(){
joueur=0;
position=10;
}

jeton::jeton(int player, int pos)
{
    if(player==1||player==2) joueur=player;
    //excepciones por aquí!
    if(pos<=8&&pos>=0) position=pos;
    //cout<<"jeton cree"<<endl;
    selected=false;
}
jeton::jeton(int player)
{
    if(player==1||player==2) joueur=player;
    selected=false;
}

void jeton::setPosition(int pos){
 if(pos<=8&&pos>=0) position=pos;
 selected=false;
    //exception aqui!
}
int jeton::getJoueur(){
    return joueur;
}
int jeton::getPosition(){
    return position;
}
bool jeton::getSelected(){
    return selected;
}
void jeton::setSelected(bool selection){
    selected=selection;
    cout<<"jeton"<<selection<<endl;

}
