*** Keywords ***
Verify Full Register Status
    [Arguments]    ${status}
    ${actual_txt_status}=    Get Text    ${pms_txt_status}
    Should Be Equal    ${actual_txt_status}    ${status}