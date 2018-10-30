#ifndef GAME_H
#define GAME_H //pour interagir avec l'interface graphique
#include "jeton.h"
#include "joueur.h"
#include "textzone.h"
#include <string>



using namespace std;
class game : public QObject //histoire d'interagir avec l'interface graphique
{
    Q_OBJECT //copier coller de l'autre programme
public:
    explicit game(string name1, string name2, QObject *parent = 0); //explicit copie, game est la classe qui gère tout, le QObject est copié collé, les names sont les noms des joueurs
    Q_INVOKABLE void setnames(QString Joueur1, QString Joueur2);
    Q_INVOKABLE void gestion(int place); //Q_INVOK veut dire qu'on pourra l'appeler dans l'interface
    void phase1(int place); //gère la partie quand les 6 jetons ne sont pas encore mis
    void phase2(int place); //gère la suite
    Q_INVOKABLE QList<QString> readPos(); //liste des positions utilisées
    Q_PROPERTY(QList<QString> gameQML READ readPos NOTIFY gameChanged); //à chaque fois qu'on appelera depuis une fonction le signal "gameChanged", on appelera la fonction "readPos" (qui rend une Qliste actualisée des positions des jetons) et cette liste sera utilisée par l'interface sous le nom "gameQML"
    Q_INVOKABLE int getcoups();
    Q_INVOKABLE void justToTry(int i);
    Q_PROPERTY(QString currentText READ currentText NOTIFY textChanged);
    void win();
    bool wintest(int *test);
    Q_INVOKABLE QString currentText();
    Q_INVOKABLE void restart();
signals:
    void gameChanged(); //signal qui sert à communiquer avec le jeu
    void textChanged();
private slots:

private:
    int coups; //compteur des coups déjà faits, afin de savoir dans quelle partie du jeu on est
    textZone texts; //objets avec les textes, joueurs et la liste dynamiques des jetons
    joueur J1, J2;
    jeton *listeJetons;
    bool gamewon;

};

#endif // GAME_H
