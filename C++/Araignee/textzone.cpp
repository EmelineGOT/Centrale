#include "textzone.h"
using namespace std;
#include <string>
#include <iostream>


textZone::textZone(string joueur1, string joueur2)
{
J1=joueur1;
J2=joueur2;
setJoueur(J1);
setDebut();
cout<<"textzone cree"<<endl;

}

QString textZone::getText(int coups, bool gamewon){
    currentText.clear();
    if(gamewon==true){setWin(coups%2);}
    else if (coups<=5){
        if (coups%2==0) setJoueur(J1);
        else setJoueur(J2);
    }
    return currentText;
                 }

string textZone::getInfoText(){
    return infoText;
}


void textZone::setJoueur(string joueur){
    //Catch exception aqui!!!!!
    currentText.append(QString::fromStdString(joueur));
    currentText.append(", à vous de jouer!");
}

void textZone::setWin(int joueur){
    string winner, loser;
    if (joueur==1) {winner=J1; loser=J2;}
    if (joueur==2) {winner=J2; loser=J1;}
    currentText.append(QString::fromStdString(winner));
    currentText.append(" a gagné le jeu, dommage ");
    currentText.append(QString::fromStdString(loser));
    currentText.append(". Jouons de nouveau!");
}
void textZone::setDebut(){
    infoText="Pour jouer, cliquez sur la position où vous voulez déposer le jeton";
}

void textZone::setPart2(){
    infoText="Cliquez sur un jeton pour le sélectionner, cliquez encore une fois sur lui pour le"
             "déselectionner ou dans une position vide pour le déplacer";
}

void textZone::setFinJeu(){
    infoText="Le jeu est fini, cliquez sur Nouvelle Partie !";
}
