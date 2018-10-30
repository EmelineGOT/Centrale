import QtQuick 2.6
import QtQuick.Controls 2.1

Rectangle {
    id: rectangle1
    property alias mouseArea: mouseArea

    width: 600
    height: 400
    color: "#c6c6c6"
    property alias rectsub6: rectsub6
    property alias rectsub5: rectsub5
    property alias starter: starter
    property alias mouseAreaVisible: mouseArea.visible
    property alias button1: button1
    property alias button: button
    property alias text1: text1
    property alias text2: text2
    property alias couleurJ2: couleurJ2
    property alias couleurJ1: couleurJ1
    property alias joueur1: joueur1
    property alias joueur2: joueur2
    property alias mouseArea1: mouseArea1
    property alias mouseArea2: mouseArea2
    property alias mouseArea3: mouseArea3
    property alias mouseArea4: mouseArea4
    property alias mouseArea5: mouseArea5
    property alias mouseArea6: mouseArea6
    property alias mouseArea7: mouseArea7
    property alias mouseArea8: mouseArea8
    property alias mouseArea9: mouseArea9
    property alias rectgreat: rectgreat
    property alias textFieldJ1: textFieldJ1
    property alias textFieldJ2: textFieldJ2


    MouseArea {
        id: mouseArea
        height: 400
        anchors.bottomMargin: -38
        clip: false
        visible: true
        anchors.fill: parent

        Button {
            id: button
            x: 401
            width: 108
            height: 37
            text: qsTr("Quitter")
            anchors.top: button1.bottom
            anchors.topMargin: 44
            scale: 1.5
            visible: false
        }

        Button {
            id: button1
            x: 401
            width: 108
            height: 40
            text: qsTr("Nouvelle Partie")
            scale: 1.5
            visible: false
            anchors.top: parent.top
            anchors.topMargin: 34
        }
    }

    Text {
        id: joueur2
        x: 330
        width: 120
        height: 30
        text: textFieldJ2.text
        anchors.top: parent.top
        anchors.topMargin: 233
        anchors.rightMargin: 150
        anchors.right: parent.right
        font.family: "Verdana"
        font.pixelSize: 21
        horizontalAlignment: Text.AlignLeft
        visible: false
    }

    Text {
        id: joueur1
        x: 330
        width: 120
        text: textFieldJ1.text
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 136
        anchors.top: joueur2.bottom
        anchors.topMargin: -79
        anchors.right: parent.right
        anchors.rightMargin: 150
        font.family: "Verdana"
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 21
        visible: false
    }

    Rectangle {
        id: couleurJ1
        y: 184
        width: 30
        height: 30
        color: "#0032a0"
        anchors.left: joueur1.right
        anchors.leftMargin: 14
        visible: false
    }

    Rectangle {
        id: couleurJ2
        x: 7
        y: 233
        width: 30
        height: 30
        color: "#ff8300"
        anchors.leftMargin: 14
        anchors.left: joueur2.right
        visible: false
    }

    Text {
        id: text1
        x: 55
        y: 353
        width: 490
        height: 39
        //text: qsTr("Text")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        font.family: "Verdana"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 21
        text: vueGame.currentText
        anchors.horizontalCenterOffset: 0
        visible: false
    }

    Rectangle {
        id: rectgreat
        x: 60
        y: 62
        width: 224
        height: 224
        color: "#00000000"
        anchors.leftMargin: 0
        anchors.topMargin: 0
        border.width: 0
        visible: false

        Rectangle {
            id: jeton1
            width: 25
            height: 25
            color: vueGame.gameQML[0]
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

        Rectangle {
            id: jeton2
            x: -24
            width: 25
            height: 25
            color: vueGame.gameQML[1]
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 0
        }

        Rectangle {
            id: jeton3
            x: -21
            width: 25
            height: 25
            color: vueGame.gameQML[2]
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
        }

        Rectangle {
            id: jeton4
            y: -41
            width: 25
            height: 25
            color: vueGame.gameQML[3]
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle {
            id: jeton5
            x: -14
            y: -29
            width: 25
            height: 25
            color: vueGame.gameQML[4]
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: jeton6
            x: -12
            width: 25
            height: 25
            color: vueGame.gameQML[5]
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
        }

        Rectangle {
            id: jeton7
            y: -8
            width: 25
            height: 25
            color: vueGame.gameQML[6]
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }

        Rectangle {
            id: jeton8
            x: -19
            y: -8
            width: 25
            height: 25
            color: vueGame.gameQML[7]
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: jeton9
            x: -12
            y: 0
            width: 25
            height: 25
            color: vueGame.gameQML[8]
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }

        Rectangle {
            id: jeuZone
            y: 75
            width: 200
            height: 200
            color: "#00000000"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Rectangle {
                id: rectsub4
                x: 0
                width: 100
                height: 100
                color: "#00000000"
                anchors.leftMargin: 0
                anchors.top: rectsub2.bottom
                anchors.topMargin: 0
                border.width: 2
                anchors.left: rectsub3.right
            }

            Rectangle {
                id: rectsub3
                x: 0
                width: 100
                height: 100
                color: "#00000000"
                anchors.leftMargin: 0
                anchors.top: rectsub1.bottom
                anchors.topMargin: 0
                border.width: 2
                anchors.left: parent.left
            }

            Rectangle {
                id: rectsub2
                x: 0
                width: 100
                height: 100
                color: "#00000000"
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                border.width: 2
                anchors.left: rectsub1.right
            }

            Rectangle {
                id: rectsub1
                x: 0
                y: 0
                width: 100
                height: 100
                color: "#00000000"
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                border.width: 2
                anchors.left: parent.left
            }

            MouseArea {
                id: mouseArea1
                width: 50
                height: 50
                z: 1
                anchors.leftMargin: -25
                anchors.top: parent.top
                anchors.topMargin: -25
                anchors.left: parent.left
                //onClicked: vueGame.gestion(0);
            }

            MouseArea {
                id: mouseArea2
                x: -6
                y: 7
                width: 50
                height: 50
                z: 2
                anchors.top: parent.top
                anchors.topMargin: -25
                anchors.horizontalCenter: parent.horizontalCenter
                //onClicked: vueGame.gestion(1);
            }

            MouseArea {
                id: mouseArea3
                x: 0
                y: 3
                width: 50
                height: 50
                z: 3
                anchors.rightMargin: -25
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: -25
                //onClicked: vueGame.gestion(2);
            }

            MouseArea {
                id: mouseArea4
                x: -8
                y: -5
                width: 50
                height: 50
                anchors.leftMargin: -25
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                //onClicked: vueGame.gestion(3);
            }

            MouseArea {
                id: mouseArea5
                x: -6
                y: -4
                width: 50
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                ////onClicked: vueGame.gestion(4);
            }

            MouseArea {
                id: mouseArea6
                x: 0
                y: 6
                width: 50
                height: 50
                anchors.rightMargin: -25
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                //onClicked: vueGame.gestion(5);
            }

            MouseArea {
                id: mouseArea7
                x: -6
                y: -6
                width: 50
                height: 50
                anchors.bottom: parent.bottom
                anchors.leftMargin: -25
                anchors.left: parent.left
                anchors.bottomMargin: -25
                //onClicked: vueGame.gestion(6);
            }

            MouseArea {
                id: mouseArea8
                x: 6
                y: -5
                width: 50
                height: 50
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: -25
                //onClicked: vueGame.gestion(7);
            }

            MouseArea {
                id: mouseArea9
                x: -5
                y: -4
                width: 50
                height: 50
                anchors.bottom: parent.bottom
                anchors.rightMargin: -25
                anchors.right: parent.right
                anchors.bottomMargin: -25
                //onClicked: vueGame.gestion(8);
            }

            Rectangle {
                id: rectsub5
                x: 6
                y: -6
                width: 200
                height: 200
                color: "#00000000"
                border.width: 2
                anchors.left: rectsub3.right
                anchors.top: rectsub2.bottom
                anchors.topMargin: -100
                anchors.leftMargin: -100
            }

            Rectangle {
                id: rectsub6
                x: 4
                y: -12
                width: 4
                height: 280
                color: "#00000000"
                rotation: 45
                border.width: 2
                anchors.left: rectsub3.right
                anchors.top: rectsub2.bottom
                anchors.topMargin: -140
                anchors.leftMargin: -2
            }

            Rectangle {
                id: rectsub7
                x: 98
                y: -39
                width: 4
                height: 280
                color: "#00000000"
                border.width: 2
                anchors.left: rectsub3.right
                rotation: -45
                anchors.top: rectsub2.bottom
                anchors.topMargin: -140
                anchors.leftMargin: -2
            }
            border.width: 2
        }
    }

    Button {
        id: starter
        x: 108
        y: 255
        width: 386
        height: 58
        text: qsTr("Lancer le jeu")
        font.pointSize: 21
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
        id: textFieldJ2
        x: 209
        y: 179
        placeholderText: qsTr("Joueur 2")
        font.pointSize: 21
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
        id: textFieldJ1
        x: 200
        y: 106
        placeholderText: qsTr("Joueur 1")
        font.family: "Verdana"
        font.pointSize: 21
        anchors.horizontalCenter: parent.horizontalCenter
    }


}
