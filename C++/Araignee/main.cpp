#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "game.h"
#include <string>
#include <iostream>
int main(int argc, char *argv[])
{


    //string eme="Emeline", elo="eloy";

    QGuiApplication app(argc, argv);

    game juego("joueur1","joueur2");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("vueGame", &juego);//on envoie vueGame pour pouvoir appeler la fonction depuis l'interface
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();

}
