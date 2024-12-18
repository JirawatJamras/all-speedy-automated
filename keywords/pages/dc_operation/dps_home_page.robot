*** Keywords ***
Set Cut Off Time
    [Arguments]    ${time}
    connect_to_mongodb    ${DB_URI}    ${DATABASE_NAME}    ${COLLECTION}
    ${QUERY}    Create Dictionary    status=${QUERY}
    ${update}    Create Dictionary    cutOff=${time}
    ${update_with_set}    Create Dictionary    $set=${update}
    update_document    ${QUERY}    ${update}
    disconnect

Reset Cut Off Time
    [Arguments]    ${time}
    connect_to_mongodb    ${DB_URI}    ${DATABASE_NAME}    ${COLLECTION}
    ${QUERY}    Create Dictionary    status=${QUERY}
    ${update}    Create Dictionary    cutOff=${time}
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

Select Warehouse List Button
    [Arguments]    ${selected_warehouse}
    ${dps_btn_selected_warehouse_list_1}=    Replace String    ${dps_btn_selected_warehouse_list_home_page}    {value}    ${dc_operation.selected_warehouse_list['text_selected_warehouse_list']}
    common.Click When Ready    ${dps_btn_selected_warehouse_list_1}
    ${dps_cbo_selected_warehouse_list_no_select}=    Replace String    ${dps_cbo_warehouse_list_home_page}    {warehouse}    ${dc_operation.selected_warehouse_list['text_warehouse_no_select']}
    common.Click When Ready    ${dps_cbo_selected_warehouse_list_no_select}
    ${dps_cbo_selected_warehouse_list}=    Replace String    ${dps_cbo_warehouse_list_home_page}    {warehouse}    ${selected_warehouse}
    common.Click When Ready    ${dps_cbo_selected_warehouse_list}
    common.Click When Ready    ${dps_btn_selected_warehouse_list_1}

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
    ...            ${transport}    ${pouch_number}    ${parcel_number}    ${parcel_status}
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
    ${actual_txt_parcel_status_in_all_task_tab}=    Get Text    ${dps_txt_parcel_status_in_all_task_tab}
    Should Be Equal    ${actual_txt_task_type_in_all_task_tab}    ${task_type}
    Should Be Equal    ${actual_txt_parcel_owner_in_all_task_tab}    ${parcel_owner}
    Should Be Equal    ${actual_txt_import_from_in_all_task_tab}    ${import_from}
    Should Be Equal    ${actual_txt_export_to_in_all_task_tab}    ${export_to}
    Should Be Equal    ${actual_txt_transport_in_all_task_tab}    ${transport}
    Should Be Equal    ${actual_txt_pouch_number_in_all_task_tab}    ${pouch_number}
    Should Be Equal    ${actual_txt_parcel_number_in_all_task_tab}    ${parcel_number}
    Should Be Equal    ${actual_txt_parcel_status_in_all_task_tab}    ${parcel_status}

Verify Data In All Task Tab
    [Arguments]    ${task_type}    ${parcel_owner}    ${import_from}    ${export_to}    
    ...            ${transport}    ${pouch_number}    ${parcel_number}    ${parcel_status}
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
    ...            ${transport}    ${pouch_number}    ${parcel_number}    ${parcel_status}
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