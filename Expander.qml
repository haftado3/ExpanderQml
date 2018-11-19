import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.0

Item {
    property alias title: titleText.text
    property alias flowDirection: row.layoutDirection
    property alias content: innerItem
    property int headersize : 40
    property int headerheight: 50
    id: expanderItem
    clip:true
    Rectangle{
        id:contentRect
        width: expanderItem.width
        height: expanderItem.height-headersize
        radius: 10
        anchors.top: parent.top
        anchors.topMargin: headersize
        border.width: 0
        Behavior on height { NumberAnimation { duration: 250 } }
        Item{
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.topMargin: headerheight - headersize
            anchors.top: parent.top
            Item{
                anchors.fill: parent
                id: innerItem
            }
        }
    }
    Item {
        id: headerItem
        height: headerheight
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        clip: true
        Rectangle {
            id: headerRect
            anchors.fill: parent
            anchors.bottomMargin: -radius
            radius: 10
            border.width: 0
            color: "#323a45"
            Row {
                id: row
                y: 0
                height: headerheight
                layoutDirection: Qt.LeftToRight
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                Item {
                    id: expanderHandle
                    width: headerheight
                    height: headerheight
                    Text {
                        id: iconText
                        text: qsTr("\uea6e")
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.family: "IcoFont"
                        color: "white"
                        font.pixelSize: headersize
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(contentRect.height == 0){
                                    contentRect.height = expanderItem.height - headersize
                                    parent.text= "\uea6e"
                                }
                                else{
                                    contentRect.height = 0;
                                    parent.text= "\uea6b"
                                }
                            }
                        }
                    }
                }
                Item {
                    id: titleItem
                    width: headerRect.width-headerheight
                    height: headerheight

                    Text {
                        id: titleText
                        color: "#ffffff"
                        text: qsTr("Title")
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 15
                    }
                }
            }
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
