function testVisible(){
    if(testSlider.visible == false)
        testSlider.visible = true
    else
        testSlider.visible = false
}

function updateTime(){
    currentTime.text = Qt.formatDateTime(new Date(), "HH:mm:ss a")
}
