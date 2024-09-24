**** Keywords ***
Click Go business Tab
    Wait Until Element Is Visible    ${register_btn_business_tab}
    Click Element        ${register_btn_business_tab}

Verify This Site Can Not Be Reached Page
    [Arguments]    ${boolean}
    Should Be Equal    ${boolean}    ${FALSE}
    Wait Until Element Is Visible    ${register_txt_can_not_be_reached_page}
    Wait Until Element Is Not Visible    ${register_btn_business_tab}    timeout=3s