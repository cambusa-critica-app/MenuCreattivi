import QtQuick 2.4
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.3
import Qt.labs.settings 1.0
import "../functions/CalcMenu.js" as CalcMenu
import ".."


//*********************************************************//
// rectangle numeri
Item
{
    id: rect_numeri
    Component.onCompleted: console.log("Created numeri ragazzi...")

    Image{
        anchors.left: parent.left
        anchors.leftMargin: 10
        y: ragazzi_slider.y
        source: "../images/male.png"
        height: mainWindow.height/10
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }


    Image{
        anchors.left: parent.left
        anchors.leftMargin: 10
        y: ragazze_slider.y
        source: "../images/female.png"
        height: mainWindow.height/10
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    Column
    {
    anchors.centerIn: parent
    anchors.horizontalCenterOffset: mainWindow.width*0.05
    anchors.verticalCenterOffset: -mainWindow.height*0.001
    width: mainWindow.width*0.7
    spacing: 1

    Text { text: "Uomini (18+ anni): " + uomini_slider.value ; color: (uomini_slider.value>0) ? "green": "black" }
    Slider{
       id: uomini_slider
       width: parent.width
       height: mainWindow.height/20
       style: SliderStyle
       {
             groove: Rectangle {
                 implicitWidth: parent.width
                 implicitHeight: 5
                 color: "gray"
                 radius: 8
             }
             handle: Rectangle {
                 anchors.centerIn: parent
                 color: control.pressed ? "white" : "lightgray"
                 border.color: "gray"
                 border.width: 2
                 implicitWidth: 20
                 implicitHeight: 15
                 radius: 8
             }
        }

        minimumValue: 0
        maximumValue: (CalcMenu.getTipo() === "famiglia") ? 4 : 50
        stepSize: 1.0
        updateValueWhileDragging : true
        //Settings { property alias value_uomini: uomini_slider.value  }
        onValueChanged: CalcMenu.setNuomini(uomini_slider.value);
        Component.onCompleted: uomini_slider.value = CalcMenu.getNuomini();
        //Component.onCompleted: CalcMenu.setNragazzi(ragazzi_slider.value);
   }

    Text { text: "Ragazzi (12-17 anni): " + ragazzi_slider.value; color: (ragazzi_slider.value>0) ? "green": "black" }
    Slider{
       id: ragazzi_slider
       width: parent.width
       height: mainWindow.height/20
       style: SliderStyle
       {
             groove: Rectangle {
                 implicitWidth: parent.width
                 implicitHeight: 5
                 color: "gray"
                 radius: 8
             }
             handle: Rectangle {
                 anchors.centerIn: parent
                 color: control.pressed ? "white" : "lightgray"
                 border.color: "gray"
                 border.width: 2
                 implicitWidth: 20
                 implicitHeight: 15
                 radius: 8
             }
        }

        minimumValue: 0
        maximumValue: (CalcMenu.getTipo() === "famiglia") ? 4 : 50
        stepSize: 1.0
        updateValueWhileDragging : true
        //Settings { property alias value_ragazzi: ragazzi_slider.value  }
        onValueChanged: CalcMenu.setNragazzi(ragazzi_slider.value);
        Component.onCompleted: ragazzi_slider.value = CalcMenu.getNragazzi();
   }

Text { text: "Bambini (7-11 anni): " + bambini_slider.value; color: (bambini_slider.value>0) ? "green": "black"  }
Slider{
   id: bambini_slider
   width: parent.width
   height: mainWindow.height/20
   style: SliderStyle
   {
         groove: Rectangle {
             implicitWidth: parent.width
             implicitHeight: 5
             color: "gray"
             radius: 8
         }
         handle: Rectangle {
             anchors.centerIn: parent
             color: control.pressed ? "white" : "lightgray"
             border.color: "gray"
             border.width: 2
             implicitWidth: 20
             implicitHeight: 15
             radius: 8
         }
    }

    minimumValue: 0
    maximumValue: (CalcMenu.getTipo() === "famiglia") ? 4 : 50
    stepSize: 1.0
    updateValueWhileDragging : true
    //Settings { property alias value_bambini: bambini_slider.value  }
    onValueChanged: CalcMenu.setNbambini(bambini_slider.value);
    Component.onCompleted: bambini_slider.value = CalcMenu.getNbambini();
}

  Text{text: " "}
  Text{text: " "}

  Text { text: "Donne (18+ anni): " + donne_slider.value; color: (donne_slider.value>0) ? "green": "black" }
  Slider{
     id: donne_slider
     width: parent.width
     height: mainWindow.height/20
     style: SliderStyle
     {
           groove: Rectangle {
               implicitWidth: parent.width
               implicitHeight: 5
               color: "gray"
               radius: 8
           }
           handle: Rectangle {
               anchors.centerIn: parent
               color: control.pressed ? "white" : "lightgray"
               border.color: "gray"
               border.width: 2
               implicitWidth: 20
               implicitHeight: 15
               radius: 8
           }
     }
     minimumValue: 0
     maximumValue: (CalcMenu.getTipo() === "famiglia") ? 4 : 50
     stepSize: 1.0
     updateValueWhileDragging : true
     //Settings { property alias value_donne: donne_slider.value  }
     onValueChanged: CalcMenu.setNdonne(donne_slider.value);
     Component.onCompleted: donne_slider.value = CalcMenu.getNdonne();
  }

Text { text: "Ragazze (12-17 anni): " + ragazze_slider.value ; color: (ragazze_slider.value>0) ? "green": "black"}
Slider{
   id: ragazze_slider
   width: parent.width
   height: mainWindow.height/20
   style: SliderStyle
   {
         groove: Rectangle {
             implicitWidth: parent.width
             implicitHeight: 5
             color: "gray"
             radius: 8
         }
         handle: Rectangle {
             anchors.centerIn: parent
             color: control.pressed ? "white" : "lightgray"
             border.color: "gray"
             border.width: 2
             implicitWidth: 20
             implicitHeight: 15
             radius: 8
         }
   }
   minimumValue: 0
   maximumValue: (CalcMenu.getTipo() === "famiglia") ? 4 : 50
   stepSize: 1.0
   updateValueWhileDragging : true
   //Settings { property alias value_ragazze: ragazze_slider.value  }
   onValueChanged: CalcMenu.setNragazze(ragazze_slider.value);
   Component.onCompleted: ragazze_slider.value = CalcMenu.getNragazze();
}

Text { text: "Bambine (7-11 anni): " + bambine_slider.value; color: (bambine_slider.value>0) ? "green": "black" }
Slider{
   id: bambine_slider
   width: parent.width
   height: mainWindow.height/20
   style: SliderStyle
   {
         groove: Rectangle {
             implicitWidth: parent.width
             implicitHeight: 5
             color: "gray"
             radius: 8
         }
         handle: Rectangle {
             anchors.centerIn: parent
             color: control.pressed ? "white" : "lightgray"
             border.color: "gray"
             border.width: 2
             implicitWidth: 20
             implicitHeight: 15
             radius: 8
         }
   }
   minimumValue: 0
   maximumValue: (CalcMenu.getTipo() === "famiglia") ? 4 : 50
   stepSize: 1.0
   updateValueWhileDragging : true
   //Settings { property alias value_bambine: bambine_slider.value  }
   onValueChanged: CalcMenu.setNbambine(bambine_slider.value);
   Component.onCompleted: bambine_slider.value = CalcMenu.getNbambine();
}

  Text{
    anchors.horizontalCenter: parent.horizontalCenter
    text: "Totale"
    font.pointSize: 14
    }
  Text{
    anchors.horizontalCenter: parent.horizontalCenter
    text: (uomini_slider.value + ragazzi_slider.value + bambini_slider.value + donne_slider.value + ragazze_slider.value + bambine_slider.value)
    font.pointSize: 24
  }
 }// end column


 Rectangle {
      width: parent.width
      height: mainWindow.height*0.065
      color: top_bar.color

      anchors.horizontalCenter: parent.horizontalCenter
      anchors.verticalCenter: parent.bottom
      anchors.verticalCenterOffset: -height/2

      Text {
          id: testo_bottom
          color: "#ffffff"
          anchors.fill: parent
          text: (CalcMenu.getAggiornaMenu()) ? "Aggiorna" : ( (CalcMenu.getConsultaDosi()) ? "Ricalcola grammature" : "Avanti" )
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
      }
      MouseArea {
          anchors.fill: parent
          onPressed:
          {
            testo_bottom.text = "in elaborazione..."
            parent.color =  "#c4c238"
          }
          onReleased:
          {

              CalcMenu.setNuomini (uomini_slider.value);
              CalcMenu.setNdonne  (donne_slider.value);
              CalcMenu.setNragazzi(ragazzi_slider.value);
              CalcMenu.setNragazze(ragazze_slider.value);
              CalcMenu.setNbambine(bambine_slider.value);
              CalcMenu.setNbambini(bambini_slider.value);

              if (CalcMenu.getAggiornaMenu())
              {
                     current_menu.storeMenu();
                     stackView.pop();
                     //testo_bottom.text = "Avanti"
              }
              else if (CalcMenu.getConsultaDosi())
              {
                    CalcMenu.setConsulta(true);
                    stackView.pop();
                    stackView.pop();
                    stackView.push({item:Qt.resolvedUrl("../recipesel.qml"), immediate: true});
                   // testo_bottom.text = "Avanti"
              }

              else  { stackView.push(Qt.resolvedUrl("crea_giorni.qml")); testo_bottom.text = "Avanti"}
          }
      }
   }

   Component.onDestruction:
   {
      CalcMenu.setAggiornaMenu(false)
      CalcMenu.setConsultaDosi(false);
   }
 } //end item  numeri

