**** Keywords ****
Click Go Login DPS Button
    Wait Until Element Is Visible    ${dps_btn_go_login}
    Click Xpath By JavaScript        ${dps_btn_go_login}

Click Go Login B2C Button
    Wait Until Element Is Visible    ${b2c_btn_go_login}
    Click Element                    ${b2c_btn_go_login}