import QtQuick 2.0
import Sailfish.Silica 1.0
import com.counter 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        Counter {
            id: counter
            count: 0;
        }

        Column {
            id: column
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            PageHeader {
                title: qsTr("Счетчик")
            }

            Label {
                id: label;
                anchors.horizontalCenter: parent.horizontalCenter
                text: counter.getCount();
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Увеличить"
                onClicked: {
                    counter.increment();
                    label.text = counter.getCount();
                }
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Сбросить"
                onClicked: {
                    counter.reset();
                    label.text = counter.getCount();
                }
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height - 200
            text: "Вперед"
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Page2.qml")))
        }
    }
}
