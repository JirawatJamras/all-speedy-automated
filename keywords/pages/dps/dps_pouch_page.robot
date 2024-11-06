*** Keywords ***
Proceed Pouch By Pouch Number
    [Arguments]    ${pouch_number}
    common.Click When Ready    //td[text()='${pouch_number}']/..//td[7]//img/..

Click Print Pouch Label
    common.Scroll Into View By Xpath    ${dps_btn_print_pouch_label_pouch_detail_page}    true
    common.Click When Ready    ${dps_btn_print_pouch_label_pouch_detail_page}
    Sleep    5s