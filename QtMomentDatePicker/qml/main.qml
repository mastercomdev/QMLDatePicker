import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Moment JS Date Picker")
    Material.theme: Material.Light

    //Switch between dark and light theme
    ToolButton{
        anchors.right: parent.right
        text: Material.theme===Material.Dark ? "🌒" : "🌕"

        onClicked: {
            if(window.Material.theme===Material.Dark){
                window.Material.theme= Material.Light
            }else{
                window.Material.theme= Material.Dark
            }
        }
    }


    //Main application layout
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

    //Can be implimented as popup anywhere
    DatePicker{
        id: datePicker
        darkTheme: Material.theme===Material.Dark
        // selectedDate: "2024/11/26" //Override current date of the date picker
        // modal: false //Disable popup modality
        // parent: Overlay.overlay //Usefull for usage of virtual keyboards
        // closePolicy: "NoAutoClose" //Control close policy
        // Use any popup properties safely

        onAccepted: {
            //Actions
        }
        onRejected: {
            //Actions
        }
    }
}
