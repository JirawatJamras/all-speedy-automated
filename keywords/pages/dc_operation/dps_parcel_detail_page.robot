*** Keywords ***
Click Print Label
    ${dps_btn_print_label_parcel_detail_page}=    Replace String    ${dps_btn_print_label_parcel_detail_page}    {value}    ${dc_operation['text_print_label']}
    common.Scroll Into View By Xpath    ${dps_btn_print_label_parcel_detail_page}    true
    common.Click When Ready    ${dps_btn_print_label_parcel_detail_page}
    Sleep    5s

Click ESC On Keyboard
    Switch Window    NEW
    Press Keys    None    ESC
    Switch Window    MAIN

Click Space On Keyboard
    Switch Window    NEW
    Press Keys    None    SPACE
    Switch Window    MAIN

Click Close Print Label Success Popup
    common.Click When Ready    ${dps_btn_close_on_print_label_success_popup}
    
Verify Print Label Success Popup
    [Arguments]    ${expected_text}
    Wait Until Element Is Visible    ${dps_txt_print_label_success_in_popup}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text}=    Get Text    ${dps_txt_print_label_success_in_popup}
    Should Be Equal    ${actual_text}    ${expected_text}