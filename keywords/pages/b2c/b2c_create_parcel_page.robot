*** Keywords ***
Verify Create Parcel Page
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=30s
    ${title_text}=    Get Text    ${title_create_parcel_page_txt}
    Should Be Equal    ${title_text}    ${AllSpeedy_B2C_005_ID_1['title_text']}
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