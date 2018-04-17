import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle{
    width: parent.width
    height: 54*dp
    color: "#ffffff"
    Rectangle{
        id:border__
        anchors.top: parent.top
        width: parent.width
        height: 0.5*dp
        color: borderColor
    }

    Rectangle{
        id: musicInfoImage
        color: "#123456"
        anchors{
            top:border__.bottom
            topMargin: 1*dp
            left: parent.left
            //leftMargin: 1*dp
            bottom: parent.bottom
            //bottomMargin: 1*dp
        }
        width: height
    }
    MusicRoundButton{
        id:stepBackward
        anchors{
            left: musicInfoImage.right
            leftMargin: 20*dp
            verticalCenter: parent.verticalCenter
        }
        width: 35*dp
        text:"\uf048"
    }
    MusicRoundButton{
        id:playBtn
        anchors{
            left: stepBackward.right
            leftMargin: 10*dp
            verticalCenter: parent.verticalCenter
        }
        width: 40*dp
        text:"\uf04b"
        secondText:"\uf04c"
    }
    MusicRoundButton{
        id:stepForward
        anchors{
            left: playBtn.right
            leftMargin: 10*dp
            verticalCenter: parent.verticalCenter
        }
        width: 35*dp
        text:"\uf051"
    }


    PlaySlider{
        anchors{
            left: stepForward.right
            leftMargin: 10*dp
            right: collectBtn.left
            rightMargin: 10*dp
            top:parent.top
            topMargin: 1*dp
            bottom: parent.bottom
            bottomMargin: 1*dp
        }
    }


    //收藏
    MusicControlBtn{
        id:collectBtn
        property bool isLove: false;
        anchors{
            right: playModeBtn.left
            leftMargin: 10*dp
            top:parent.top
            topMargin: 5*dp
            bottom:parent.bottom
            bottomMargin: 5*dp
        }
        width: height
        text:"\uf004"
        fontfamily:isLove?icomoonFont.name: regularIcomoonFont.name
        color: isLove?"#DC2F2E":"#999999"
        MouseArea{
            anchors.fill: parent
            onClicked:{
                collectBtn.isLove = !collectBtn.isLove;
            }
        }
    }


    //播放模式
    MusicControlBtn{
        id:playModeBtn
        property int playMode:0;
        anchors{
            right: volumeBtn.left
            leftMargin: 10*dp
            top:parent.top
            topMargin: 5*dp
            bottom:parent.bottom
            bottomMargin: 5*dp
        }
        width: height
        text:playMode==0?"\uf2f9":(playMode==1?"\uf074":"\uf03a")
        MouseArea{
            anchors.fill: parent
            onClicked:{
                playModeBtn.playMode = (playModeBtn.playMode+1)%3;
            }
        }
    }

    //音量
    MusicControlBtn{
        id:volumeBtn
        property int volumeValue:80;
        property string volumeoff:"\uf026";
        property string volumedown:"\uf027";
        property string volumeup:"\uf028";
        anchors{
            right: currentListBtn.left
            leftMargin: 10*dp
            top:parent.top
            topMargin: 5*dp
            bottom:parent.bottom
            bottomMargin: 5*dp
        }
        width: height
        text: ((volumeBtn.volumeValue == 0) ?volumeoff:(volumeBtn.volumeValue<50?volumedown:volumeup))
        MouseArea{
            anchors.fill: parent
            onClicked:{
                console.log("2")
            }
        }
    }

    //当前列表
    MusicControlBtn{
        id:currentListBtn
        anchors{
            right: parent.right
            rightMargin: 40*dp
            top:parent.top
            topMargin: 5*dp
            bottom:parent.bottom
            bottomMargin: 5*dp
        }
        width: height
        text:"\uf03c"
        MouseArea{
            anchors.fill: parent
            onClicked:{
                console.log("1")
            }
        }
    }

}