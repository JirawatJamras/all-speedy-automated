**** Keywords ***
Select Business Customers Tab
    ${Select_Tab}=    Replace String    ${register_tab_business_customer}    {value}    ${Register['text_menu_business']}
    Wait Until Element Is Enabled    ${Select_Tab}     timeout=3s
    common.Click when ready     ${Select_Tab} 

Select General Customers Tab
    ${Select_Tab}=    Replace String    ${register_tab_business_customer}    {value}    ${Register['text_menu_general']}
    common.Click when ready     ${Select_Tab} 

#Old
# Select Business Customers Tab
#     common.Click when ready    ${register_btn_business_customers_tab_general_customers_page}
    
# Select General Customers Tab
#     common.Click when ready    ${register_btn_general_custmers_tab_general_customers_page}

Verify This Site Can Not Be Reached Page
    [Arguments]    ${boolean}
    Should Be Equal    ${boolean}    ${FALSE}
    Wait Until Element Is Visible    ${register_txt_can_not_be_reached_page}    ${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${register_btn_business_customers_tab_general_customers_page}    ${DEFAULT_TIMEOUT}

Verify General Customers Tab Page
    [Arguments]    ${testcase}
    Capture Page Screenshot
    ### TBC