import QtQuick 2.6
import QtQuick.Window 2.2


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Compteur")

    Rectangle {
        id: compteur

        width: 320
        height: 240
        property alias rectangle: rectangle
        property alias text1: text1

        Rectangle {
            id: rectangle
            width: 100
            height: 50
            color: "#0032a0"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: text1
                color: "#ff8300"
                text: qsTr("Text")
                font.bold: true
                font.family: "Verdana"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                font.pixelSize: 30
            }
        }
    }

}
