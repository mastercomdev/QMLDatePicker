import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/moment.js" as M

Item{
    width: parent.width
    height: width

    GridView{
        anchors.fill: parent
        cellWidth: width/3-1
        cellHeight: height/4
        model: 12
        delegate: DatePickerCell{
            width: GridView.cellWidth
            height: GridView.cellHeight
            text: index
        }
    }
}
