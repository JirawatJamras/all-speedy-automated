**** Keywords ***
Select Business Customers Tab
    ${select_tab}=    Replace String    ${register_tab_business_customer}    {value}    ${Register['text_menu_business']}
    Wait Until Element Is Enabled    ${select_tab}     timeout=3s
    common.Click when ready     ${select_tab}

Select General Customers Tab
    ${select_tab}=    Replace String    ${register_tab_business_customer}    {value}    ${Register['text_menu_general']}
    common.Click when ready     ${select_tab}
