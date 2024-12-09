**** Keywords ***
Select Business Customers Tab
    ${select_tab}=    Replace String    ${register_tab_business_customer}    {value}    ${Register['text_menu_business']}
    FOR    ${i}    IN RANGE    0    5
        Wait Until Element Is Visible     ${select_tab}    timeout=${DEFAULT_TIMEOUT}
        Wait Until Element Is Enabled    ${select_tab}     timeout=3s
        ${can_click}=    Run Keyword And Return Status    Click Element    ${select_tab}
        Exit For Loop If    ${can_click} == True
    END

Select General Customers Tab
    ${select_tab}=    Replace String    ${register_tab_business_customer}    {value}    ${Register['text_menu_general']}
    common.Click when ready     ${select_tab}
