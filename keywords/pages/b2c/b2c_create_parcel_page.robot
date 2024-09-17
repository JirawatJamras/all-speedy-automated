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