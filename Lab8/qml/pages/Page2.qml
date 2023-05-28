import QtQuick 2.0
import Sailfish.Silica 1.0
import com.stringlist 1.0

Page {
    id: page
    allowedOrientations: Orientation.All
    SilicaFlickable {
        anchors.fill: parent

        StringList {
            id: stringList
        }


        Column {
            id: column
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            PageHeader {
                title: qsTr("Список")
            }

            TextField {
                id: textField;
                placeholderText: "Введите слово"
            }
            Button {
                text: "Добавить слово"
                onClicked: {

                    var error = stringList.add(textField.text);
                    if (error) {
                        errorLabel.text = ""
                    } else {
                        errorLabel.text = ""
                    }

                    label.text = stringList.getAll();
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Button {
                text: "Удалить слово"
                onClicked: {
                    stringList.popBack();
                    label.text = stringList.getAll();
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }
            TextField {
                id: label;
                width: parent.width;
                x: Theme.horizontalPageMargin
                text: stringList.getAll()
                readOnly: true;
            }

            Label {
                id: errorLabel
                text: ""
                color: "red"
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height - 200
            text: "Назад"
            onClicked: pageStack.pop()
        }
    }
}
