# Add more folders to ship with the application, here
#folder_01.source = qml/CambusaCritica
#folder_01.target = qml
#DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
#QML_IMPORT_PATH =
TEMPLATE = app

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
        my_printer_new.cpp \
        write_file.cpp

QT+= gui quick qml printsupport widgets

ICON += icon.ico
RC_FILE = myapp.rc

CONFIG += static staticlib

OTHER_FILES += \
    qml/mainWindow.qml \
    qml/Widgets/HomeButton.qml \
    qml/Widgets/BackButton.qml \
    qml/daysel.qml \
    qml/recipesel.qml \
    qml/personalizza.qml \
    qml/mymenu.qml \
    qml/main.qml \
    qml/visualizeListaSpesona.qml \
    qml/models/Snacks.qml \
    qml/models/Breakfast.qml \
    qml/models/FullMeal.qml \
    qml/models/Primo.qml \
    qml/models/Secondo.qml \
    qml/models/Contorni.qml \
    qml/functions/CalcMenu.js \
    qml/functions/CalcList.js \
    qml/Widgets/MenuButton.qml \
    qml/valutazione.qml \
    android/AndroidManifest.xml \
    qml/models/Frutta.qml \
    qml/models/Pane.qml \
    qml/infos/infos.qml \
    qml/infos/manuale.qml \
    qml/infos/spesa_critica.qml \
    qml/settings/AliasSettings.qml \
    qml/settings/EvaluateCriteria.qml \
    qml/settings/MenuSettings.qml \
    qml/settings/SpesaSettings.qml \
    qml/contribuisci.qml
    qml/crea_menu/dettagli.qml


ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

RESOURCES +=     menu_creattivi.qrc

DISTFILES += \
    qml/salvataggio.qml \
    qml/conferma_salva.qml \
    qml/tools/tool_frutta_stagione.qml \
    qml/tools/tool_verdura_stagione.qml \
    qml/tools/tool_junk_food.qml \
    qml/tools/tool_cc_food.qml \
    qml/visualizeSpesaGiorno.qml \
    qml/Widgets/ImportaButton.qml \
    qml/tools/tool_wcrf.qml \
    qml/Widgets/CreaButton.qml \
    qml/functions/printerFunctions.js \
    qml/loadFileLoader.qml \
    qml/loadSendMail \
    qml/loadSendMail.qml \
    qml/loadCreateHTML.qml \
    qml/tools/tool_ricette.qml \
    qml/models/Pane.qml \
    qml/recipes_list.qml \
    qml/crea_menu/dettagli.qml \
    qml/models/Ingredienti.qml \
    qml/crea_menu/crea_numeri.qml \
    qml/crea_menu/crea_giorni.qml \
    qml/crea_menu/crea_branca.qml \
    qml/functions/PrintStuff.js \
    qml/tools/tool_cecc.qml \
    qml/tools/tool_bmi.qml \
    qml/functions/CalcFunction.js \
    qml/crea_menu/crea_struttura.qml

HEADERS += \
    my_printer_new.h \
    write_file.h
