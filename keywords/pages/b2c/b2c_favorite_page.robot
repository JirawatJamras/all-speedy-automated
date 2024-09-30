*** Keywords ***
Select Tab Sender
    Click When Ready    ${b2c_tab_sender_favorite_page}

Click Add Button
    Click When Ready    ${b2c_btn_add_favorite_page}

Input Favorite Name
    [Arguments]    ${value}
    Input When Ready    ${b2c_txtbox_favorite_name_favorite_page}    ${value}

Input Phone Number
    [Arguments]    ${value}
    Input When Ready    ${b2c_txtbox_sender_phone_favorite_page}    ${value}

Not Input Favorite Name
    Input When Ready    ${b2c_txtbox_favorite_name_favorite_page}    ${NONE}
    Click When Ready    ${b2c_btn_clear_favorite_name_favorite_page}

Clear Input Favorite Name
    Click When Ready    ${b2c_btn_clear_sender_phone_favorite_page}

Clear Input Phone Number
    Click When Ready    
    
Click Toggle Use as default
    Click When Ready    ${b2c_btn_toggle_default_favorite_page}

Verify Display Popup Sender Information
    Wait Until Element Is Visible    ${b2c_popup_sender_favorite_page}    ${DEFAULT_TIMEOUT}

Verify Input Favorite Name In Field
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_txtbox_favorite_name_favorite_page}
    ${value}=    Get value    ${b2c_txtbox_favorite_name_favorite_page}
    Should Be Equal    ${expect}    ${value}

Verify Input Phone Number In Field
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_txtbox_sender_phone_favorite_page}
    ${value}=    Get value    ${b2c_txtbox_sender_phone_favorite_page}
    Should Be Equal    ${expect}    ${value}

Verify Error Message When Input Favorite Name Special Char
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_favorite_name_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_favorite_name_favorite_page}    ${expect}

Verify Can Not Input Favorite Name More Than Specified
    [Arguments]    ${specified}
    Wait Until Element Is Visible    ${b2c_txtbox_favorite_name_favorite_page}
    ${length} =    Get Value    ${b2c_txtbox_favorite_name_favorite_page}
    Length Should Be    ${length}    ${specified}

Verify Error Message When Input Favorite Name Wrong Format  
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_favorite_name_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_favorite_name_favorite_page}    ${expect}

Verify Error Message When Not Input Favorite Name
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_favorite_name_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_favorite_name_favorite_page}    ${expect}

Verify Error Message When Input Phone Number Wrong Format
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_msg_errormsg_sender_phone_favorite_page}
    Element Should Contain    ${b2c_msg_errormsg_sender_phone_favorite_page}    ${expect}

Verify Toggle Use As Default Is Open
    ${checked}=    Get Element Attribute    ${b2c_btn_toggle_default_favorite_page}    aria-checked
    Should Be Equal As Strings    ${checked}    true

Verify Toggle Use As Default Is Close
    ${checked}=    Get Element Attribute    ${b2c_btn_toggle_default_favorite_page}    aria-checked
    Should Be Equal As Strings    ${checked}    false