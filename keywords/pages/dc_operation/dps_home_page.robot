*** Keywords ***
Set Cut Off Time
    [Arguments]    ${uri}    ${name}    ${collection}    ${query}
    ${time}=    Get Current Date    result_format=%H:%M
    Set Suite Variable    ${cut_off_time}    ${time}
    connect_to_mongodb    ${uri}    ${name}    ${collection}
    ${QUERY}    Create Dictionary    status=${query}
    ${update}    Create Dictionary    cutOff=${time}
    ${update_with_set}    Create Dictionary    $set=${update}
    update_document    ${QUERY}    ${update}
    disconnect

Reset Cut Off Time
    connect_to_mongodb    ${DB_URI}    ${DATABASE_NAME}    ${COLLECTION}
    ${QUERY}    Create Dictionary    status=${QUERY}
    ${update}    Create Dictionary    cutOff=23:59
    ${update_with_set}    Create Dictionary    $set=${update}
    update_document    ${QUERY}    ${update}
    disconnect

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

# Select Warehouse List Button
#     [Arguments]    ${selected_warehouse}
#     ${dps_btn_selected_warehouse_list}=    Replace String    ${dps_btn_selected_warehouse_list_home_page}    {value}    ${dc_operation.selected_warehouse_list['text_selected_warehouse_list']}
#     common.Click When Ready    ${dps_btn_selected_warehouse_list}
#     ${dps_cbo_selected_warehouse_list}=    Replace String    ${dps_cbo_selected_warehouse_list_home_page}    {warehouse}    ${selected_warehouse}
#     ${dps_warehouse_list_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${dps_cbo_selected_warehouse_list}
#     Run Keyword If    '${dps_warehouse_list_status}' == 'false'    Run Keywords    ${dps_cbo_warehouse_list}=    Replace String    ${dps_cbo_warehouse_list_home_page}    {warehouse}    ${selected_warehouse}
#     ...    AND    common.Click When Ready    ${dps_cbo_warehouse_list}
#     Run Keyword If    '${dps_warehouse_list_status}' == 'true'    Run Keywords    ${dps_txt_daily_task_overview}=    Replace String    ${dps_txt_daily_task_overview_home_page}    {value}    ${dc_operation.title['homepage']}
#     ...    AND    Mouse Over    ${dps_txt_daily_task_overview}

Select Warehouse List Button
    [Arguments]    ${selected_warehouse}
    ${dps_btn_selected_warehouse_list_1}=    Replace String    ${dps_btn_selected_warehouse_list_home_page}    {value}    ${dc_operation.selected_warehouse_list['text_selected_warehouse_list']}
    common.Click When Ready    ${dps_btn_selected_warehouse_list_1}
    ${dps_cbo_selected_warehouse_list_no_select}=    Replace String    ${dps_cbo_warehouse_list_home_page}    {warehouse}    ${dc_operation.selected_warehouse_list['text_warehouse_no_select']}
    common.Click When Ready    ${dps_cbo_selected_warehouse_list_no_select}
    ${dps_btn_selected_warehouse_list_2}=    Replace String    ${dps_btn_selected_warehouse_list_home_page}    {value}    ${dc_operation.selected_warehouse_list['text_please_select_warehouse']}
    common.Click When Ready    ${dps_btn_selected_warehouse_list_2}
    ${dps_cbo_selected_warehouse_list}=    Replace String    ${dps_cbo_warehouse_list_home_page}    {warehouse}    ${selected_warehouse}
    common.Click When Ready    ${dps_cbo_selected_warehouse_list}

Verify Homepage
    [Arguments]    ${breadcrumb}    ${head_title}
    ${dps_txt_breadcrumb}=    Replace String    ${dps_txt_breadcrumb_home_page}    {value}    ${dc_operation.breadcrumb['homepage']}
    ${dps_txt_daily_task_overview}=    Replace String    ${dps_txt_daily_task_overview_home_page}    {value}    ${dc_operation.title['homepage']}
    Wait Until Element Is Visible    ${dps_txt_breadcrumb}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_breadcrumb}=    Get Text    ${dps_txt_breadcrumb}
    Should Be Equal    ${actual_txt_breadcrumb}    ${breadcrumb}
    Wait Until Element Is Visible    ${dps_txt_daily_task_overview}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_daily_task_overview}=    Get Text    ${dps_txt_daily_task_overview}
    Should Be Equal    ${actual_txt_daily_task_overview}    ${head_title}

Verify Label In All Task Tab
    [Arguments]    ${task_type}    ${parcel_owner}   ${import_from}    ${export_to}    
    ...            ${transport}    ${pouch_number}    ${parcel_number}    ${parcel_size}    ${parcel_status}
    ${dps_txt_task_type_in_all_task_tab}=    Replace String    ${dps_txt_task_type_title_table_in_all_task_tab_home_page}    {title}    ${task_type}
    ${dps_txt_parcel_owner_in_all_task_tab}=    Replace String    ${dps_txt_title_table_in_all_task_tab_home_page}    {title_task_type}    ${task_type}
    ${dps_txt_parcel_owner_in_all_task_tab}=    Replace String    ${dps_txt_parcel_owner_in_all_task_tab}    {main_title}    ${parcel_owner}
    ${dps_txt_import_from_in_all_task_tab}=    Replace String    ${dps_txt_title_table_in_all_task_tab_home_page}    {title_task_type}    ${task_type}
    ${dps_txt_import_from_in_all_task_tab}=    Replace String    ${dps_txt_import_from_in_all_task_tab}    {main_title}    ${import_from}
    ${dps_txt_export_to_in_all_task_tab}=    Replace String    ${dps_txt_title_table_in_all_task_tab_home_page}    {title_task_type}    ${task_type}
    ${dps_txt_export_to_in_all_task_tab}=    Replace String    ${dps_txt_export_to_in_all_task_tab}    {main_title}    ${export_to}
    ${dps_txt_transport_in_all_task_tab}=    Replace String    ${dps_txt_title_table_in_all_task_tab_home_page}    {title_task_type}    ${task_type}
    ${dps_txt_transport_in_all_task_tab}=    Replace String    ${dps_txt_transport_in_all_task_tab}    {main_title}    ${transport}
    ${dps_txt_pouch_number_in_all_task_tab}=    Replace String    ${dps_txt_task_type_title_table_in_all_task_tab_home_page}    {title}    ${pouch_number}
    ${dps_txt_parcel_number_in_all_task_tab}=    Replace String    ${dps_txt_title_table_in_all_task_tab_home_page}    {title_task_type}    ${task_type}
    ${dps_txt_parcel_number_in_all_task_tab}=    Replace String    ${dps_txt_parcel_number_in_all_task_tab}    {main_title}    ${parcel_number}
    ${dps_txt_parcel_size_in_all_task_tab}=    Replace String    ${dps_txt_title_table_in_all_task_tab_home_page}    {title_task_type}    ${task_type}
    ${dps_txt_parcel_size_in_all_task_tab}=    Replace String    ${dps_txt_parcel_size_in_all_task_tab}    {main_title}    ${parcel_size}
    ${dps_txt_parcel_status_in_all_task_tab}=    Replace String    ${dps_txt_title_table_in_all_task_tab_home_page}    {title_task_type}    ${task_type}
    ${dps_txt_parcel_status_in_all_task_tab}=    Replace String    ${dps_txt_parcel_status_in_all_task_tab}    {main_title}    ${parcel_status}
    Wait Until Element Is Visible    ${dps_txt_task_type_in_all_task_tab}    timeout=${DEFAULT_TIMEOUT}
    ${dps_tab_all_task}=    Replace String    ${dps_tab_in_home_page}    {value}    ${dc_operation.tab_daily_task['all_task']}
    ${actual_tab_all_task_status}=    Get Element Attribute    ${dps_tab_all_task}    aria-selected
    Should Be Equal    ${actual_tab_all_task_status}    true
    ${actual_txt_task_type_in_all_task_tab}=    Get Text    ${dps_txt_task_type_in_all_task_tab}
    ${actual_txt_parcel_owner_in_all_task_tab}=    Get Text    ${dps_txt_parcel_owner_in_all_task_tab}
    ${actual_txt_import_from_in_all_task_tab}=    Get Text    ${dps_txt_import_from_in_all_task_tab}
    ${actual_txt_export_to_in_all_task_tab}=    Get Text    ${dps_txt_export_to_in_all_task_tab}
    ${actual_txt_transport_in_all_task_tab}=    Get Text    ${dps_txt_transport_in_all_task_tab}
    ${actual_txt_pouch_number_in_all_task_tab}=    Get Text    ${dps_txt_pouch_number_in_all_task_tab}
    ${actual_txt_parcel_number_in_all_task_tab}=    Get Text    ${dps_txt_parcel_number_in_all_task_tab}
    ${actual_txt_parcel_size_in_all_task_tab}=    Get Text    ${dps_txt_parcel_size_in_all_task_tab}
    ${actual_txt_parcel_status_in_all_task_tab}=    Get Text    ${dps_txt_parcel_status_in_all_task_tab}
    Should Be Equal    ${actual_txt_task_type_in_all_task_tab}    ${task_type}
    Should Be Equal    ${actual_txt_parcel_owner_in_all_task_tab}    ${parcel_owner}
    Should Be Equal    ${actual_txt_import_from_in_all_task_tab}    ${import_from}
    Should Be Equal    ${actual_txt_export_to_in_all_task_tab}    ${export_to}
    Should Be Equal    ${actual_txt_transport_in_all_task_tab}    ${transport}
    Should Be Equal    ${actual_txt_pouch_number_in_all_task_tab}    ${pouch_number}
    Should Be Equal    ${actual_txt_parcel_number_in_all_task_tab}    ${parcel_number}
    Should Be Equal    ${actual_txt_parcel_size_in_all_task_tab}    ${parcel_size}
    Should Be Equal    ${actual_txt_parcel_status_in_all_task_tab}    ${parcel_status}

Verify Data In All Task Tab
    [Arguments]    ${task_type}    ${parcel_owner}    ${import_from}    ${export_to}    
    ...            ${transport}    ${pouch_number}    ${parcel_number}    ${parcel_size}    ${parcel_status}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task_home_page}    {task_type}    ${task_type}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {parcel_owner}    ${parcel_owner}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {import_from}    ${import_from}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {export_to}    ${export_to}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {transport}    ${transport}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {pouch_number}    ${pouch_number}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {parcel_number}    ${parcel_number}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {parcel_status}    ${parcel_status}
    Scroll Element Into View    ${dps_txt_list_first_all_task}
    Wait Until Element Is Visible    ${dps_txt_list_first_all_task}    timeout=${DEFAULT_TIMEOUT}

Verify Parcel Is Not Visible [All Task Tab]
    [Arguments]    ${task_type}    ${parcel_owner}    ${import_from}    ${export_to}    
    ...            ${transport}    ${pouch_number}    ${parcel_number}    ${parcel_size}    ${parcel_status}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task_home_page}    {task_type}    ${task_type}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {parcel_owner}    ${parcel_owner}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {import_from}    ${import_from}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {export_to}    ${export_to}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {transport}    ${transport}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {pouch_number}    ${pouch_number}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {parcel_number}    ${parcel_number}
    ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {parcel_status}    ${parcel_status}
    Sleep    5s
    Wait Until Element Is Not Visible    ${dps_txt_list_first_all_task}    timeout=${DEFAULT_TIMEOUT}
    
Verify Data In All Task Tab (Loop To Find Each Row)
    [Arguments]    ${task_type}    ${parcel_owner}    ${import_from}    ${export_to}    
    ...            ${transport}    ${pouch_number}    ${parcel_number}    ${parcel_size}    ${parcel_status}
        ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task_home_page}    {task_type}    ${task_type}
        ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {parcel_owner}    ${parcel_owner}
        ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {import_from}    ${import_from}
        ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {export_to}    ${export_to}
        ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {transport}    ${transport}
        ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {pouch_number}    ${pouch_number}
        ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {parcel_number}    ${parcel_number}
        ${dps_txt_list_first_all_task}=    Replace String    ${dps_txt_list_first_all_task}    {parcel_status}    ${parcel_status}
    WHILE    True
        ${elementIsVisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${dps_txt_list_first_all_task}    timeout=${DEFAULT_TIMEOUT}
        IF    '${elementIsVisible}' == 'True'
            Scroll Element Into View    ${dps_txt_list_first_all_task}
            ${actual_txt_list_first_all_task}=    Get Text    ${dps_txt_list_first_all_task}
            ${actual_txt_list_first_all_task}=    Replace String    ${actual_txt_list_first_all_task}    \n    ${SPACE}
            Should Be Equal As Strings    ${actual_txt_list_first_all_task}    ${task_type} ${parcel_owner} ${import_from} ${export_to} ${transport} ${pouch_number} ${parcel_number} ${parcel_status}
            Exit For Loop
        ELSE
            Scroll Element Into View    ${dps_btn_pagination_right_home_page}
            common.Click When Ready    ${dps_btn_pagination_right_home_page}
        END
    END    

Click Dropdown For Select Role
    common.Click When Ready    ${dps_btn_dropdown_select_role}

Select Role
    [Arguments]    ${role}
    ${dps_btn_role}=  Replace String   ${dps_btn_role}   {value}   ${role}
    common.Click When Ready    ${dps_btn_role}

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

Verify Label In Import Task Tab
    [Arguments]    ${import_from}    ${transport}    ${parcel_owner}   
    ...            ${number_of_pouch}    ${number_of_pieces}    ${number_of_scanned_items}
    ${dps_txt_label_import_task_tab_in_home_page}=    Replace String    ${dps_txt_label_import_task_tab_in_home_page}    {import_from}    ${import_from}
    ${dps_txt_label_import_task_tab_in_home_page}=    Replace String    ${dps_txt_label_import_task_tab_in_home_page}    {transport}    ${transport}
    ${dps_txt_label_import_task_tab_in_home_page}=    Replace String    ${dps_txt_label_import_task_tab_in_home_page}    {parcel_owner}    ${parcel_owner}
    ${dps_txt_label_import_task_tab_in_home_page}=    Replace String    ${dps_txt_label_import_task_tab_in_home_page}    {number_of_pouch}    ${number_of_pouch}
    ${dps_txt_label_import_task_tab_in_home_page}=    Replace String    ${dps_txt_label_import_task_tab_in_home_page}    {number_of_pieces}    ${number_of_pieces}
    ${dps_txt_label_import_task_tab_in_home_page}=    Replace String    ${dps_txt_label_import_task_tab_in_home_page}    {number_of_scanned_items}    ${number_of_scanned_items}
    common.Scroll Into View By Xpath    ${dps_txt_label_import_task_tab_in_home_page}    true
    Element Should Be Visible    ${dps_txt_label_import_task_tab_in_home_page}
    
Verify Data In Import Task Tab
    [Arguments]    ${import_from}    ${transport}    ${parcel_owner}
    ${dps_txt_list_first_import_task}=    Replace String    ${dps_txt_list_first_import_task_home_page}    {import_from}    ${import_from}
    ${dps_txt_list_first_import_task}=    Replace String    ${dps_txt_list_first_import_task}    {transport}    ${transport}
    ${dps_txt_list_first_import_task}=    Replace String    ${dps_txt_list_first_import_task}    {parcel_owner}    ${parcel_owner}
    common.Scroll Into View By Xpath    ${dps_txt_list_first_import_task}    true
    Element Should Be Visible    ${dps_txt_list_first_import_task}

Verify Label In Export Task Tab
    [Arguments]    ${export_to}    ${transport}    ${parcel_owner}       
    ...            ${number_of_pouch}    ${number_of_pieces}    ${number_of_scanned_items}
    ${dps_txt_label_export_task_tab_in_home_page}=    Replace String    ${dps_txt_label_export_task_tab_in_home_page}    {export_to}    ${export_to}
    ${dps_txt_label_export_task_tab_in_home_page}=    Replace String    ${dps_txt_label_export_task_tab_in_home_page}    {transport}    ${transport}
    ${dps_txt_label_export_task_tab_in_home_page}=    Replace String    ${dps_txt_label_export_task_tab_in_home_page}    {parcel_owner}    ${parcel_owner}
    ${dps_txt_label_export_task_tab_in_home_page}=    Replace String    ${dps_txt_label_export_task_tab_in_home_page}    {number_of_pouch}    ${number_of_pouch}
    ${dps_txt_label_export_task_tab_in_home_page}=    Replace String    ${dps_txt_label_export_task_tab_in_home_page}    {number_of_pieces}    ${number_of_pieces}
    ${dps_txt_label_export_task_tab_in_home_page}=    Replace String    ${dps_txt_label_export_task_tab_in_home_page}    {number_of_scanned_items}    ${number_of_scanned_items}
    common.Scroll Into View By Xpath    ${dps_txt_label_export_task_tab_in_home_page}    true
    Element Should Be Visible    ${dps_txt_label_export_task_tab_in_home_page}

Verify Data In Export Task Tab
    [Arguments]    ${export_to}    ${transport}    ${parcel_owner}       
    ${dps_txt_list_first_export_task}=    Replace String    ${dps_txt_list_first_export_task_home_page}    {export_to}    ${export_to}
    ${dps_txt_list_first_export_task}=    Replace String    ${dps_txt_list_first_export_task}    {transport}    ${transport}
    ${dps_txt_list_first_export_task}=    Replace String    ${dps_txt_list_first_export_task}    {parcel_owner}    ${parcel_owner}

    FOR   ${i}    IN RANGE    0    10
        ${isvisible}=    Run Keyword And Return Status    Page Should Contain Element    ${dps_txt_list_first_export_task}
        Exit For Loop If    '${isvisible}' == 'True'
        common.Scroll Into View By Xpath    ${dps_btn_next_page_export_task}    true
        common.Click When Ready    ${dps_btn_next_page_export_task}
    END
    common.Scroll Into View By Xpath    ${dps_txt_list_first_export_task}    true
    Element Should Be Visible    ${dps_txt_list_first_export_task}

Select DPS Menu
    [Arguments]    ${tabname}
    ${tab_menu}=    Replace String    ${dps_tab_menu}    {tabname}    ${tabname}
    Wait Until Element Is Visible    ${tab_menu}    timeout=30s
    Mouse Over    ${tab_menu}
    Wait Until Element Is Visible    ${tab_menu}
    Click Element    ${tab_menu}
    Mouse Out    ${tab_menu}

Re Format And Sum Number of Export Work
    [Arguments]    ${number1}    ${number2}    ${number3}    ${number4}    ${number5}
    ${number1}=    Convert To Integer    ${number1}
    ${number2}=    Convert To Integer    ${number2}
    ${number3}=    Convert To Integer    ${number3}
    ${number4}=    Convert To Integer    ${number4}
    ${number5}=    Convert To Integer    ${number5}
    ${sum_number}=    Evaluate    ${number1} + ${number2} + ${number3}
    ${sum_number}=    Evaluate    ${sum_number} + ${number4} + ${number5}
    ${sum_number}=    Convert To String    ${sum_number}
    RETURN     ${sum_number}

Re Format And Sum Number of Delivery Work
    [Arguments]    ${number1}    ${number2}    ${number3}
    ${number1}=    Convert To Integer    ${number1}
    ${number2}=    Convert To Integer    ${number2}
    ${number3}=    Convert To Integer    ${number3}
    ${sum_number}=    Evaluate    ${number1} + ${number2} + ${number3}
    ${sum_number}=    Convert To String    ${sum_number}
    RETURN     ${sum_number}

Re Format And Sum Number of In Warehouse Parcels
    [Arguments]    ${number1}    ${number2}
    ${number1}=    Convert To Integer    ${number1}
    ${number2}=    Convert To Integer    ${number2}
    ${sum_number}=    Evaluate    ${number1} + ${number2}
    ${sum_number}=    Convert To String    ${sum_number}
    RETURN     ${sum_number}

Verify Current Date
    ${dps_txt_date}=    Replace String    ${dps_txt_date}    {value}    ${dc_operation['text_data_at_date']}
    Wait Until Element Is Visible    ${dps_txt_date}    30s
    ${Web_Date}    Get Text    ${dps_txt_date}  
    ${Web_Date}    Split String And Select    ${Web_Date}    ${space}    3
    ${current_date}    Get Current DateTime Thai Format
    Should Be Equal    ${Web_Date}    ${current_date}

Get Current DateTime Thai Format
    ${current_date} =    Get Current Date    result_format=%d/%m/%Y
    ${day}    Split String And Select    ${current_date}    /    0
    ${month}    Split String And Select    ${current_date}    /    1
    ${year}    Split String And Select    ${current_date}    /    2
    ${year} =    Evaluate    int(${year}) + 543
    ${year} =    Convert To String    ${year}
    ${current_date}    Catenate    SEPARATOR=/    ${day}    ${month}    ${year}
    RETURN    ${current_date}

Verify In Warehouse Parcels
    [Arguments]    ${test_scenario}
    Verify Export Work Of CP All    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.export_work['cap_all']}
    Verify Export Work Of J&T    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.export_work['j&t']}
    Verify Export Work Of DHL    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.export_work['dhl']}
    Verify Export Work Of Flash    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.export_work['flash']}
    Verify Export Work Of Kerry    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.export_work['kerry']}
    Verify Sum number of Export Work
    Verify Delivery Work Of Store    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.delivery_work['store']}
    Verify Delivery Work Of House    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.delivery_work['house']}
    Verify Delivery Work Of 7 Delivery    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.delivery_work['7_delivery']}
    Verify Sum Number of Delivery Work
    Verify Sum Number of In Warehouse Parcels

Verify Export Work Of CP All
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //strong[text()='CP All (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${cp_all_number}    ${number}

Verify Export Work Of J&T
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //strong[text()='J&T (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${j&t_number}    ${number}

Verify Export Work Of DHL
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //strong[text()='DHL (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${dhl_number}    ${number}

Verify Export Work Of Flash
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //strong[text()='Flash (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${flash_number}    ${number}

Verify Export Work Of Kerry
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //strong[text()='Kerry (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${kerry_number}    ${number}

Verify Sum number of Export Work
    ${sum_number_export_work}    Re Format And Sum Number of Export Work    ${cp_all_number}    ${j&t_number}    ${dhl_number}    ${flash_number}    ${kerry_number}
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${sum_number_export_work}
    Set Suite Variable    ${sum_number_export_work}    ${sum_number_export_work}
    Log    ${sum_number_export_work}

Verify Delivery Work Of Store
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //div[@class='ant-col ant-col-14 css-1x1kih3']//strong[text()='ร้าน (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${in_warehouse_parcels_store_number}    ${number}

Verify Delivery Work Of House
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //div[@class='ant-col ant-col-14 css-1x1kih3']//strong[text()='บ้าน (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${in_warehouse_parcels_house_number}    ${number}

Verify Delivery Work Of 7 Delivery
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //div[@class='ant-col ant-col-14 css-1x1kih3']//strong[text()='7 Delivery (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${in_warehouse_parcels_7_delivery_number}    ${number}

Verify Sum Number of Delivery Work
    ${sum_number_delivery_work}    Re Format And Sum Number of Delivery Work    ${in_warehouse_parcels_store_number}    ${in_warehouse_parcels_house_number}    ${in_warehouse_parcels_7_delivery_number}
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${sum_number_delivery_work}
    Set Suite Variable    ${sum_number_delivery_work}    ${sum_number_delivery_work}
    Log    ${sum_number_delivery_work}

Verify Sum Number of In Warehouse Parcels
    ${sum_number_in_warehouse_parcels}    Re Format And Sum Number of In Warehouse Parcels    ${sum_number_export_work}    ${sum_number_delivery_work}
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${sum_number_in_warehouse_parcels}
    Log    ${sum_number_in_warehouse_parcels}

Verify Page Title
    [Arguments]    ${title}
    ${dps_txt_page_title}=  Replace String   ${dps_txt_page_title}  {value}   ${title}
    Wait Until Element Is Visible    ${dps_txt_page_title}    timeout=${DEFAULT_TIMEOUT}

Verify Role Change In Profile
    [Arguments]    ${role}
    ${dps_txt_role_user}=  Replace String   ${dps_txt_role_user}   {value}   ${role}
    Wait Until Element Is Visible    ${dps_img_icon_user}${dps_txt_role_user}    timeout=${DEFAULT_TIMEOUT}

Verify Tab Selected
    [Arguments]    ${name}
    ${dps_tab_name}=  Replace String   ${dps_tab_name}   {value}   ${name}
    Wait Until Element Is Visible    ${dps_tab_name}    timeout=${DEFAULT_TIMEOUT}
    ${checked}    Get Element Attribute    ${dps_tab_name}    aria-selected
    Should Be Equal As Strings    ${checked}    true

Wait Until DC Operation Home Page Loaded
    Wait Until Element Is Visible    ${dps_img_loading_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${dps_img_loading_page}    timeout=180s

Wait Until Page Loaded
    Wait Until Element Is Visible    ${dps_img_loading_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${dps_img_loading_page}    timeout=${DEFAULT_TIMEOUT}

Verify Label In Send Task Tab
    [Arguments]    ${send_to}    ${store_code}    ${customer_type}    ${transport}    ${number_of_pieces}
    ${dps_txt_title_table_in_send_task_tab_home_page}=    Replace String    ${dps_txt_title_table_in_send_task_tab_home_page}    {send_to}    ${send_to}
    ${dps_txt_title_table_in_send_task_tab_home_page}=    Replace String    ${dps_txt_title_table_in_send_task_tab_home_page}    {store_code}    ${store_code}
    ${dps_txt_title_table_in_send_task_tab_home_page}=    Replace String    ${dps_txt_title_table_in_send_task_tab_home_page}    {customer_type}    ${customer_type}
    ${dps_txt_title_table_in_send_task_tab_home_page}=    Replace String    ${dps_txt_title_table_in_send_task_tab_home_page}    {transport}    ${transport}
    ${dps_txt_title_table_in_send_task_tab_home_page}=    Replace String    ${dps_txt_title_table_in_send_task_tab_home_page}    {number_of_pieces}    ${number_of_pieces}
    Wait Until Element Is Visible    ${dps_txt_title_table_in_send_task_tab_home_page}    timeout=${DEFAULT_TIMEOUT}
    

Verify Data In Send Task Tab
    [Arguments]    ${send_to}    ${store_code}    ${customer_type}    ${transport}
    ${dps_txt_list_send_task}=    Replace String    ${dps_txt_list_send_task_home_page}    {send_to}    ${send_to}
    ${dps_txt_list_send_task}=    Replace String    ${dps_txt_list_send_task}    {store_code}    ${store_code}
    ${dps_txt_list_send_task}=    Replace String    ${dps_txt_list_send_task}    {customer_type}    ${customer_type}
    ${dps_txt_list_send_task}=    Replace String    ${dps_txt_list_send_task}    {transport}    ${transport}
    Scroll Element Into View    ${dps_txt_list_send_task}
    # Element Should Contain    ${dps_txt_list_send_task}    ${send_to} ${store_code} ${customer_type} ${transport}
    Wait Until Element Is Visible    ${dps_txt_list_send_task}    timeout=${DEFAULT_TIMEOUT}

Select Filter Button
    ${dps_btn_filter}=    Replace String    ${dps_btn_filter_home_page}    {value}    ${dc_operation['button_filter']}
    Scroll Element Into View    ${dps_btn_filter}
    common.Click When Ready    ${dps_btn_filter}

Click Search Button On Filter
    ${dps_btn_search_filter}=    Replace String    ${dps_btn_search_filter_home_page}    {value}    ${dc_operation['button_search']}
    common.Click When Ready    ${dps_btn_search_filter}

Filter Data By Parcel Number [All Task Tab]
    [Arguments]    ${parcel_cod}
    Select Filter Button
    common.Input When Ready    ${dps_txtbox_parcel_number_home_page}    ${parcel_cod}
    Click Search Button On Filter
    Select Filter Button

Filter Data By Store Code [Send Task Tab]
    [Arguments]    ${store_code}
    ${dps_cbo_store_code}=    Replace String    ${dps_cbo_store_code_home_page}    {value}    ${store_code}
    Select Filter Button
    common.Input When Ready    ${dps_txtbox_store_code_home_page}    ${store_code}
    common.Click When Ready    ${dps_cbo_store_code}
    Click Search Button On Filter
    Select Filter Button
