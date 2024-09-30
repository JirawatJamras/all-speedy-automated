*** Keywords ***
Verify Create Parcel Page
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=30s
    ${title_text}=    Get Text    ${title_create_parcel_page_txt}
    Should Be Equal    ${title_text}    ${AllSpeedy_B2C_005_ID_1['title_text']}
    ${step_name}=    Get Text    ${frist_step_name}
    Should Be Equal    ${step_name}    ${AllSpeedy_B2C_005_ID_1['frist_step']}
    Click Element    ${close_noti_btn}
    Verify Close Pop-Up
    Click Element    ${close_noticonfirm_btn}

Click Choose Favorites
    Wait Until Element Is Visible    ${choose_favorites_btn}    timeout=30s
    Click Element    ${choose_favorites_btn}
    Wait Until Element Is Visible    ${favorites_defult_text}    timeout=30s
    ${title_text}=    Get Text    ${favorites_defult_text}
    Should Be Equal    ${title_text}    ${AllSpeedy_B2C_005_ID_18['fav_defult']}

Click Favorites Defult
    Wait Until Element Is Visible    ${select_favorites_btn}    timeout=30s
    Click Element    ${select_favorites_btn}


Input Special Letters
    [Arguments]    ${search_txt}
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=10s
    Input Text    ${search_favorites_txtbox}    ${search_txt}

Clear Search Favorites TextBox
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=10s
    Click Element    ${search_favorites_txtbox}
    Clear Element Text    ${search_favorites_txtbox}

Input Text Exceeds 100 Characters
    [Arguments]    ${search_txt}
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=10s
    Clear Element Text    ${search_favorites_txtbox}
    Input Text    ${search_favorites_txtbox}    ${search_txt}

Verify Popup Favorites Sender 
    Wait Until Element Is Visible    ${favorites_accetp_btn}    timeout=30s
    ${title_text}=    Get Text    ${favorites_title_text}
    Should Be Equal    ${title_text}    ${B2C_003_ID_5['favorites_title_text']}
    ${default_text}=    Get Text    ${favorites_default_text}
    Should Be Equal    ${default_text}    ${B2C_003_ID_5['favorites_default_text']}

Input Favorites TextBox Nomal Letters Less Than 100 Characters
    [Arguments]    ${search_txt}
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=10s
    Input Text    ${search_favorites_txtbox}    ${search_txt}

Verify Favorites Text In TextBox
    [Arguments]    ${search_txt}
    ${text}=    Get Value    ${search_favorites_txtbox}
    Should Be Equal    ${text}    ${search_txt}   

Verify Favorites Show Item Lists   
    Page Should Not Contain     ${b2c_addbooking_003_ID_3.text_no_data}

Verify Favorites Not Show Item Lists   
    Page Should Contain     ${b2c_addbooking_003_ID_4.text_no_data}

Input Favorites TextBox Nomal Letters More Than 100 Characters
    [Arguments]    ${search_txt}
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=10s
    Input Text    ${search_favorites_txtbox}    ${search_txt}

Click Favorites Defult List
    Wait Until Element Is Visible    ${choose_default_favorites_btn}    timeout=30s
    Click Element    ${choose_default_favorites_btn}

Click Accept Favorites List
    Click Element    ${accept_favorites_btn}

Click Cancel Favorites List
    Click Element    ${cancel_favorites_btn}

Verify Choose From Favorites
    Wait Until Element Is Visible    ${choose_favorites_btn}    timeout=30s
    ${phone_text}=    Get Value    ${phone_sender_txtbox}
    Should Be Equal    ${phone_text}    ${b2c_addbooking_003_ID_5['verify_phone_sender']}    
    ${name_text}=    Get Value    ${name_sender_txtbox}
    Should Be Equal   ${name_text}    ${b2c_addbooking_003_ID_5['verify_name_sender']}
    ${address_text}=    Get Value    ${address_sender_txtbox}
    Should Be Equal    ${address_text}    ${b2c_addbooking_003_ID_5['verify_address_sender']}
    ${postcode_text}=    Get Text    ${postcode_sender_txtbox}
    Should Be Equal    ${postcode_text}    ${b2c_addbooking_003_ID_5['verify_postcode_sender']}