import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Moment JS Date Picker")


    ColumnLayout{
        anchors.centerIn: parent
        width: 250

        Label{
            text: "Select Date"
        }

        TextField{
            Layout.fillWidth: true
            placeholderText: "Select a Date"
            text: datePicker.selectedDate

            onPressed: {
                datePicker.open()
            }
        }
    }

    DatePicker{
        id: datePicker
    }
}
