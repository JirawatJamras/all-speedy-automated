*** Keywords ***
Verify Login Customer Success
    Wait Until Element Is Visible    ${c2c_lbl_profile_login_page}    timeout=10s
    Page Should Contain    ${AllSpeedy_C2C_001_ID_5['username']}    