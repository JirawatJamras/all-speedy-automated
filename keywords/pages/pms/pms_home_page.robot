*** Keywords ***
Select role
    [Arguments]    ${role}
    Wait Until Element Is Visible    ${pms_img_icon_user}    timeout=${DEFAULT_TIMEOUT}
    common.Click When Ready    ${pms_cbo_select_role}
    ${btn_role}=  Replace String   ${pms_btn_role}   {value}   ${role}
    common.Click When Ready    ${btn_role}

Select Sub Menu in Manage Customer Data Menu
    [Arguments]    ${menu}
    ${tab_name}=  Replace String   ${pms_tab_title}   {value}   ${rm.pms_menu['manage_customer_data']}
    ${sub_menu}=  Replace String   ${pms_tab_name}   {value}   ${menu}
    Wait Until Element Is Visible    ${pms_tab_manage_customer}    timeout=${DEFAULT_TIMEOUT}
    Mouse Over    ${pms_tab_manage_customer}
    common.Click When Ready    ${tab_name}
    Wait Until Element Is Visible    ${sub_menu}    timeout=${DEFAULT_TIMEOUT}
    common.Click When Ready    ${sub_menu}
