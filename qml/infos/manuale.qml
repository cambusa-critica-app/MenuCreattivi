import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.3
import Qt.labs.settings 1.0
import QtQuick.Window 2.0
import "../images"



//***********************************************************************//
//                             manuale
//***********************************************************************//
Item {

    id: rect_info
    //height: mainWindow.height*0.95
    ProgressBar {

        id: manuale_progress
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.verticalCenter: mainWindow.top
        //anchors.verticalCenterOffset: manuale_progress.width*2
        width: mainWindow.width
        //anchors.verticalCenter: parent.bottom
        //anchors.verticalCenterOffset: -width
        value: (stack_manual.depth -1 )/5

        style: ProgressBarStyle {
                background: Rectangle {
                    //radius: 5
                    color: "#eee7ad"
                    border.color: "gray"
                    border.width: 1
                    implicitWidth: 200
                    implicitHeight: 24
                }
                progress: Rectangle {
                    //radius: 5
                    //color: "#f3c26c"
                    color: "#eee5d0"
                    border.color: "#b44646"
                }
            }

    }


    StackView{
        id: stack_manual
        initialItem: manual_intro

        focus: true
        Keys.onReleased: if (event.key === Qt.Key_Back && stack_manual.depth > 1) {
                             stack_manual.pop();
                             event.accepted = true;
                             }

        height: mainWindow.height*0.7
        width: mainWindow.width*0.9

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: manuale_progress.bottom
        anchors.topMargin: manuale_progress.height/2

        //anchors.verticalCenter: parent.verticalCenter

    }


    Column {
        id: manual_intro
        visible: (stack_manual.currentItem === manual_intro) ? true : false

        Text {

            width: stack_manual.width
            horizontalAlignment: Text.AlignJustify
            wrapMode: Text.Wrap
            text: "Questa app vuole aiutarti a realizzare un menù salutare e che segua i principi di un consumo equo e solidale.\n\n" +
                   "Acquistare prodotti per la nostra alimentazione non è un atto banale e innocuo. \n\n" +
                   "Esso può avere un fortissimo impatto su problemi di portata planetaria, di natura sociale, sanitaria, politica ed ambientale.\n\n"+
                   "Un menù sano ed etico è quindi una sfida per tutti: genitori, educatori e ragazzi.\n\n"
        }
       // Text{text: "Ringraziamenti" ;font.bold: true}
    }

    Column {
        id: manual_1
        visible: (stack_manual.currentItem === manual_1) ? true : false

        Text{text: "Fabbisogno di kilocalorie giornaliero\n"; font.bold: true; width: parent.width/3}
        Text {
            width: stack_manual.width
            horizontalAlignment: Text.AlignJustify
            wrapMode: Text.Wrap
            text: "- Bambini 8-12 anni: 2300 (m) - 2100 (f)\n"+
                  "- Adolescenti 14-18 anni: 3100 (m) - 2500 \n"+
                  "- Adulti 19-59 anni: 2900 (m) - 2500 (f)\n"+
                  "- Anziani >60 anni: 2350 (m) - 2050 (f)\n\n"
        }

        Text{
            width: stack_manual.width
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignJustify
            text: "Le porzioni prendono spunto dalle indicazioni LARN dei consumi medi di calorie per fascia d'età. I valori indicati sono valori medi che devono essere adattati a seconda del peso della persona. Per maggiori dettagli seguire il link qui sotto.\n"
            font.italic: true
        }

        Text {
            id: link_Text
            text: '<html><style type="text/css"></style><a href="http://www.sinu.it/html/pag/larn-2014.asp">Tabelle LARN</a></html>'
            onLinkActivated: Qt.openUrlExternally(link)
        }
    }


    Column {
        id: manual_2
        visible: (stack_manual.currentItem === manual_2) ? true : false

        Text{text: "Numeri, genere e date\n"; font.bold: true; width: parent.width/3}
        Text {
            width: stack_manual.width
            horizontalAlignment: Text.AlignJustify
            wrapMode: Text.Wrap
            text: "Indica il numero e il genere delle persone per cui vuoi cucinare per metterci di calcolare le dosi adeguate. \n\nScegli anche per quanti giorni vuoi creare il menù: ci permetterà di selezionare ricette per ogni giorno e la lista della spesa necessaria.\n\nIl numero di persone potrà essere cambiato in seguito. \n\n"
        }
    }

    Column {
        id: manual_3

        visible: (stack_manual.currentItem === manual_3) ? true : false
        Text{text: "Tipo di attività\n"; font.bold: true; width: parent.width/3}

        Text {
            width: stack_manual.width
            horizontalAlignment: Text.AlignJustify
            wrapMode: Text.Wrap
            text: "Il consumo calorico giornaliero varia anche in funziona dell'attività sportiva che viene svolta.\n\nPer chi pratica attività sportiva più di 4 volte a settimana selezionare attività 'sportiva'. Per chi pratica meno di due attività fisiche alla settimana selezionare attività 'sedentaria'. Altrimenti selezionare attività 'mista'.\n"
        }

        Text{text: "Struttura generale del menù\n"; font.bold: true; width: parent.width/3}
        Text {
            width: stack_manual.width
            horizontalAlignment: Text.AlignJustify
            wrapMode: Text.Wrap
            text: "Scegli quali pasti utilizzare nel tuo menù (se vuoi la merenda, la frutta, il pane, etc...). \n\nPotrà essere cambiato in seguito e personalizzato di giorno in giorno. \n\n"
        }

    }

    Column {
        id: manual_4

        visible: (stack_manual.currentItem === manual_4) ? true : false
        Text{
            font.bold: true; width: stack_manual.width;
            horizontalAlignment: Text.AlignJustify;
            wrapMode: Text.Wrap
            text: "Frutta e verdura di stagione\n";
        }

        Text {
            width: stack_manual.width
            horizontalAlignment: Text.AlignJustify
            wrapMode: Text.Wrap
            text: "In base alle date che hai scelto per il tuo menù puoi richiedere di utilizzare solo frutta e verdura di stagione.\n"
        }
        Text{
            width: stack_manual.width
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignJustify
            text: "Il fresco di stagione costa meno ed è più buono. Tuttavia le ricette disponibili diminuiranno, soprattutto durante i periodi invernali.\n"
            font.italic: true
        }
        Text{
            font.bold: true; width: stack_manual.width;
            horizontalAlignment: Text.AlignJustify;
            wrapMode: Text.Wrap
            text: "Pane integrale\n";
        }

        Text {
            width: stack_manual.width
            horizontalAlignment: Text.AlignJustify
            wrapMode: Text.Wrap
            text: "Il pane integrale è ricco di fibre che abbassano l'indice glicemico e migliorano il transito intestinale.\n"
        }
        Text{
            font.bold: true; width: stack_manual.width;
            horizontalAlignment: Text.AlignJustify;
            wrapMode: Text.Wrap
            text: "Merenda\n";
        }

        Text {
            width: stack_manual.width
            horizontalAlignment: Text.AlignJustify
            wrapMode: Text.Wrap
            text: "La merenda può essere aggiunta per equilibrare l'apporto calorico giornaliero se ritenuto necessario.\n"
        }
    }

    Column {
        id: manual_5

        visible: (stack_manual.currentItem === manual_5) ? true : false
        Text{text: "Sei pronto!\n"; font.bold: true; width: parent.width/3}

        Text {
            width: stack_manual.width
            horizontalAlignment: Text.AlignJustify
            wrapMode: Text.Wrap
            text:  "Torna alla home page e comincia la creazione del tuo menù cliccando su 'Crea Menù'!\n\n"+
                   "Segui le istruzioni e guarda la nostra proposta.\n\n"+
                   "Clicca sul giorno che ti interessa per visualizzare le ricette e aggiusta il menù per meglio soddisfare le tue esigenze e i tuoi gusti.\n\n"+
                   "Quando il tuo menù sarà pronto, potrai inviarlo via mail insieme alla lista della spesa e/o salvarlo tra i preferiti assegnandogli un nome."
        }
    }

    Item{

        width: parent.width*0.5
        height: mainWindow.height/16
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.verticalCenter: parent.bottom
        anchors.verticalCenterOffset: -height*0.6

        Image{
            source: "../images/back_button.png"
            width: mainWindow.width/7
            fillMode: Image.PreserveAspectFit
            visible: (stack_manual.currentItem === manual_intro) ? false : true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.leftMargin
            //anchors.horizontalCenterOffset: -width/2

            MouseArea{
                anchors.fill: parent
                onClicked:
                {
                    stack_manual.pop()
                 }
             }
         }

        Image{
            source: (stack_manual.currentItem !== manual_5) ? "../images/next_button.png" : "../images/cross.png"
            width: (stack_manual.currentItem !== manual_5) ? mainWindow.width/7 : mainWindow.width/12
            fillMode: Image.PreserveAspectFit
            //visible: (stack_manual.depth === 6) ? false : true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: parent.width*0.35
            //anchors.horizontalCenterOffset: -width/2

            MouseArea{
                anchors.fill: parent
                onClicked:
                {
                    if (stack_manual.currentItem === manual_intro) stack_manual.push(manual_1)
                    else if (stack_manual.currentItem === manual_1) stack_manual.push(manual_2)
                    else if (stack_manual.currentItem === manual_2) stack_manual.push(manual_3)
                    else if (stack_manual.currentItem === manual_3) stack_manual.push(manual_4)
                    else if (stack_manual.currentItem === manual_4) stack_manual.push(manual_5)
                    else if (stack_manual.currentItem === manual_5) {stack_manual.clear(); stackView.pop({immediate:true});}
                }
             }
         }
    }

}


