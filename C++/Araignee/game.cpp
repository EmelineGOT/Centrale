#include "game.h"
#include "jeton.h"
#include "joueur.h"
#include "textzone.h"
#include <iostream>
#include <QCoreApplication>
using namespace std;

game::game(string name1, string name2,QObject *parent): QObject(parent),J1(name1,true),J2(name2,false),texts(name1,name2)
{   coups =0; //0 coups et nouveau tableau dynamique
    cout<<"game cree"<<endl;
    listeJetons=new jeton[6];
    gamewon=false;

    }

void game::setnames(QString Joueur1, QString Joueur2)
{
    texts.J1=Joueur1.toStdString();
    texts.J2=Joueur2.toStdString();
    textChanged();

}


void game::gestion(int place)
{ //on appelera cette fonction depuis l'interface, elle nous enverra la position cliquée et selon cela on decidera quoi faire
    bool existsalready=false;
    int i=0;
    if(gamewon==false){
    if (coups<6){
        for(i=0; i<coups; i++){
            if(place==listeJetons[i].getPosition()) existsalready=true;
        }
    if (existsalready==false){phase1(place);coups++;}
    }
    else  {game::phase2(place);}
    //cout<<"coups"<<coups;
    win();
    gameChanged();
    textChanged();
}
}

void game::phase1(int place){
    listeJetons[coups] = jeton(coups%2, place);
}

void game::phase2(int place){
    int i,j;
    bool existsalready=false,occupiedalready=false;
    for(i=0; i<6; i++){
       if(place==listeJetons[i].getPosition()&&coups%2==i%2){
           existsalready=true;
           for(j=0; j<6; j++){
               if(listeJetons[j].getSelected()==true) {listeJetons[j].setSelected(false);}
           }
           listeJetons[i].setSelected(true); cout<<"selectionné"<<i<<endl;
       }
    }

    if (existsalready==false){
        for(j=0; j<6&&j<coups; j++)
        {
            if(place==listeJetons[j].getPosition()) occupiedalready=true;
        }
        if(occupiedalready==false){
        for(j=0; j<6; j++){
            //cout<<listeJetons[j].getSelected();
            if(listeJetons[j].getSelected()==true) { listeJetons[j].setPosition(place); coups++;}
        }}
    }

}

QList<QString> game::readPos()
{
    QString gris="#c6c6c6", orange="#ff8300", bleu="#0032a0";
    int j;
    QList<QString> positions;
    for(j=0;j<9;j++){
        positions<<gris;
    }
    for(j=0; j<6&&j<coups; j++){
        if(j%2==0){
        positions[listeJetons[j].getPosition()]=bleu;}
        else {positions[listeJetons[j].getPosition()]=orange;}
    }
    return positions;
}

int game::getcoups()
{
    return coups;
}
void game::justToTry(int i)
{
    cout<<i;
}

void game::win(){
  int j=0,i;
int* posj1=new int[3];
int* posj2=new int[3];
if(coups>=5){//cout<<"dans l'if"<<endl;
    for(j=0; j<6&&j<coups; j++){
        //cout<<j;
        i=j/2;
        if(j%2==0){posj1[i]=listeJetons[j].getPosition();}
        else {posj2[i]=listeJetons[j].getPosition();}
    }
if (coups%2==1) wintest(posj1);
        else wintest(posj2);
    /*
    if (coups>5){
        for(j=0;j<3;j++){
            cout<<"posj1 ["<<j<<"] "<<posj1[j]<<" posj2 ["<<j<<"] "<<posj2[j]<<endl;
        }
    }*/
delete[] posj1; delete[] posj2;

}}

bool game::wintest(int *test){
    int a;
    if (test[0]>test[1]){a=test[0]; test[0]=test[1]; test[1]=a;}
    if (test[1]>test[2]){a=test[2]; test[2]=test[1]; test[1]=a;}
    if (test[0]>test[1]){a=test[0]; test[0]=test[1]; test[1]=a;}

    if (test[0]%3==test[1]%3&&test[0]%3==test[2]%3) gamewon=true;
    else if (test[0]/3==test[1]/3&&test[0]/3==test[2]/3) gamewon=true;
    else if (test[0]==2&&test[1]==4&&test[2]==6) gamewon=true;
    else if (test[0]==0&&test[1]==4&&test[2]==8) gamewon=true;
if(gamewon==true) cout<<"jeu fini";
    cout<<test[0]<<test[1]<<test[2]<<endl;
}

QString game::currentText(){
    return texts.getText(coups, gamewon);
}

void game::restart(){
    coups =0; //0 coups et nouveau tableau dynamique
    delete[] listeJetons;
    listeJetons=new jeton[6];
    gamewon=false;
    gameChanged();
}
