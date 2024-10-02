*** Keywords ***
Click Button To Add
    sleep    4s
    Wait Until Element Is Visible    ${b2c_btn_add}    timeout=30s
    Click Element        ${b2c_btn_add}

Verify Term & Condition 
    [Arguments]    ${text}    ${text_accept}
    Wait Until Element Is Visible    ${accept_termsservice_btn}    timeout=30s
    Page Should Contain    ${text}
    Verify Accept Terms of Service Button    ${text_accept}

Verify Accept Terms of Service Button
    [Arguments]    ${text_accept}
    Wait Until Element Is Visible    ${accept_termsservice_btn}    timeout=30s
    ${button_text}=    Get Text    ${accept_termsservice_btn}
    Should Be Equal    ${button_text}    ${text_accept}

Close Term & Condition Popup
    Wait Until Element Is Visible    ${close_condition_popup}    timeout=10s
    Click Element        ${close_condition_popup}

Click Accept Terms of Service
    Wait Until Element Is Visible    ${accept_termsservice_btn}    timeout=30s
    Click Element        ${accept_termsservice_btn}

Verify Select Parcel Type
    Wait Until Element Is Visible    ${parcel_type_dry_btn}    timeout=30s
    Element Should Be Visible    ${parcel_type_dry_btn}
    Element Should Be Visible    ${parcel_type_chill_btn}

Click General Parcel
    Wait Until Element Is Visible    ${parcel_type_dry_btn}   timeout=30s
    Click Element    ${parcel_type_dry_btn}
    Wait Until Element Is Visible    ${close_noti_btn}   timeout=30s

# Verify Close Pop-Up
#     Wait Until Element Is Visible    ${close_noti_txt}    timeout=30s
#     ${button_text}=    Get Text    ${close_noti_txt}
#     Should Be Equal    ${button_text}    ${AllSpeedy_B2C_005_ID_1['closepopun_noti']}

Click Temperature Controlled Parcel
    Wait Until Element Is Visible    ${parcel_type_chill_btn}   timeout=30s
    Click Element    ${parcel_type_chill_btn}