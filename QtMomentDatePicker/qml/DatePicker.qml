import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/moment.js" as M

Popup {
    id: root
    x: parent.width/2-width/2
    y: parent.height/2-height/2
    width: 300
    height: mainColumn.height+padding*2
    modal: true

    //Properties
    property string selectedDate: "2024/11/09"
    property string backupSelectedDate: "0000/00/00"
    property string view: "Date"
    //Signals
    signal clear()
    signal accepted()
    signal rejected()

    Component.onCompleted: {
        determineDate()
    }
    onAboutToShow: {
        backupSelectedDate= selectedDate
    }

    ColumnLayout{
        id: mainColumn
        width: parent.width
        spacing: 12

        Label{
            Layout.fillWidth: true
            text: "Select Date"
            font.pointSize: 14
            font.weight: Font.Bold
        }

        RowLayout{
            Layout.alignment: Qt.AlignRight

            Button{
                text: "<"
                flat: true

                onClicked: {
                    prevMonth()
                }
            }

            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 32

                Label{
                    anchors.fill: parent
                    text: M.moment(selectedDate, "YYYY/MM/DD").year()
                    horizontalAlignment: "AlignRight"
                    verticalAlignment: "AlignVCenter"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        view= "Year"
                    }
                }
            }

            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 32

                Label{
                    anchors.fill: parent
                    text: monthModel.get(M.moment(selectedDate, "YYYY/MM/DD").month()).value
                    horizontalAlignment: "AlignLeft"
                    verticalAlignment: "AlignVCenter"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        view= "Month"
                    }
                }
            }


            Button{
                text: ">"
                flat: true

                onClicked: {
                    nextMonth()
                }
            }
        }

        Loader{
            id: loader
            Layout.fillWidth: true
            Layout.preferredHeight: item.height
            source: root.view==="Date"  ? "DatePickerDate.qml" :
                    root.view==="Month" ? "DatePickerDateMonth.qml" :
                                          "DatePickerDateYear.qml"
        }

        RowLayout{
            Layout.alignment: Qt.AlignRight

            Button{
                text: "Cancel"
                flat: true

                onClicked: {
                    root.rejected()
                    root.close()
                    root.clear()
                    selectedDate= backupSelectedDate
                }
            }
            Button{
                text: "Ok"
                flat: true

                onClicked: {
                    root.accepted()
                    root.close()
                }
            }
        }
    }

    //Data models
    ListModel{
        id: daysModel
    }
    ListModel{
        id: monthModel
        ListElement{
            value: "Jan"
        }
        ListElement{
            value: "Feb"
        }
        ListElement{
            value: "Mar"
        }
        ListElement{
            value: "Apr"
        }
        ListElement{
            value: "May"
        }
        ListElement{
            value: "Jun"
        }
        ListElement{
            value: "Jul"
        }
        ListElement{
            value: "Aug"
        }
        ListElement{
            value: "Sep"
        }
        ListElement{
            value: "Oct"
        }
        ListElement{
            value: "Nov"
        }
        ListElement{
            value: "Dec"
        }
    }
    ListModel{
        id: yearModel
        ListElement{
            value: "2024"
        }
        ListElement{
            value: "2025"
        }
        ListElement{
            value: "2026"
        }
        ListElement{
            value: "2027"
        }
        ListElement{
            value: "2028"
        }
        ListElement{
            value: "2029"
        }
    }

    //Functions
    function determineDate(){
        daysModel.clear()
        const momentSelectedDate= M.moment(selectedDate)
        const currentDate= M.moment(selectedDate).date() //1-31
        let firstDayOfMonth = momentSelectedDate.startOf('month');
        let firstDayWeekday = firstDayOfMonth.day();


        for(var i=-firstDayWeekday; i<momentSelectedDate.daysInMonth(); i++){
            if(i<0)
                daysModel.append({
                                     value: "",
                                     today: false
                                 })
            else
                daysModel.append({
                                     value: (i+1).toString(),
                                     today: currentDate===(i+1)
                                 })
        }
    }

    function nextMonth(){
        // Define the selected date
        let targetDate = M.moment(selectedDate, "YYYY/MM/DD");

        // Add one month to the selected date
        let newDate = targetDate.add(1, 'months');

        selectedDate= newDate.format("YYYY/MM/DD")

        determineDate()
    }

    function prevMonth(){
        // Define the selected date
        let targetDate = M.moment(selectedDate, "YYYY/MM/DD");

        // Add one month to the selected date
        let newDate = targetDate.subtract(1, 'months');

        selectedDate= newDate.format("YYYY/MM/DD")

        determineDate()
    }
}
