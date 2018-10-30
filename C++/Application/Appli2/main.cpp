#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "compteur.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Compteur compteur;

    QQmlApplicationEngine engine;
    engine.loadContext()->setContextProperty("vueObjectCpt",&compteur);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
