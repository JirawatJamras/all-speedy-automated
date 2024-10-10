*** Keywords ***
Click Profile Icon
    Wait Until Element Is Visible    ${profile_icon_btn}
    Click Element    ${profile_icon_btn}

Click Profile Business
    Wait Until Element Is Visible    ${profile_business_btn}
    Click Element    ${profile_business_btn}   

Click Menu Manage Users
    Wait Until Element Is Visible    ${manage_users_tab} 
    Click Element    ${manage_users_tab}  

Click Menu Super User
    Wait Until Element Is Visible    ${super_user_tab}
    Click Element    ${super_user_tab}

Click Menu User
    Wait Until Element Is Visible    ${user_tab}
    Click Element    ${user_tab}

Click Add User
    Wait Until Element Is Visible    ${add_user_btn}
    Click Element    ${add_user_btn}    

Input User Name
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_name_txtbox}
    Input Text    ${user_name_txtbox}    ${Value}

Input User Last Name
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_last_name_txtbox}
    Input Text    ${user_last_name_txtbox}    ${Value}

Input User Email
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_email_txtbox}
    Input Text    ${user_email_txtbox}    ${Value}

Input User Mobile No
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_mobile_no_txtbox}
    Input Text    ${user_mobile_no_txtbox}    ${Value}

Input User Mobile Ext
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_mobile_ext_txtbox}
    Input Text    ${user_mobile_ext_txtbox}    ${Value}

Input User Position
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_position_txtbox}
    Input Text    ${user_position_txtbox}    ${Value}

Click Menu Manage Branches 
    Wait Until Element Is Visible    ${manage_branch_tab}
    Click Element    ${manage_branch_tab}

Click Checkbox User
    [Arguments]    ${Value}
    Wait Until Element Is Visible    //input[@usernamebranch='${Value}']//..
    Click Element    //input[@usernamebranch='${Value}']//..

Click Menu Tracking Request List
    Wait Until Element Is Visible    ${tracking_request_tab}
    Click Element    ${tracking_request_tab}

Click Add Request
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${add_request_btn}
    Click Element    ${add_request_btn}
    Wait Until Element Is Visible    //li[@class='ant-dropdown-menu-item ant-dropdown-menu-item-only-child']//a[text()='${Value}']
    Click Element    //li[@class='ant-dropdown-menu-item ant-dropdown-menu-item-only-child']//a[text()='${Value}']

Click Menu Service Information
    Wait Until Element Is Visible    ${service_information_tab}
    Click Element    ${service_information_tab}

Click Menu General Parcel
    Wait Until Element Is Visible    ${general_parcel_tab}
    Click Element    ${general_parcel_tab}

Click Menu Temperature Controlled Parcels
    Wait Until Element Is Visible    ${temperature_controlled_parcel_tab}
    Click Element    ${temperature_controlled_parcel_tab}

Click Menu Return Business
    Wait Until Element Is Visible    ${return_business_tab}
    Click Element    ${return_business_tab}

Click Menu Contact and Bank Information
    Wait Until Element Is Visible    ${contact_and_bank_information_tab}
    Click Element    ${contact_and_bank_information_tab}
Click Menu Supporting Documents
    Wait Until Element Is Visible    ${supporting_documents_tab}
    Click Element    ${supporting_documents_tab}

Click Menu Invoice
    Wait Until Element Is Visible    ${invoice_tab}
    Click Element    ${invoice_tab}
