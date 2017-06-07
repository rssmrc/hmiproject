function testVisible(){
    if(testSlider.visible == false)
        testSlider.visible = true
    else
        testSlider.visible = false
}

function updateTime(){
    currentTime.text = Qt.formatDateTime(new Date(), "HH:mm:ss a")
}

function checkBounds(){
    if(testSlider.value > rslider.first.value && testSlider.value < rslider.second.value){
        return false
    }
    else{
        return true
    }
}

function drawerOpen(){
    drawer.open();
}
