#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "compteur.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    Compteur unCompteur;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("vueObjetCpt", &unCompteur);


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
