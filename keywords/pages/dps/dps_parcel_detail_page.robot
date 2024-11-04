*** Keywords ***
Click Print Label
    ${dps_btn_print_label_parcel_detail_page}=    Replace String    ${dps_btn_print_label_parcel_detail_page}    {value}    ${dc_operation['text_print_label']}
    common.Scroll Into View By Xpath    ${dps_btn_print_label_parcel_detail_page}    true
    common.Click When Ready    ${dps_btn_print_label_parcel_detail_page}

Click ESC On Keyboard
    Press Key    xpath=//body    ESC

Click Close Print Label Success Popup
    common.Click When Ready    ${dps_btn_close_on_print_label_success_popup}

Verify Print Label Success Popup
    [Arguments]    ${expected_text}
    ${actual_text}=    Get Text    ${dps_txt_print_label_success_in_popup}
    Should Be Equal    ${actual_text}    ${expected_text}