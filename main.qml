import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 640
    height: 480
    color: "#7984dd"
    title: qsTr("Hello World")
    Expander{
        x: 157
        y: 95
        width: 353
        height: 220
        headerheight: 50
        headersize: 40
        title: "title"
        flowDirection: Qt.RightToLeft
        content: Item{

        }
    }
}
