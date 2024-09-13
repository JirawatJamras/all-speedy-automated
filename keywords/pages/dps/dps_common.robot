*** Keywords ***
Select DPS Menu
    [Arguments]    ${tabname}
    Wait Until Element Is Not Visible    ${dps_btn_log_on}    30s
    Wait Until Element Is Visible    //a[@href='/${tabname}']
    Mouse Over    //a[@href='/${tabname}']
    Wait Until Element Is Visible    //a[@href='/${tabname}']
    Click Element    //a[@href='/${tabname}']
    Mouse Out    //a[@href='/${tabname}']