#ifndef COMPTEUR_H
#define COMPTEUR_H

#include <QObject>

class Compteur : public QObject
{
    Q_OBJECT
public:
    explicit Compteur(QObject *parent = 0);

signals:

public slots:
};

#endif // COMPTEUR_H