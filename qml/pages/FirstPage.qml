import QtQuick 2.0
import Sailfish.Silica 1.0
import "lancamento.js" as Lancamento

Page {
    id: page

    allowedOrientations: Orientation.All


    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        contentHeight: column.height

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Oblique")
            }

            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }

            Grid {
                columns: 2
                spacing: 2
                x: Theme.horizontalPageMargin
                transformOrigin: Item.Center


                Label { text: "Angle"; }
                TextField {
                    id: angulo;
                    width:  225
                    height: 120
                    inputMethodHints: Qt.ImhFormattedNumbersOnly

                    placeholderText: "degrees"
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: velocidade.focus = true
                }

                Label {text: "Initial Speed";}
                TextField {
                    id: velocidade
                    width:  225
                    height: 120
                    inputMethodHints: Qt.ImhFormattedNumbersOnly

                    placeholderText: "m/s"
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: aceleracao.focus = true
                }

                Label {text: "Gravity";}
                TextField {
                    id: aceleracao
                    width:  225
                    height: 120
                    inputMethodHints: Qt.ImhFormattedNumbersOnly

                    placeholderText: "m/s²"
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: altura.focus = true
                }

                Label { text: "Height"; }
                TextField {
                    id: altura;
                    width:  225
                    height: 120
                    inputMethodHints: Qt.ImhFormattedNumbersOnly

                    placeholderText: "m"
                    EnterKey.iconSource: "image://theme/icon-m-enter-close"
                    EnterKey.onClicked: focus = false
                }

                Button {
                    text: "Calculate"
                    onClicked: {
                        var v = velocidade.text * 1.0;
                        var a = Lancamento.toRadian(angulo.text * 1.0);
                        var g = aceleracao.text * 1.0;
                        var h = altura.text * 1.0;

                        var alcance  = Lancamento.calcAlcanceMaximo(v, a, g, h)
                        var altitude = Lancamento.calcAltitudeMaxima(v, a, g, h);
                        var tempoVoo = Lancamento.calcTempoVoo(v, a, g, h);
                        var compHztl = Lancamento.calcComponenteHorizontal(v, a);
                        var compVtcl = Lancamento.calcComponenteVertical(v, a);

                        output.text  = qsTr("Maximum range: %1 meters.").arg(alcance.toLocaleString(Qt.locale()));
                        output.text += qsTr("\nMaximum heigth: %1 meters.").arg(altitude.toLocaleString(Qt.locale()));
                        output.text += qsTr("\nFlight time: %1 seconds.").arg(tempoVoo.toLocaleString(Qt.locale()));
                        output.text += qsTr("\n\nComponents of initial velocity:");
                        output.text += qsTr("\nHorizontal component: %1 m/s.").arg(compHztl.toLocaleString(Qt.locale()));
                        output.text += qsTr("\nVertical component: %1 m/s.").arg(compVtcl.toLocaleString(Qt.locale()));
                    }

                    enabled: velocidade.text != "" && angulo.text != "" && aceleracao.text != "" && altura.text != ""
                }
                Button {
                    text: "Clear"
                    anchors.leftMargin : 5
                    onClicked: {
                        velocidade.text = "";
                        angulo.text = "";
                        aceleracao.text = "";
                        altura.text = "";
                        output.text = "Report:"
                    }
                }

            }

            TextArea {
                id: output
                readOnly: true
                width: parent.width
                height: 400
                color: "orange"
                text: "Report:"
            }
        }
    }
}


