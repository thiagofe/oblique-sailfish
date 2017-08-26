import QtQuick 2.0
import Sailfish.Silica 1.0
//import Sailfish.theme 1.0 ///// O módulo "theme" não está instalado

Page {
    id: page

    //allowedOrientations: ObliqueScreenOrientation


     Item {
        id: aboutInfos
        property string version:'0.5'
        property string text: if(orientation === Orientation.Portrait) {
                                  '<style>a:link { color: ' + Theme.primaryColor  + '; }</style>' +
                                  'Oblique calculates range, height and<br>flight time of a projectile.' +
                                  '<br><br>This version of Oblique was written<br>using Qt5 and Qt Quick 2 (Silica Components).' +
                                  '<br><br>© 2016-2017 by Thiago Ferreira Santos<br>Advisor: Roberto Colistete Jr.' +
                                  '<br><br>Software developed in<br>Scientific Initiation Project at the<br><a href="http://www.ufes.br/"><b>Federal University of Espirito Santo.</b></a><br>' +
                                  '<br>Free & Open Source :'+
                                  '<br><a href="http://www.gnu.org/licenses/lgpl-3.0.html"><b>License LGPLv3</b></a>' +
                                  '<br><br>For more information see:' +
                                  '<br><a href="https://github.com/thiagofe/oblique-sailfish"><b>github.com/thiagofe/oblique-sailfish</b></a>' +
                                  '<br><br><FONT COLOR="white"></FONT>'
                               } else {
                                  '<style>a:link { color: ' + Theme.primaryColor  + '; }</style>' +
                                  'Oblique calculates range, height and<br>flight time of a projectile.' +
                                  '<br><br>This version of Oblique was written<br>using Qt5 and Qt Quick 2 (Silica Components).' +
                                  '<br><br>© 2016-2017 by Thiago Ferreira Santos<br>Advisor: Roberto Colistete Jr.' +
                                  '<br><br>Software developed in<br>Scientific Initiation Project at the<br><a href="http://www.ufes.br/"><b>Federal University of Espirito Santo.</b></a><br>' +
                                  '<br>Free & Open Source :'+
                                  '<br><a href="http://www.gnu.org/licenses/lgpl-3.0.html"><b>License LGPLv3</b></a>' +
                                  '<br><br>For more information see:' +
                                  '<br><a href="https://github.com/thiagofe/oblique-sailfish"><b>github.com/thiagofe/oblique-sailfish</b></a>' +
                                  '<br><br><FONT COLOR="white"></FONT>'
                              }
    }


    SilicaFlickable {
        id: aboutFlick
        anchors.fill: parent
        contentHeight: contentItem.childrenRect.height
        contentWidth: aboutFlick.width

        VerticalScrollDecorator { flickable: aboutFlick }

        Column {
            id: aboutColumn
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingMedium
            }
            spacing: Theme.paddingMedium

            PageHeader {
                title: 'About Oblique'
            }
            Label {
                id:title
                text: 'Oblique  v' + aboutInfos.version
                font.pixelSize: Theme.fontSizeLarge
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label {
                id: slogan
                text: 'for Sailfish OS'
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Item {
                width: 1
                height: Theme.paddingMedium
            }
            Label {
                id: content
                text: aboutInfos.text
                width: aboutFlick.width
                // wrapMode: TextEdit.WordWrap
                horizontalAlignment: Text.AlignHCenter;
                font.pixelSize: Theme.fontSizeSmall
                textFormat: Text.RichText
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingMedium
                }
                onLinkActivated: {
                    Qt.openUrlExternally(link)
                }
            }
        }
    }
}
