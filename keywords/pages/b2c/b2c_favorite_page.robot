*** Keywords ***
Select Sender Tab
    Click When Ready    ${b2c_tab_sender_favorite_page}

Click Add Button
    Click When Ready    ${b2c_btn_add_favorite_page}

Click Save Button
    Click When Ready    ${b2c_btn_save_info_favorite_page}

Click Cancel Button
    Click When Ready    ${b2c_btn_cancel_favorite_page}

Click Close X Button
    Click When Ready    ${b2c_btn_close_x_favorite_page}

Input Favorite Name
    [Arguments]    ${value}
    Input When Ready    ${b2c_txtbox_favorite_name_favorite_page}    ${value}

Clear Input Favorite Name
    Click When Ready    ${b2c_btn_clear_sender_phone_favorite_page}

Input Sender Phone Number
    [Arguments]    ${value}
    Input When Ready    ${b2c_txtbox_sender_phone_favorite_page}    ${value}

Clear Input Sender Phone Number
    Click When Ready    ${b2c_btn_clear_sender_phone_favorite_page}

Input Sender Name
    [Arguments]    ${value}
    Input When Ready    ${b2c_txtbox_sender_name_favorite_page}    ${value}

Clear Input Sender Name
    Click When Ready    ${b2c_btn_clear_sender_name_favorite_page}

Input Sender Address
    [Arguments]    ${value}
    Input When Ready    ${b2c_txtbox_sender_address_favorite_page}    ${value}

Clear Input Sender Address
    Click When Ready    ${b2c_btn_clear_sender_address_favorite_page}
    
Input Sender Postcode
    [Arguments]    ${value}
    Clear Element Text    ${b2c_txtbox_sender_postcode_favorite_page}
    Input When Ready    ${b2c_txtbox_sender_postcode_favorite_page}    ${value}

Clear Input Sender Postcode
    Clear Element Text    ${b2c_txtbox_sender_postcode_favorite_page}

Not Select Sender Postcode
    Click Element    ${b2c_popup_sender_favorite_page}

Select Sender Postcode
    [Arguments]    ${value}
    ${locator}=  Replace String   ${b2c_list_sender_address_favorite_page}   {value}   ${value}
    Click When Ready       ${locator}

Click Toggle Use as default
    Click When Ready    ${b2c_btn_toggle_default_favorite_page}

Verify Display Popup Sender Information
    Wait Until Element Is Visible    ${b2c_popup_sender_favorite_page}    ${DEFAULT_TIMEOUT}

Verify Input Favorite Name In Field
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_txtbox_favorite_name_favorite_page}
    ${value}=    Get value    ${b2c_txtbox_favorite_name_favorite_page}
    Should Be Equal    ${expect}    ${value}

Verify Input Sender Phone Number In Field
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_txtbox_sender_phone_favorite_page}
    ${value}=    Get value    ${b2c_txtbox_sender_phone_favorite_page}
    Should Be Equal    ${expect}    ${value}

Verify Input Sender Name In Field
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_txtbox_sender_name_favorite_page}
    ${value}=    Get value    ${b2c_txtbox_sender_name_favorite_page}
    Should Be Equal    ${expect}    ${value}

Verify Input Sender Address In Field
    [Arguments]    ${expect}
    ${value}=    Get value    ${b2c_txtbox_sender_address_favorite_page}
    Should Be Equal    ${expect}    ${value}

Verify Input Sender Postcode In Field
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_txtbox_sender_postcode_favorite_page}
    ${text}=    Get Value    ${b2c_txtbox_sender_postcode_favorite_page}
    Should Be Equal    ${expect}    ${text}

Verify Input Sender Postcode Full In Field
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_txt_sender_postcode_full_favorite_page}
    ${text}=    Get Text    ${b2c_txt_sender_postcode_full_favorite_page}
    Should Be Equal    ${expect}    ${text}

Verify Error Message When Input Favorite Name Wrong Format  
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_favorite_name_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_favorite_name_favorite_page}    ${expect}

Verify Error Message When Not Input Favorite Name
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_favorite_name_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_favorite_name_favorite_page}    ${expect}

Verify Error Message When Not Input Sender Phone
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_sender_phone_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_sender_phone_favorite_page}    ${expect}

Verify Error Message When Not Input Sender Name
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_sender_name_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_sender_name_favorite_page}    ${expect}

Verify Error Message When Not Input Sender Address
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_sender_address_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_sender_address_favorite_page}    ${expect}

Verify Error Message When Not Input Sender Postcode
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_sender_postcode_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_sender_postcode_favorite_page}    ${expect}

Verify Error Message When Input Sender Phone Wrong Format
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_sender_phone_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_sender_phone_favorite_page}    ${expect}

Verify Error Message When Input Sender Name Wrong Format
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_sender_name_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_sender_name_favorite_page}    ${expect}

Verify Error Message When Input Sender Address Wrong Format
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_sender_address_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_sender_address_favorite_page}    ${expect}

Verify Error Message When Input Sender Postcode Wrong Format
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_sender_postcode_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_sender_postcode_favorite_page}    ${expect}

Verify Data Dropdown List Postcode Displayed
    [Arguments]    ${expect}
    common.Verify text of element    ${b2c_list_sender_address_favorite_page}    ${expect}

Verify No Data Input Sender Postcode In Field
    ${value}=    Get value    ${b2c_txtbox_sender_postcode_favorite_page}
    Log To console    ${value}
    Should Be Empty    ${value}

Verify Not Display Unsaved Senders In Favorite Page
    [Arguments]    ${expect}
    ${locator}=  Replace String   ${b2c_txt_sender_name_card_favorite_page}   {value}   ${expect}
    Page Should Not Contain Element    ${locator}

Verify User Confirm To close Add Favorite Sender Popup
    Wait Until Element Is Visible    ${b2c_txt_close_popup_favorite_page}
    Page Should Contain Button    ${b2c_btn_cancel_close_x_favorite_page}
    Page Should Contain Button    ${b2c_btn_confirm_close_x_favorite_page}

Verify Toggle Use As Default Is Open
    ${checked}=    Get Element Attribute    ${b2c_btn_toggle_default_favorite_page}    aria-checked
    Should Be Equal As Strings    ${checked}    true

Verify Toggle Use As Default Is Close
    ${checked}=    Get Element Attribute    ${b2c_btn_toggle_default_favorite_page}    aria-checked
    Should Be Equal As Strings    ${checked}    false

Verify Error Message When Input Favorite Name Special Char
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_favorite_name_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_favorite_name_favorite_page}    ${expect}

Verify Can Not Input Favorite Name More Than Specified
    [Arguments]    ${specified}
    Wait Until Element Is Visible    ${b2c_txtbox_favorite_name_favorite_page}
    ${length} =    Get Value    ${b2c_txtbox_favorite_name_favorite_page}
    Length Should Be    ${length}    ${specified}