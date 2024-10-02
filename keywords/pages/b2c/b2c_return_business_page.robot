*** Keywords ***
Click Add Booking Button
    Click When Ready    ${b2c_btn_add_booking}

Verify Term And Condition
    Wait Until Element Is Visible    ${b2c_txt_header_term_and_condition}    timeout=10s
    ${text}    Get Text    ${b2c_txt_header_term_and_condition}
    ${header1}    Split String And Select    ${text}    ${SPACE}    0
    ${header2}    Split String And Select    ${text}    ${SPACE}    1
    Element Should Be Visible    ${b2c_txt_header_term_and_condition}    ${header1}
    Element Should Be Visible    ${b2c_txt_header_term_and_condition}    ${header2}
    Element Should Be Visible    ${b2c_btn_close_term_and_condition} 
    Element Should Be Visible    ${b2c_btn_accept_condition}

Click Close Term And Condition Button
    Click When Ready    ${b2c_btn_close_term_and_condition}

Verify Close Term And Condition Pop Up
    Element Should Not Be Visible    ${b2c_popup_term_and_condition}

Click Accept Condition Button
    Click When Ready    ${b2c_btn_accept_condition}

Verify Link Return Business
    Wait Until Element Is Visible    ${b2c_txt_link_return_business}
    Element Should Be Visible    ${b2c_txt_link_return_business}