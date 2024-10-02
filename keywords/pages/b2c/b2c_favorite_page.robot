*** Keywords ***
Select Sender Tab
    Click When Ready    ${b2c_tab_sender_favorite_page}

Select Receiver Tab
    Click When Ready    ${b2c_tab_receiver_favorite_page}

Click Add Button [Sender]
    Click When Ready    ${b2c_btn_add_sender_favorite_page}

Click Add Button [Receiver]
    Click When Ready    ${b2c_btn_add_receiver_favorite_page}

Click Save Button
    Click When Ready    ${b2c_btn_save_info_favorite_page}

Click Cancel Button
    Click When Ready    ${b2c_btn_cancel_favorite_page}

Click Close X Button
    Click When Ready    ${b2c_btn_close_x_favorite_page}

Click Cancel To Close Add Favorite Sender Popup
    Click When Ready    ${b2c_btn_cancel_close_x_favorite_page}

Click Confirm To Close Add Favorite Sender Popup
    Click When Ready    ${b2c_btn_confirm_close_x_favorite_page}

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
    ${locator}=  Replace String   ${b2c_cbo_sender_address_favorite_page}   {value}   ${value}
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

Verify Data Dropdown list Postcode Displayed
    [Arguments]    ${expect}
    common.Verify text of element    ${b2c_cbo_sender_address_favorite_page}    ${expect}

Verify No Data Input Sender Postcode In Field
    ${value}=    Get value    ${b2c_txtbox_sender_postcode_favorite_page}
    Log To console    ${value}
    Should Be Empty    ${value}

Verify Not Display Unsaved Senders In Favorite Page
    [Arguments]    ${expect}
    ${sender_address}=    Set Variable    ${expect['sender_address']} ${expect['sender_address_full']}
    FOR    ${index}    IN RANGE    1    6
        ${item}=    Set Variable    (${b2c_card_sender_favorite_page})[${index}]
        ${favorite_name_status}=    Run Keyword And Return Status    Element Should not Contain    ${item}${b2c_txt_favorite_name_card_favorite_page}    ${expect['favorite_name']}
        ${sender_name_status}=    Run Keyword And Return Status    Element Should not Contain    ${item}${b2c_txt_sender_name_card_favorite_page}    ${expect['sender_name']}
        ${sender_phone_status}=    Run Keyword And Return Status    Element Should not Contain    ${item}${b2c_txt_sender_phone_card_favorite_page}    ${expect['sender_phone']}
        ${sender_address_status}=    Run Keyword And Return Status    Element Should not Contain    ${item}${b2c_txt_sender_address_favorite_page}    ${sender_address}
        Exit For Loop If    not ${favorite_name_status} and not ${sender_name_status} and not ${sender_phone_status} and not ${sender_address_status}
    END

Verify Display Sender Card In Favorite Page
    [Arguments]    ${expect}
    Wait Until Element Is Visible    ${b2c_card_sender_favorite_page}
    ${card_count}=    Get Element Count    ${b2c_card_sender_favorite_page}
    ${sender_address}=    Set Variable    ${expect['sender_address']} ${expect['sender_address_full']}
    FOR    ${index}    IN RANGE    1    ${card_count} + 1
        ${item}=    Set Variable    (${b2c_card_sender_favorite_page})[${index}]
        ${favorite_name_status}=    Run Keyword And Return Status    Element Should Contain    ${item}${b2c_txt_favorite_name_card_favorite_page}    ${expect['favorite_name']}
        ${sender_name_status}=    Run Keyword And Return Status    Element Should Contain    ${item}${b2c_txt_sender_name_card_favorite_page}    ${expect['sender_name']}
        ${sender_phone_status}=    Run Keyword And Return Status    Element Should Contain    ${item}${b2c_txt_sender_phone_card_favorite_page}    ${expect['sender_phone']}
        ${sender_address_status}=    Run Keyword And Return Status    Element Should Contain    ${item}${b2c_txt_sender_address_favorite_page}    ${sender_address}
        Exit For Loop If    ${favorite_name_status} and ${sender_name_status} and ${sender_phone_status} and ${sender_address_status}
    END

Verify Display Notification Popup Confirm To Close
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

Verify Display Popup Receiver Information
    Wait Until Element Is Visible    ${b2c_popup_receiver_favorite_page}    ${DEFAULT_TIMEOUT}

Verify Display Add Favorite Sender Popup And Recent Data
    [Arguments]    ${data}
    Wait Until Element Is Visible    ${b2c_popup_sender_favorite_page}    ${DEFAULT_TIMEOUT}
    ${favorite_name}=    Get Value    ${b2c_txtbox_favorite_name_favorite_page}
    Should Be Equal    ${favorite_name}    ${data['favorite_name']}
    ${sebder_phone}    Get Value    ${b2c_txtbox_sender_phone_favorite_page}
    Should Be Equal    ${sebder_phone}    ${data['sender_phone']}
    ${sender_name}=    Get Value    ${b2c_txtbox_sender_name_favorite_page}
    Should Be Equal    ${sender_name}    ${data['sender_name']}
    ${sender_address}=    Get Value    ${b2c_txtbox_sender_address_favorite_page}
    Should Be Equal    ${sender_address}    ${data['sender_address']}
    ${sender_address_full}=    Get Text    ${b2c_txt_sender_postcode_full_favorite_page}
    Should Be Equal    ${sender_address_full}    ${data['sender_address_full']}

 
