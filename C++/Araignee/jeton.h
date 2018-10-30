#ifndef JETON_H
#define JETON_H


class jeton
{
public:
    jeton(); //trois constructeurs mais je crois que cela suffira d'un
    jeton(int player);
    jeton(int player,int pos);
    void setPosition(int pos); //entre 1-9 pour la position
    int getJoueur(); //get le numero
    int getPosition();
    bool getSelected();
    void setSelected(bool selection);
private:
    int joueur, position; //numero de joueur et position
    bool selected; //pour la deuxieme partie de jeu si on veut selectionner pour le bouger
};

#endif // JETON_H
