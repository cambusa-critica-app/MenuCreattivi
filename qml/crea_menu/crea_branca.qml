import QtQuick 2.4
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.3
import Qt.labs.settings 1.0
import "../functions/CalcMenu.js" as CalcMenu
import ".."

//*********************************************************//
// per chi cucino? - gruppo

Item{
  id: rect_perchi
  Component.onCompleted:
  {
      crea_button_text.opacity = 1
      menu_button_text.opacity = 0.5;
      importa_button_text.opacity = 0.5;
      home_button_text.opacity = 0.5;
      top_underline.x =  mainWindow.width/4;
      console.log("Created per chi cucino...")
      importa_button_text.text = "IMPORTA"
  }


  Column{
     id: grid_column
     spacing: 20
     anchors.centerIn: parent
     anchors.verticalCenterOffset: -mainWindow.height*0.05
     width: mainWindow.width*0.7

     Text{
         text: " "
     }

     Image{
         id: id_family
         source: "../images/family_icon.png"
         fillMode: Image.PreserveAspectFit
         anchors.horizontalCenter: parent.horizontalCenter
         width: mainWindow.width/3.5
         opacity: 0.3
       //  asynchronous: true
         MouseArea {
             anchors.fill: parent
             onClicked: {
                 CalcMenu.setTipo("famiglia");
                 text_tipo.text = "Famiglia"
                 eta_tipo.text = "Famiglia"
                 id_family.opacity = 1
                 id_group.opacity = 0.3
             }
         }
         Settings { property alias opacity_f: id_family.opacity }
     }

     Image{
         id: id_group
         source: "../images/group_icon.png"
         fillMode: Image.PreserveAspectFit
         width: mainWindow.width/3.5
         anchors.horizontalCenter: parent.horizontalCenter
         opacity: 0.3
       //  asynchronous: true
         MouseArea {
             anchors.fill: parent
             onClicked: {
                 CalcMenu.setTipo("gruppo");
                 text_tipo.text = "Gruppo numeroso"
                 eta_tipo.text = "Gruppo numeroso"
                 id_group.opacity = 1
                 id_family.opacity = 0.3
             }
         }
         Settings { property alias opacity_g: id_group.opacity }
     }

    Text{
      anchors.horizontalCenter: parent.horizontalCenter
      //text: " " + text_tipo.text.toUpperCase() + " "
      text: " " + text_tipo.text + " "
      font.pointSize: 24
    }
    /*
    Text{
      anchors.horizontalCenter: parent.horizontalCenter
      text: "Età: " + eta_tipo.text
    }*/
    Text{
      id: text_tipo
      visible: false
      Settings { property alias value_tipo: text_tipo.text }
      Component.onCompleted: CalcMenu.setTipo(text_tipo.text)
    }
    Text{
      id: eta_tipo
      visible: false
      Settings { property alias eta_tipo: eta_tipo.text }
    }
 }//end column

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
               text: qsTr("Avanti")
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
                   CalcMenu.setAggiornaMenu(false);
                   if (id_group.opacity === 1) CalcMenu.setTipo("gruppo");
                   else                        CalcMenu.setTipo("famiglia");
                   stackView.push(Qt.resolvedUrl("crea_numeri.qml"));
                   testo_bottom.text = "Avanti"
               }
           }
       }
}//end item perchi

