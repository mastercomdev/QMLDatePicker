import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/moment.js" as M

Item{
    width: parent.width
    height: width

    Component.onCompleted: {
        determineMonth()
    }

    GridView{
        id: gridview
        anchors.fill: parent
        cellWidth: width/3-1
        cellHeight: height/4
        interactive: contentHeight>height
        model: yearModel
        delegate: DatePickerCell{
            width: GridView.view.cellWidth
            height: GridView.view.cellHeight
            text: value
            isToday: gridview.currentIndex===index

            onClicked: {
                const momentSelectedDate= M.moment(selectedDate)
                selectedDate= M.moment(selectedDate).year(yearModel.get(index).value).format("YYYY/MM/DD")
                gridview.currentIndex= index
                determineDate()
                view= "Date"
            }
        }
    }

    function determineMonth(){
        const momentSelectedDate= M.moment(selectedDate)
        const currentYear= M.moment(selectedDate).year().toString() //1-31

        console.log(currentYear)
        for(var i=0; i<yearModel.count; i++){
            if(currentYear===yearModel.get(i).value){
                gridview.currentIndex= i
            }
        }
    }
}
