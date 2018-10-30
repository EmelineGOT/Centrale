#ifndef TEXTZONE_H
#define TEXTZONE_H
#include <string>
#include <QObject>
using namespace std;


class textZone
{
public:
    textZone(string joueur1, string joueur2);
    Q_INVOKABLE QString getText(int coups, bool gamewon);
    string getInfoText();
    void setJoueur(string joueur);//définir le texte à chaque momment
    void setWin(int joueur);
    void setDebut();
    void setPart2();
    void setFinJeu();
    string J1,J2;
private:
    QString currentText;
    string infoText;
};

#endif // TEXTZONE_H
