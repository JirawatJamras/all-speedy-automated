*** Keywords ***
Click Print Label
    ${dps_print_label_parcel_detail_page}=    Replace String    ${dps_print_label_parcel_detail_page}    {value}    ${dc_operation['text_print_label']}
    common.Scroll Into View By Xpath    ${dps_print_label_parcel_detail_page}    true
    common.Click When Ready    ${dps_print_label_parcel_detail_page}

Click ESC On Keyboard
    Press Key    xpath=//body    ESC