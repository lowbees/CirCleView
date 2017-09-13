import QtQuick 2.0
import QtQuick.Controls 2.1

Item {

    width: 600
    height: 230
    CircleView {
        id: cirCleView
        model: ListModel {
            ListElement { picUrl: 'file:///C:/Users/Administrator/Desktop/CloudMusic/e0gGadEhjur2UuUpDF9hPg==-7788940372125389.jpg' }
            ListElement { picUrl: 'file:///C:/Users/Administrator/Desktop/CloudMusic/mp2Y2n4ueZzIj6JSnUOdtw==-7875801790676538.jpg' }
            ListElement { picUrl: 'file:///C:/Users/Administrator/Desktop/CloudMusic/tGPljf-IMOCyPvumoWLOTg==-7987951976374270.jpg' }
            ListElement { picUrl: 'file:///C:/Users/Administrator/Desktop/CloudMusic/CTU5B9R9y3XyYBZXJUXzTg==-2897213141428023.jpg' }
            ListElement { picUrl: 'file:///C:/Users/Administrator/Desktop/CloudMusic/V9-MXz6b2MNhEKjutoDWIg==-7937374441542745.jpg' }
            ListElement { picUrl: 'file:///C:/Users/Administrator/Desktop/CloudMusic/s25q2x5QyqsAzilCurD-2w==-7973658325212564.jpg' }
        }

        delegate: Item {
            width: cirCleView.width
            height: cirCleView.height
            Image {
                anchors.fill: parent
                source: picUrl
            }
            MouseArea {
                anchors.fill: parent
                onClicked: Qt.openUrlExternally(picUrl)
            }
        }


        onDraggingChanged: {
            if (dragging)
                timer.stop()
            else
                timer.start()
        }
    }

    PageIndicator {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        count: cirCleView.count
        currentIndex: cirCleView.currentIndex
    }

    Timer {
        id: timer
        running: true
        repeat: true
        interval: 1000
        onTriggered: cirCleView.currentIndex = (cirCleView.currentIndex + 1) % cirCleView.count
    }
}
