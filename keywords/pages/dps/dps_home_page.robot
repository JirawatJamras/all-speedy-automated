*** Keywords ***
Set Tomorrow Date
    ${today}=    Get Current Date    result_format=%Y-%m-%d
    ${tomorrow_day}=    Add Time To Date    ${today}    1 days    result_format=%d-%m-%Y
    ${day}    Split String And Select    ${tomorrow_day}    -    0
    ${month}    Split String And Select    ${tomorrow_day}    -    1
    ${year}    Split String And Select    ${tomorrow_day}    -    2
    ${year_be}    Evaluate    int(${year}) + 543
    ${tomorrow}    Set Variable    ${day}-${month}-${year_be}
    RETURN    ${tomorrow}

Set_ToDAY
    ${date_YYYY_MM_DD}   Get Current Date
    ${date_YYYY_MM_DD}   Convert Date  ${date_YYYY_MM_DD}       result_format=%d-%m-%Y
    ${d}    Split String And Select    ${date_YYYY_MM_DD}    -    0
    ${m}    Split String And Select    ${date_YYYY_MM_DD}    -    1
    ${y}    Split String And Select    ${date_YYYY_MM_DD}    -    2
    ${year}    Convert To Integer    ${y}
    ${year}    Evaluate    ${y} + 543
    ${Today}    Set Variable    ${d}-${m}-${year}
    RETURN    ${Today}

Select Check Receiving Cycle Menu
    ${tab_check_receiving_cycle}=  Replace String   ${dps_tab_dps_menu}   {value}   ${dc_operation.dps_menu['Check_Receiving_Cycle']}
    Wait Until Element Is Visible    ${tab_check_receiving_cycle}    timeout=30s
    Mouse Over    ${tab_check_receiving_cycle}
    Wait Until Element Is Visible    ${tab_check_receiving_cycle}
    Click Element    ${tab_check_receiving_cycle}
    Mouse Out    ${tab_check_receiving_cycle}
    FOR  ${i}  IN RANGE  0  5
        Reload Page
        ${isvisible}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dps_img_loading_screen_home_page}
        Capture Page Screenshot
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
    END
    Wait Until Element Is Not Visible    ${dps_img_loading_screen_home_page}    timeout=240s

Select Warehouse List Button
    [Arguments]    ${selected_warehouse}
    ${dps_btn_selected_warehouse_list}=    Replace String    ${dps_btn_selected_warehouse_list_home_page}    {value}    ${dc_operation.selected_warehouse_list['text_selected_warehouse_list']}
    common.Click When Ready    ${dps_btn_selected_warehouse_list}
    ${dps_cbo_selected_warehouse_list}=    Replace String    ${dps_cbo_selected_warehouse_list_home_page}    {warehouse}    ${selected_warehouse}
    ${dps_warehouse_list_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${dps_cbo_selected_warehouse_list}
    Run Keyword If    '${dps_warehouse_list_status}' == 'false'    Run Keywords    ${dps_cbo_warehouse_list}=    Replace String    ${dps_cbo_warehouse_list_home_page}    {warehouse}    ${selected_warehouse}
    ...    AND    common.Click When Ready    ${dps_cbo_warehouse_list}
    Run Keyword If    '${dps_warehouse_list_status}' == 'true'    Run Keywords    ${dps_txt_daily_task_overview}=    Replace String    ${dps_txt_daily_task_overview_home_page}    {value}    ${dc_operation.title['homepage']}
    ...    AND    Mouse Over    ${dps_txt_daily_task_overview}

Verify Homepage
    [Arguments]    ${breadcrumb}    ${head_title}
    ${dps_txt_breadcrumb}=    Replace String    ${dps_txt_breadcrumb_home_page}    {value}    ${dc_operation.breadcrumb['homepage']}
    ${dps_txt_daily_task_overview}=    Replace String    ${dps_txt_daily_task_overview_home_page}    {value}    ${dc_operation.title['homepage']}
    Wait Until Element Is Visible    ${dps_txt_breadcrumb}    timeout=${DEFAULT_TIMEOUT}
    ${actual_breadcrumb}=    Get Text    ${dps_txt_breadcrumb}
    Should Be Equal    ${actual_breadcrumb}    ${breadcrumb}
    Wait Until Element Is Visible    ${dps_txt_daily_task_overview}    timeout=${DEFAULT_TIMEOUT}
    ${actual_daily_task_overview}=    Get Text    ${dps_txt_daily_task_overview}
    Should Be Equal    ${actual_daily_task_overview}    ${head_title}

Verify Data In All Task Tab
    [Arguments]    ${parcel_status}    ${parcel_number}    ${pouch_number}    ${transport}    
    ...            ${export_to}    ${import_from}    ${parcel_owner}    ${task_type}
    ${dps_tab_all_task}=    Replace String    ${dps_tab_in_home_page}    {value}    ${dc_operation.tab_daily_task['all_task']}
    ${dps_txt_list_first_daily_task}=    Replace String    ${dps_txt_list_first_daily_task_home_page}    {parcel_status}    ${parcel_status}
    ${dps_txt_list_first_daily_task}=    Replace String    ${dps_txt_list_first_daily_task}    {parcel_number}    ${parcel_number}
    ${dps_txt_list_first_daily_task}=    Replace String    ${dps_txt_list_first_daily_task}    {pouch_number}    ${pouch_number}
    ${dps_txt_list_first_daily_task}=    Replace String    ${dps_txt_list_first_daily_task}    {transport}    ${transport}
    ${dps_txt_list_first_daily_task}=    Replace String    ${dps_txt_list_first_daily_task}    {export_to}    ${export_to}
    ${dps_txt_list_first_daily_task}=    Replace String    ${dps_txt_list_first_daily_task}    {import_from}    ${import_from}
    ${dps_txt_list_first_daily_task}=    Replace String    ${dps_txt_list_first_daily_task}    {parcel_owner}    ${parcel_owner}
    ${dps_txt_list_first_daily_task}=    Replace String    ${dps_txt_list_first_daily_task}    {task_type}    ${task_type}
    Scroll Element Into View    ${dps_txt_list_first_daily_task}
    ${actual_tab_all_task_status}=    Get Element Attribute    ${dps_tab_all_task}    aria-selected
    Should Be Equal    ${actual_tab_all_task_status}    true
    ${actual_list_first_daily_task}=    Get Text    ${dps_txt_list_first_daily_task}
    ${actual_list_first_daily_task}=    Replace String    ${actual_list_first_daily_task}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_list_first_daily_task}    ${task_type} ${parcel_owner} ${import_from} ${export_to} ${transport} ${pouch_number} ${parcel_number} ${parcel_status}

Click Dropdown For Select Role
    Wait Until Element Is Visible    ${dps_img_loading_screen_home_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${dps_img_loading_screen_home_page}    timeout=${DEFAULT_TIMEOUT}
    common.Click When Ready    ${dps_btn_dropdown_select_role}

Select Role
    [Arguments]    ${role}
    ${dps_btn_role}=  Replace String   ${dps_btn_role}   {value}   ${role}
    Wait Until Element Is Visible    ${dps_btn_role}    timeout=${DEFAULT_TIMEOUT}
    Click Element    ${dps_btn_role}

Select Tab In Home Page
    [Arguments]    ${tab}
    ${dps_tab_in_home_page}=    Replace String    ${dps_tab_in_home_page}    {value}    ${tab}
    common.Click When Ready    ${dps_tab_in_home_page}

Select Tab All Task
    Select Tab In Home Page    ${dc_operation.tab_daily_task['all_task']}

Select Tab Import Task
    Select Tab In Home Page    ${dc_operation.tab_daily_task['import_task']}

Select Tab Export Task
    Select Tab In Home Page    ${dc_operation.tab_daily_task['export_task']}

Select Tab Send Task
    Select Tab In Home Page    ${dc_operation.tab_daily_task['send_task']}

Select Tab Expedited Delivery Parcel
    Select Tab In Home Page    ${dc_operation.tab_daily_task['expedited_delivery_parcel']}

Select Tab Hold Parcel
    Select Tab In Home Page    ${dc_operation.tab_daily_task['hold_parcel']}

Select Tab SLA Parcel
    Select Tab In Home Page    ${dc_operation.tab_daily_task['sla_parcel']}
    
Verify Data In Import Task Tab
    [Arguments]    ${number_of_scanned_items}    ${number_of_pieces}    ${number_of_pouch}   
    ...            ${parcel_owner}    ${transport}    ${import_from}
    ${dps_tab_all_task}=    Replace String    ${dps_tab_in_home_page}    {value}    ${dc_operation.tab_daily_task['import_task']}
    ${dps_txt_list_first_import_task}=    Replace String    ${dps_txt_list_first_import_task_home_page}    {number_of_scanned_items}    ${number_of_scanned_items}
    ${dps_txt_list_first_import_task}=    Replace String    ${dps_txt_list_first_import_task}    {number_of_pieces}    ${number_of_pieces}
    ${dps_txt_list_first_import_task}=    Replace String    ${dps_txt_list_first_import_task}    {number_of_pouch}    ${number_of_pouch}
    ${dps_txt_list_first_import_task}=    Replace String    ${dps_txt_list_first_import_task}    {parcel_owner}    ${parcel_owner}
    ${dps_txt_list_first_import_task}=    Replace String    ${dps_txt_list_first_import_task}    {transport}    ${transport}
    ${dps_txt_list_first_import_task}=    Replace String    ${dps_txt_list_first_import_task}    {import_from}    ${import_from}
    ${actual_tab_import_task_status}=    Get Element Attribute    ${dps_tab_all_task}    aria-selected
    Should Be Equal    ${actual_tab_import_task_status}    true
    ${actual_list_first_import_task}=    Get Text    ${dps_txt_list_first_import_task}
    Should Be Equal    ${actual_list_first_import_task}    ${import_from} ${transport} ${parcel_owner} ${number_of_pouch} ${number_of_pieces} ${number_of_scanned_items}
