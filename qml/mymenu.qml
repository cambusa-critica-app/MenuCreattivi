import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.0
import "functions/CalcMenu.js" as CalcMenu
import "functions/CalcList.js" as CalcList
import "./models"
import "./tools"
import "./infos"
import "./settings"


//*******************************************************//
//                      full menu
//*******************************************************//

Item{
    id: rect_full_menu

    Component.onCompleted:
    {
        //current_menu.setMenu();
        //current_menu.storeMenu();
        menu_button_text.opacity    = 1;
        crea_button_text.opacity    = 0.5;
        importa_button_text.opacity = 0.5;
        home_button_text.opacity    = 0.5;
        top_underline.x =  mainWindow.width/4*3;
        importa_button_text.text = "IMPORTA"
    }

 Column{
        spacing: 0
        anchors.horizontalCenter: parent.horizontalCenter


  ScrollView{
      id: scroll_my_menu
      anchors.horizontalCenter: parent.horizontalCenter
      width: mainWindow.width
      height: mainWindow.height - top_bar.height  - row_menu_buttons.height
      verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff


  Column{

    spacing: mainWindow.height/70

    Text{text: " "} //spacer

    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        text: ""
        font.bold: true
        Component.onCompleted:
        {
            text += CalcMenu.getCurrentMenuName();
            console.log ("menu ID: " + CalcMenu.getMenuID())
        }
    }
    Text{
        id: save_reminder
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        text: "modifiche non salvate"
        font.italic: true
        visible: false
        Component.onCompleted:
        {
            if (!CalcMenu.getSavingStatus()) visible = true;
        }
    }

    Grid{
        id: grid_days
        anchors.horizontalCenter: parent.horizontalCenter
        columns: 3
        rows: 5
        spacing: 2

        Repeater{
            id: days_repeater
            model: CalcMenu.getShortNDAYS()
            Rectangle{
                id: rect_day
                width: mainWindow.width/3.5
                height: mainWindow.width/8
                radius: 5
                color: "#EEE8AA"
                border.width: 2
                border.color: "goldenrod"

                Text{
                    horizontalAlignment: Text.AlignHCenter;
                    anchors.verticalCenter: rect_day.verticalCenter;
                    anchors.horizontalCenter: rect_day.horizontalCenter;
                    text: CalcMenu.getGiornoEsatto(index+1)
                    Component.onCompleted:
                    {
                   /*     console.log("index = " + index
                                    + " giorno in = "+ CalcMenu.getDayIn()
                                    + " giorno fin = "+ CalcMenu.getDayFin()
                                    + " mese in = "+ CalcMenu.getMeseIn()
                                    + " mese fin = "+ CalcMenu.getMeseFin()
                                    + " giorno esatto "    + CalcMenu.getGiornoEsatto(index+1))
                        text = CalcMenu.getGiornoEsatto(index+1)*/
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        rect_day.color = "#d9eaee"
                    }
                    onReleased:
                    {

                        CalcMenu.setDayClicked(index);
                        stackView.push(Qt.resolvedUrl("daysel.qml"))
                        rect_day.color = "#EEE8AA"
                    }
                }
            }
        }
    }//end grid

    Rectangle {
        color: top_bar.color
        width: mainWindow.width
        height: mainWindow.height*0.065
        Text {
            color: mainWindow.color
            anchors.fill: parent
            text: qsTr("Cambia numero commensali")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea{
            anchors.fill: parent
            onClicked:
            {
                CalcMenu.setAggiornaMenu(true);
                CalcMenu.setNewList(true);
                stackView.push(Qt.resolvedUrl("crea_menu/crea_numeri.qml"));
            }
        }
    }

     Text{text: " "}

     Row{
         id: row_options
         //width: row_menu_buttons.width
         anchors.horizontalCenter: parent.horizontalCenter
         width: mail_ico.width + print_menu.width + print_html.width + save_button.width + 3*spacing
         height: mail_ico.height
         spacing: mail_ico.width/2

         Image{
             id: save_button
             anchors.verticalCenter: parent.verticalCenter
             source: "images/save_icon.png"
             width: (!CalcMenu.getSavingStatus()) ? mainWindow.width/7 : mainWindow.width/8
             fillMode: Image.PreserveAspectFit
             asynchronous: true
             opacity: 0.9
             MouseArea
             {
                 anchors.fill: parent
                 onClicked:
                 {
                     CalcMenu.setSalvaImporta("salva");
                     //menu_names.setNames();
                     stackView.push(Qt.resolvedUrl("salvataggio.qml"));
                 }
             }
          }

          Image{
              id: mail_ico
              anchors.verticalCenter: parent.verticalCenter
              //text: "Invia il menù"
              source: "images/mail_to.png"
              //width: parent.width/2 - parent.spacing
              width: mainWindow.width/8
              fillMode: Image.PreserveAspectFit
              asynchronous: true
              opacity: 0.7
              MouseArea
              {
                  anchors.fill: parent
                  onClicked:
                  {
                        stackView.push(Qt.resolvedUrl("loadSendMail.qml"))
                  }
              }
           }
          Image{
              id: print_menu
              anchors.verticalCenter: parent.verticalCenter
              source: "images/pdf_to.png"
              width: mainWindow.width/9
              fillMode: Image.PreserveAspectFit
              asynchronous: true
              opacity: 0.7
              MouseArea{
                  anchors.fill: parent
                  onClicked:{

                      stackView.push(Qt.resolvedUrl("loadFileLoader.qml"))
                  }
              }
          }

          Image{
              id: print_html
              anchors.verticalCenter: parent.verticalCenter
              source: "images/html_to.png"
              width: mainWindow.width/7.5
              fillMode: Image.PreserveAspectFit
              asynchronous: true
              opacity: 0.7
              MouseArea{
                  anchors.fill: parent
                  onClicked:{
                      stackView.push(Qt.resolvedUrl("loadCreateHTML.qml"))
                  }
              }
          }
     }//end row

     Text{ text: " "}
    }//end column
  // }//end rectangle
  }//end scrollview

  //bottom buttons
  Row{
      id: row_menu_buttons
      spacing: 1
      anchors.horizontalCenter: parent.horizontalCenter

      Rectangle {
          color: top_bar.color
          width: mainWindow.width/2
          height: mainWindow.height*0.065
          Text {
              color: mainWindow.color
              anchors.fill: parent
              text: qsTr("Lista spesa")
              horizontalAlignment: Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
          }

          MouseArea{
              anchors.fill: parent
              onPressed:
              {
                  rect_waiting.visible = true
                  loading_image.visible = true;
              }

              onReleased:
              {
                  if (CalcMenu.getNewList())
                  {
                     CalcList.azzeraListaSpesa(-1);
                     CalcList.creaListaSpesa(-1);
                     CalcMenu.setNewList(false);
                  }
                  stackView.clear();
                  stackView.push({item:rect_home_buttons, immediate: true})
                  stackView.push({item:Qt.resolvedUrl("mymenu.qml"), immediate: true})
                  stackView.push({item:Qt.resolvedUrl("visualizeListaSpesona.qml"), immediate:true})

              }
          }
      }

      Rectangle {
          color: top_bar.color
          width: mainWindow.width/2
          height: mainWindow.height*0.065
          Text {
              color: mainWindow.color
              anchors.fill: parent
              text: qsTr("Valuta menù")
              horizontalAlignment: Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
          }

          MouseArea{
              anchors.fill: parent                 
              onPressed:
              {
                  rect_waiting.visible = true
                  loading_image.visible = true;
              }
              onReleased:
              {
                  CalcList.evaluateFullMenu();
                  single_scores.setScores();
                  stackView.push(Qt.resolvedUrl("valutazione.qml"));
                  rect_waiting.visible = false;
                  loading_image.visible = false;
              }
          }
      }
      Component.onCompleted: console.log("completed bottom menù buttons")
  }
    Text{ text: " "}    //spacer

 } //end column

 Rectangle{
     id: rect_waiting
     color: "#cdd5ca"
     anchors.fill: parent
     opacity: 0.5
     visible: false

     Image
     {
         id: loading_image
         visible: false
         anchors.verticalCenter: parent.verticalCenter
         anchors.horizontalCenter: parent.horizontalCenter
         width: parent.width/7
         fillMode: Image.PreserveAspectFit
         opacity: 1
         source: "./images/clessidra.png"
         asynchronous: true
     }
 }
} //end item
