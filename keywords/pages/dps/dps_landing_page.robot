**** Keywords ***
Click Go Login Button
    Wait Until Element Is Visible    ${dps_btn_go_login}
    Click Xpath By JavaScript        ${dps_btn_go_login}
    