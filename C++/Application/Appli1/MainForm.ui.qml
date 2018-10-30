import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: page
    width: 640
    height: 480
    property alias bottomLeftRect: bottomLeftRect
    property alias mouseArea1: mouseArea1
    property alias mouseArea2: mouseArea2
    property alias mouseArea3: mouseArea3
    property alias middleRightRect: middleRightRect
    property alias topLeftRect: topLeftRect
    property alias icon: icon

    Image {
        id: icon
        x: 10
        y: 20
        width: 55
        height: 41
        source: "qt-logo.png"
    }

    Rectangle {
        id: topLeftRect
        width: 55
        height: 41
        color: "#00000000"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        border.color: "#808080"
        visible: true

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
        }
    }

    Rectangle {
        id: middleRightRect
        x: -7
        y: -9
        width: 55
        height: 41
        color: "#00000000"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        MouseArea {
            id: mouseArea2
            anchors.fill: parent
        }
        visible: true
        border.color: "#808080"
    }

    Rectangle {
        id: bottomLeftRect
        y: 7
        width: 55
        height: 41
        color: "#00000000"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        MouseArea {
            id: mouseArea3
            anchors.fill: parent
        }
        visible: true
        border.color: "#808080"
    }
}
