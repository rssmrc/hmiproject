function testVisible(){
    if(sliderSwitch.checked == true)
        testSlider.visible = true
    else
        testSlider.visible = false
}

function updateTime(){
    currentTime.text = Qt.formatDateTime(new Date(), "HH:mm:ss a")
}

function checkBounds(){
    if(testSlider.value > rSlider.first.value && testSlider.value < rSlider.second.value){
        return false
    }
    else{
        return true
    }
}

function drawerOpen(){
    drawer.open();
}


