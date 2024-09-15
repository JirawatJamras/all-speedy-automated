*** Keywords ***
Verify Login Customer Success
    Wait Until Element Is Visible    ${c2c_lbl_profile}
    Page Should Contain    ${c2c_login_user_02['name']}