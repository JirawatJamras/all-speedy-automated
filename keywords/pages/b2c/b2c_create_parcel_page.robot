*** Keywords ***
Verify Create Parcel Page
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=30s
    ${title_text}=    Get Text    ${title_create_parcel_page_txt}
    Should Be Equal    ${title_text}    ${AllSpeedy_B2C_005_ID_1['title_text']}
    Click Element    ${close_noti_btn}
    Verify Close Pop-Up
    Click Element    ${close_noticonfirm_btn}

Clcik Choose Favorites
    Wait Until Element Is Visible    ${choose_favorites_btn}    timeout=30s
    Click Element    ${choose_favorites_btn}
    Wait Until Element Is Visible    ${favorites_defult_text}    timeout=30s
    ${title_text}=    Get Text    ${favorites_defult_text}
    Should Be Equal    ${title_text}    ${AllSpeedy_B2C_005_ID_18['fav_defult']}


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