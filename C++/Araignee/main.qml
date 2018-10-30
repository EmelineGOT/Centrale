import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 350
    title: qsTr("Araignée")

    MainForm {
        starter.onClicked: {
            starter.visible=false;
            button1.visible=true;
            button.visible=true;
            text1.visible=true;
            couleurJ1.visible=true;
            couleurJ2.visible=true;
            joueur1.visible=true;
            joueur2.visible=true;
            rectgreat.visible=true;
            textFieldJ1.visible=false;
            textFieldJ2.visible=false;

            vueGame.setnames(textFieldJ1.text,textFieldJ2.text);
        }

        button1.onClicked: {
            vueGame.restart();
        }
        button.onClicked: {
            close();
        }
        anchors.fill: parent
        mouseArea1 {
        onClicked: vueGame.gestion(0);
        }
    mouseArea2{
        onClicked: vueGame.gestion(1);
    }
    mouseArea3 {
        onClicked: vueGame.gestion(2);
        }
    mouseArea4{
        onClicked: vueGame.gestion(3);
    }
    mouseArea5 {
        onClicked: vueGame.gestion(4);
        }
    mouseArea6{
        onClicked: vueGame.gestion(5);
    }
    mouseArea7 {
        onClicked: vueGame.gestion(6);
        }
    mouseArea8{
        onClicked: vueGame.gestion(7);
    }
    mouseArea9 {
        onClicked: vueGame.gestion(8);
        }
}}
