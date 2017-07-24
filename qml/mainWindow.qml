import QtQuick 2.2
import Qt.labs.settings 1.0
import QtQuick.Controls 1.3
import QtQuick.Window 2.1
import "functions/CalcMenu.js" as CalcMenu
import "functions/CalcList.js" as CalcList
import "functions/CalcList.js" as CalcFunctions
import "./models"
import "./tools"
import "./infos"
import "./settings"
import "./crea_menu"



ApplicationWindow
{
    id: mainWindow
    width: 300
    height: 480
    color: "#eee5d0"
    //color: "#e6e1c6"
    //Component.onCompleted: console.log("Created mainWindow...")
    visible: true


    toolBar: Rectangle
    {
        id: top_bar
        visible: true
        width: parent.width
        height: top_image.height + buttons_row.height
        color: "#415ba2"  //standard

        //  Component.onCompleted: console.log("Created top bar...")

        Image
        {
            id: top_image
            source: "images/creattivia_logo_reboot.png"
            height: buttons_row.height*3
            fillMode: Image.PreserveAspectFit
            asynchronous: true

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackView.clear()
                    stackView.push(rect_home_buttons)
                    menu_button_text.opacity = 0.5;
                    crea_button_text.opacity = 0.5;
                    importa_button_text.opacity = 0.5;
                    home_button_text.opacity = 1;
                    top_underline.x = 0;
                    rect_options.visible = false
                    importa_button_text.text = "IMPORTA"
                }
            }
        }

        Row{
            id: buttons_row
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: top_image.bottom
            spacing: 0

            Rectangle {
                width: mainWindow.width/4
                height: mainWindow.height/20
                color: top_bar.color
                MouseArea {
                    anchors.fill: parent
                    onClicked:
                    {
                        stackView.clear()
                        stackView.push(rect_home_buttons)
                        menu_button_text.opacity = 0.5;
                        importa_button_text.opacity = 0.5;
                        crea_button_text.opacity = 0.5;
                        home_button_text.opacity = 1;
                        top_underline.x =  0;
                        rect_options.visible = false
                    }
                }
                Text {
                    id: home_button_text
                    color: "#ffffff"
                    opacity: 1
                    anchors.fill: parent
                    textFormat: Text.PlainText
                    text: "HOME"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
             }

             Rectangle {
                 width: mainWindow.width/4
                 height: mainWindow.height/20
                 color: top_bar.color
                 MouseArea {
                     anchors.fill: parent
                     onClicked:
                     {
                         stackView.push(Qt.resolvedUrl("crea_menu/crea_branca.qml"));
                         menu_button_text.opacity = 0.5;
                         home_button_text.opacity = 0.5;
                         importa_button_text.opacity = 0.5;
                         crea_button_text.opacity = 1;
                         top_underline.x =  mainWindow.width/4;
                         rect_options.visible = false
                     }
                 }
                 Text {
                     id: crea_button_text
                     color: "#ffffff"
                     opacity: 0.5
                     anchors.fill: parent
                     textFormat: Text.PlainText
                     text: "CREA"
                     horizontalAlignment: Text.AlignHCenter
                     verticalAlignment: Text.AlignVCenter
                 }
             }
             Rectangle{
                 width: mainWindow.width/4
                 height: mainWindow.height/20
                 color: top_bar.color
                 MouseArea {
                     anchors.fill: parent
                     onClicked:
                     {
                         CalcMenu.setSalvaImporta("importa");
                         stackView.push(Qt.resolvedUrl("salvataggio.qml"));
                         menu_button_text.opacity = 0.5;
                         crea_button_text.opacity = 0.5;
                         home_button_text.opacity = 0.5;
                         importa_button_text.opacity = 1;
                         top_underline.x =  mainWindow.width/4*2;
                         rect_options.visible = false
                     }
                 }
                 Text {
                     id: importa_button_text
                     color: "#ffffff"
                     anchors.fill: parent
                     opacity: 0.5
                     textFormat: Text.PlainText
                     text: "IMPORTA"
                     horizontalAlignment: Text.AlignHCenter
                     verticalAlignment: Text.AlignVCenter
                 }
             }
             Rectangle {
                width: mainWindow.width/4
                height: mainWindow.height/20
                color: top_bar.color

                MouseArea {
                    anchors.fill: parent

                    onPressed:
                    {
                        rect_waiting.visible = true
                        loading_image.visible = true;
                    }
                    onReleased:
                    {
                      if (stackView.depth>1)
                      {
                          stackView.clear();
                          stackView.push(rect_home_buttons);
                      }
                      if (CalcMenu.onStartUp())
                      {
                          console.log("Setting start up configuration...");
                          current_menu.setMenu();
                          CalcMenu.setOnStartUp(false);
                      }
                      //CalcList.setVetos();
                      //CalcList.setRestrictedListINDEX();
                      //current_menu.setMenu();
                      stackView.push(Qt.resolvedUrl("mymenu.qml"));
                      menu_button_text.opacity = 1;
                      importa_button_text.opacity = 0.5;
                      home_button_text.opacity = 0.5;
                      crea_button_text.opacity = 0.5;
                      top_underline.x =  mainWindow.width/4*3;
                      rect_options.visible = false
                      rect_waiting.visible = false

                    }
                 }
                Text {
                    id: menu_button_text
                    color: "#ffffff"
                    opacity: 0.5
                    anchors.fill: parent
                    text: qsTr("MENÙ")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
             }
       }

       Rectangle
       {
           id: top_underline
           width: mainWindow.width/4
           height: 3
           border.width: 2
           border.color: "#e6e1c6"
           color: "#e6e1c6"
           anchors.bottom: buttons_row.bottom
           x: 0
       }
    }


    //instantiate models

    Breakfast   {id: breakfastModel}
    Primo       {id: primiModel}
    Secondo     {id: secondiModel}
    Snacks      {id: snacksModel}
    FullMeal    {id: fullMealModel}
    Contorni    {id: contorniModel}
    Frutta      {id: fruttaModel}
    Pane        {id: paneModel}
    Ingredienti {id: ingModel}

    ListModel {
        id: listaSpesa
        ListElement{
            ingrediente: ""
            dose: 0
            unit: ""
            missing: ""
            sezione: ""
        }
    }

    ListModel {
        id: listaSpesaGiorno
        ListElement{
            ingrediente: ""
            dose: 0
            unit: ""
                missing: ""
            sezione: ""
        }
        Component.onCompleted: console.log("Created listaSpesaGiorno at startup...")
    }

    ListModel {        id: listaColazioni   }
    ListModel {        id: listaPrimi       }
    ListModel {        id: listaSecondi     }
    ListModel {        id: listaContorni    }
    ListModel {        id: listaSnacks      }
    ListModel {        id: listaFullMeal    }
    ListModel {        id: listaFrutta      }
    ListModel {        id: listaPane        }


    MenuSettings    {id: current_menu}
    EvaluateCriteria{id: single_scores}

    Text{id: recipe_type; visible: false; textFormat: Text.PlainText}
    Text{id: meal_sel;    visible: false; textFormat: Text.PlainText}
    Text{id: recipe_id;   visible: false; textFormat: Text.PlainText}


    // define main stackview
    StackView
    {
        id: stackView        
        visible: true
        initialItem: rect_home_buttons
        anchors.fill: parent
        anchors.centerIn: parent

        Component.onCompleted:
        {

            CalcList.setVetos();
            CalcList.setRestrictedListINDEX();
            CalcList.clearCustomLists();
            CalcList.fillCustomLists();
            console.log("Create main stackview...")
        }

        // Implements back key navigation
        focus: true
        Keys.onReleased: if (event.key === Qt.Key_Back && stackView.depth > 1) {
                             stackView.pop();
                             event.accepted = true;
                             }

    //*********************************************************//
        //*********************************************************//
        // home buttons
         Item{
             id: rect_home_buttons
             MouseArea
             {
                 anchors.fill: parent
                 onClicked: rect_options.visible = false
             }

             Component.onCompleted:
             {
                  home_button_text.opacity = 1;
                  crea_button_text.opacity = 0.5;
                  importa_button_text.opacity = 0.5;
                  menu_button_text.opacity = 0.5;
                  top_underline.x =  0;
                  console.log("Created rect home buttons...");
                  importa_button_text.text = "IMPORTA"
                  loader_column.sourceComponent = comp_but_column
              }

             Loader
             {
                 id: loader_column
                 asynchronous: true
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.verticalCenter: parent.verticalCenter
             }

             Component{
                 id: comp_but_column

                 Column{

                     anchors.horizontalCenter: parent.horizontalCenter
                     anchors.verticalCenter: parent.verticalCenter
                     anchors.verticalCenterOffset: -mainWindow.height/25
                     spacing: 5


                     Rectangle {
                         id: rect_selfp
                         width: mainWindow.width*0.75 //*0.35
                         height: mainWindow.height/8
                         color: "#d3ecc2"
                         border.width: 2
                         radius: 15
                         anchors.horizontalCenter: parent.horizontalCenter

                         Text {
                             //anchors.fill: parent
                             anchors.verticalCenter: parent.verticalCenter
                             anchors.left: parent.left
                             anchors.leftMargin: parent.width/5
                             textFormat: Text.PlainText
                             text: qsTr("Crea\nMenù")
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                         }
                         Image
                         {
                             visible: true
                             opacity: 0.8
                             anchors.verticalCenter: parent.verticalCenter
                             anchors.right: parent.right
                             anchors.rightMargin: parent.width/5
                             width: parent.height*0.8
                             fillMode: Image.PreserveAspectFit
                             source: "images/crea_menu_fig.png"
                             asynchronous: true
                         }

                         MouseArea
                         {
                             id: mouseArea1
                             anchors.fill: parent
                             onPressed:
                             {
                                 rect_waiting.visible = true
                                 loading_image.visible = true;
                             }
                             onReleased:
                             {
                                 stackView.push(Qt.resolvedUrl("crea_menu/crea_branca.qml"));
                                 rect_options.visible = false
                                 rect_waiting.visible = false
                             }
                         }
                       }

                  //vedi ricette
                  Rectangle
                  {
                      width: mainWindow.width*0.75
                      height: mainWindow.height/8
                      color: "#d9eaee"
                      border.width: 2
                      radius: 15
                      anchors.horizontalCenter: parent.horizontalCenter

                      Text {

                          anchors.verticalCenter: parent.verticalCenter
                          anchors.right: parent.right
                          anchors.rightMargin: parent.width/5
                          textFormat: Text.PlainText
                          text: qsTr("Consulta\nricette")
                          horizontalAlignment: Text.AlignHCenter
                          verticalAlignment: Text.AlignVCenter
                      }
                      Image
                      {
                          visible: true
                          opacity: 0.8
                          anchors.verticalCenter: parent.verticalCenter
                          anchors.left: parent.left
                          anchors.leftMargin: parent.width/5
                          width: parent.height*0.8
                          fillMode: Image.PreserveAspectFit
                          asynchronous: true
                          source: "images/consulta_fig.png"
                      }
                      MouseArea {
                          anchors.fill: parent
                          onPressed:
                          {
                              rect_waiting.visible = true
                              loading_image.visible = true;
                          }
                          onReleased:
                          {
                              stackView.push(Qt.resolvedUrl("tools/tool_ricette.qml"));
                              rect_waiting.visible = false
                          }
                      }
                 }

                 Rectangle {
                         width: mainWindow.width*0.75
                         height: mainWindow.height/8
                         color: "#f1b48b"
                         border.width: 2
                         radius: 15
                         anchors.horizontalCenter: parent.horizontalCenter

                         Text {
                             anchors.verticalCenter: parent.verticalCenter
                             anchors.left: parent.left
                             anchors.leftMargin: parent.width/5
                             textFormat: Text.PlainText
                             text: "Aggiungi\nricetta"
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                         }
                         Image
                         {
                             visible: true
                             opacity: 0.8
                             anchors.verticalCenter: parent.verticalCenter
                             anchors.right: parent.right
                             anchors.rightMargin: parent.width/5
                             width: parent.height*0.6
                             fillMode: Image.PreserveAspectFit
                             asynchronous: true
                             source: "images/plus.png"
                         }
                         MouseArea {
                             anchors.fill: parent
                             onPressed:
                             {
                                 rect_waiting.visible = true
                                 loading_image.visible = true;
                             }
                             onReleased:
                             {
                                 stackView.push(Qt.resolvedUrl("contribuisci.qml"));
                                 rect_waiting.visible = false
                             }
                         }
                 }

                 Rectangle {
                      width: mainWindow.width*0.75  //*0.35
                      height: mainWindow.height/8
                      color: "#EEE8AA"
                      border.width: 2
                      radius: 15
                      anchors.horizontalCenter: parent.horizontalCenter

                      Text {

                          anchors.verticalCenter: parent.verticalCenter
                          anchors.right: parent.right
                          anchors.rightMargin: parent.width/5
                          textFormat: Text.PlainText
                          text: qsTr("Importa\nMenù")
                          horizontalAlignment: Text.AlignHCenter
                          verticalAlignment: Text.AlignVCenter
                      }
                      Image
                      {
                          opacity: 0.8
                          anchors.verticalCenter: parent.verticalCenter
                          anchors.left: parent.left
                          anchors.leftMargin: parent.width/5
                          width: parent.height*0.65
                          fillMode: Image.PreserveAspectFit
                          asynchronous: true
                          source: "images/importa.png"
                      }

                      MouseArea {
                          anchors.fill: parent
                          onClicked: {
                               CalcMenu.setSalvaImporta("importa");
                               stackView.push(Qt.resolvedUrl("salvataggio.qml"));
                               rect_options.visible = false
                          }
                      }
                 }
              }// end column
            }//home button component


             //bottom buttons
             Row{
                 id: row_menu_buttons
                 visible: true
                 spacing: 1
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.bottom: parent.bottom

                 Rectangle {
                     color: top_bar.color
                     width: mainWindow.width/4
                     height: mainWindow.height*0.065

                     Image{
                        source: "images/fruit.png"
                        fillMode: Image.PreserveAspectFit
                        height: parent.height*0.8
                        anchors.centerIn: parent
                        asynchronous: true

                     }
                     MouseArea{
                        anchors.fill:parent
                        onClicked:
                        {
                            rect_options.visible = false
                            stackView.push(Qt.resolvedUrl("tools/tool_frutta_stagione.qml"));
                        }
                     }
                 }
                 Rectangle {
                     color: top_bar.color
                     width: mainWindow.width/4
                     height: mainWindow.height*0.065
                     Image{
                          source: "images/verdura.png"
                          fillMode: Image.PreserveAspectFit
                          height: parent.height*0.8
                          anchors.centerIn: parent
                          asynchronous: true
                      }
                      MouseArea{
                          anchors.fill:parent
                          onClicked:
                          {
                              stackView.push(Qt.resolvedUrl("tools/tool_verdura_stagione.qml"));
                              rect_options.visible = false
                          }
                      }
                  }


                 Rectangle {
                     id: rect_info
                     color: top_bar.color
                     width: mainWindow.width/2
                     height: mainWindow.height*0.065
                     Text {
                         color: mainWindow.color
                         anchors.fill: parent
                         text: qsTr("Curiosità")
                         horizontalAlignment: Text.AlignHCenter
                         verticalAlignment: Text.AlignVCenter
                     }

                     MouseArea{
                         id: info_button_area
                         anchors.fill: parent
                         onClicked:
                         {
                             if (rect_options.visible === false)
                             {
                                   rect_options.visible = true
                             }
                             else  rect_options.visible = false
                         }
                     }
                 }
                 Component.onCompleted: console.log("completed bottom menù buttons")
             }

             Rectangle {
                 id: rect_options
                 color: top_bar.color
                 visible: false
                 width: mainWindow.width/2
                 height: mainWindow.height*0.065*4
                 anchors.bottom: parent.bottom
                 anchors.bottomMargin: mainWindow.height*0.065*3 + 1
                 anchors.right: parent.right

                 MouseArea{
                     id: info_mouse_area
                     anchors.fill: parent
                 }

                 Column
                 {
                     spacing: 0
                     anchors.centerIn: parent
                     anchors.fill: parent

                     Rectangle
                     {
                         color: top_bar.color
                         width: mainWindow.width/2
                         height: mainWindow.height*0.065

                         Text {
                             color: (cons_m1.containsMouse) ? "black" : mainWindow.color
                             anchors.fill: parent
                             text: qsTr("Manuale d'uso")
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                         }
                         MouseArea {
                             id: cons_m1
                             hoverEnabled: true
                              anchors.fill: parent
                              onClicked:
                              {
                                  rect_options.visible = false
                                  stackView.push(Qt.resolvedUrl("infos/manuale.qml"));
                              }
                         }
                     }

                     Rectangle
                     {
                         color: top_bar.color
                         width: mainWindow.width/2
                         height: mainWindow.height*0.065
                         Text {
                             color: (cons_m2.containsMouse) ? "black" : mainWindow.color
                             anchors.fill: parent
                             text: qsTr("Menù sani")
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                         }
                         MouseArea {
                             id: cons_m2
                             hoverEnabled: true
                              anchors.fill: parent
                              onClicked:
                              {
                                  rect_options.visible = false
                                  stackView.push(Qt.resolvedUrl("infos/infos.qml"))
                              }
                         }
                     }

                     Rectangle
                     {
                         color: top_bar.color
                         width: mainWindow.width/2
                         height: mainWindow.height*0.065
                         Text {
                             color: (cons_m3.containsMouse) ? "black" : mainWindow.color
                             anchors.fill: parent
                             text: qsTr("Junk food")
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                         }
                         MouseArea {
                             id: cons_m3
                             hoverEnabled: true
                              anchors.fill: parent
                              onClicked:
                              {
                                  rect_options.visible = false
                                  stackView.push(Qt.resolvedUrl("tools/tool_junk_food.qml"));
                              }
                         }
                     }

                     Rectangle
                     {
                         color: top_bar.color
                         width: mainWindow.width/2
                         height: mainWindow.height*0.065
                         Text {
                             color: (cons_m4.containsMouse) ? "black" : mainWindow.color
                             anchors.fill: parent
                             text: qsTr("Spesa critica")
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                         }
                         MouseArea {
                             id: cons_m4
                             hoverEnabled: true
                              anchors.fill: parent
                              onClicked:
                              {
                                  rect_options.visible = false
                                  stackView.push(Qt.resolvedUrl("infos/spesa_critica.qml"))
                              }
                         }
                     }

                     Rectangle
                     {
                         color: top_bar.color
                         width: mainWindow.width/2
                         height: mainWindow.height*0.065
                         Text {
                             color: (cons_m5.containsMouse) ? "black" : mainWindow.color
                             anchors.fill: parent
                             text: qsTr("Consigli dall'OMS")
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                         }
                         MouseArea {
                              id: cons_m5
                              hoverEnabled: true
                              anchors.fill: parent
                              onClicked:
                              {
                                  rect_options.visible = false
                                  stackView.push(Qt.resolvedUrl("tools/tool_cecc.qml"));
                              }
                         }
                     }

                     Rectangle
                     {
                         color: top_bar.color
                         width: mainWindow.width/2
                         height: mainWindow.height*0.065
                         Text {
                             color: (cons_m6.containsMouse) ? "black" : mainWindow.color
                             anchors.fill: parent
                             text: qsTr("Body Mass Index")
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                         }
                         MouseArea {
                              id: cons_m6
                              hoverEnabled: true
                              anchors.fill: parent
                              onClicked:
                              {
                                  rect_options.visible = false
                                  stackView.push(Qt.resolvedUrl("tools/tool_bmi.qml"));
                              }
                         }
                     }
                 }
             }


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
             Component.onDestruction: {rect_waiting.visible = false}
        }//end item
      }// end stackView
    }//end mainWindow.qml





