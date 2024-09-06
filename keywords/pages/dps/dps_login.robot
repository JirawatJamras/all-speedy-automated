*** Keywords ***
Input Email
    [Arguments]                      ${value}
    Wait Until Element Is Visible    ${dps_txtbox_username}
    Input Text                       ${dps_txtbox_username}    ${value}

Input Password
    [Arguments]                      ${value}
    Wait Until Element Is Visible    ${dps_txtbox_password}
    Input Text                       ${dps_txtbox_password}    ${value}

Click Log On Button
    Wait Until Element Is Visible    ${dps_btn_log_on}
    Click Element                    ${dps_btn_log_on}


Verify Error Message
    [Arguments]    ${expected_error}
    Wait Until Element Is Visible    ${dps_error_message}    timeout=10s
    Element Should Contain    ${dps_error_message}    ${expected_error}

Verify Menu Displayed
    [Arguments]    ${menu_item}
    Wait Until Element Is Visible    ${dps_txthome}    timeout=10s
    Element Should Be Visible    ${dps_txthome}    ${menu_item}
 
Verify Capture Screenshot
    [Arguments]     ${name_cap}
    ${date_YYYY_MM_DD}   Get Current Date
    ${date_YYYY_MM_DD}   Convert Date  ${date_YYYY_MM_DD}       result_format=%Y-%m-%d
    Capture Page Screenshot     ../result/${FOlDER_RESULT}/${name_cap}_${date_YYYY_MM_DD}.png