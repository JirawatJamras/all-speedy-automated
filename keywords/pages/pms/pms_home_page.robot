*** Keywords ***
Select Role Admin
    Wait Until Element Is Visible    ${pms_img_icon_user}    timeout=${DEFAULT_TIMEOUT}
    common.Click When Ready    ${pms_cbo_select_role}
    ${btn_role}=  Replace String   ${pms_btn_role}   {value}   ${rm.role['admin']}
    common.Click When Ready    ${btn_role}

Select Manage Customer Menu
    Select PMS Menu    ${rm['text_manage_customer_information']}

Select Manage Request Sub-Menu
    Select PMS Sub-Menu    ${rm['text_mange_request']}

Select Customer Information Sub-Menu
    Select PMS Sub-Menu    ${rm['text_customer_information']}

Select PMS Menu
    [Arguments]    ${menu}
    ${menu}=  Replace String   ${pms_mnu_title}   {value}   ${menu}
    Wait Until Page Contains Element    ${menu}
    Mouse Over    ${menu}
    common.Click When Ready    ${menu}

Select PMS Sub-Menu
    [Arguments]    ${subMenu}
    ${pms_sub_mnu}=    Replace String    ${pms_sub_mnu}    {value}    ${subMenu}
    common.Click When Ready    ${pms_sub_mnu}