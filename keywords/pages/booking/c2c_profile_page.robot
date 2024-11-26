*** Keywords ***
Verify Login Customer Success
    Wait Until Element Is Visible    ${c2c_lbl_profile_login_page}    timeout=${DEFAULT_TIMEOUT}
    Page Should Contain    ${AllSpeedy_C2C_001_ID_5['username']}    