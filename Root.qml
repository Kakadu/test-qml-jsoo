import QtQuick 2.4
import "jscode.js" as Kamlo

Rectangle {
  id: rootWindow
  width: 640
  height: 480

  Component.onCompleted: {
    console.log("completed");
    console.log( Qt.plop );
    Qt.plop();
    Qt.plop();
    Qt.plop();
  }
}