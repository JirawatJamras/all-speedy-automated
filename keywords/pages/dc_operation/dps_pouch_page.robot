*** Keywords ***
Proceed Pouch By Pouch Number
    [Arguments]    ${pouch_number}
    common.Click When Ready    //td[text()='${pouch_number}']/..//td[7]//img/..

Click Print Pouch Label
    ${dps_btn_print_pouch_label_pouch_detail_page}=    Replace String    ${dps_btn_print_pouch_label_pouch_detail_page}    {value}    ${dc_operation['text_close_pouch_and_print_label']}
    common.Scroll Into View By Xpath    ${dps_btn_print_pouch_label_pouch_detail_page}    true
    common.Click When Ready    ${dps_btn_print_pouch_label_pouch_detail_page}

Verify Pouch In Pouch Page
    [Arguments]    ${pouch_number}    ${inventory_crossdock}    ${destination_inventory}
    ...    ${status}    ${update_date}    ${pencil_icon}
    ${checked}=    Set Variable If    '${status}' == 'On'    true    false
    ${dps_txt_pouch_in_pouch_list}=    Replace String    ${dps_txt_pouch_in_pouch_list}    {pouch_number}    ${pouch_number}
    ${dps_txt_pouch_in_pouch_list}=    Replace String    ${dps_txt_pouch_in_pouch_list}    {inventory_crossdock}    ${inventory_crossdock}
    ${dps_txt_pouch_in_pouch_list}=    Replace String    ${dps_txt_pouch_in_pouch_list}    {destination_inventory}    ${destination_inventory}
    ${dps_txt_pouch_in_pouch_list}=    Replace String    ${dps_txt_pouch_in_pouch_list}    {checked}    ${checked}
    ${dps_txt_pouch_in_pouch_list}=    Replace String    ${dps_txt_pouch_in_pouch_list}    {update_date}    ${update_date}
    ${dps_img_pencil_in_pouch_in_pouch_list}=    Replace String    ${dps_img_pencil_in_pouch_in_pouch_list}    {pouch_number}    ${pouch_number}
    ${dps_img_pencil_in_pouch_in_pouch_list}=    Replace String    ${dps_img_pencil_in_pouch_in_pouch_list}    {inventory_crossdock}    ${inventory_crossdock}
    ${dps_img_pencil_in_pouch_in_pouch_list}=    Replace String    ${dps_img_pencil_in_pouch_in_pouch_list}    {destination_inventory}    ${destination_inventory}
    ${dps_img_pencil_in_pouch_in_pouch_list}=    Replace String    ${dps_img_pencil_in_pouch_in_pouch_list}    {checked}    ${checked}
    ${dps_img_pencil_in_pouch_in_pouch_list}=    Replace String    ${dps_img_pencil_in_pouch_in_pouch_list}    {update_date}    ${update_date}
    Scroll Element Into View    ${dps_txt_pouch_in_pouch_list}
    ${actual_update_date}=    Get Text    ${dps_txt_pouch_in_pouch_list}//td[6]
    ${expected_update_date_format}    Convert Date    ${actual_update_date}    date_format=%d-%m-%Y %H:%M    result_format=%d-%m-%Y %H:%M
    Should Be Equal    ${actual_update_date}   ${expected_update_date_format}
    Run Keyword IF    '${pencil_icon}' == 'ไอคอนรูปดินสอ'    Page Should Contain Element    ${dps_img_pencil_in_pouch_in_pouch_list}

Verify Label Of Information Section In Pouch Detail Popup
    [Arguments]    ${title_pouch_detail}    ${txt_pouch_num}    ${txt_crossdock_warehouse}
    ...    ${txt_pouch_status}    ${txt_parcel_amount}    ${txt_origin_warehouse}
    ...    ${txt_destination_warehouse}
    ${dps_txt_title_pouch_detail}=    Replace String    ${dps_txt_title_pouch_detail}    {value}    ${title_pouch_detail}
    ${dps_txt_pouch_number_pouch_detail}=    Replace String    ${dps_txt_pouch_number_pouch_detail}    {value}    ${txt_pouch_num}
    ${dps_txt_crossdock_warehouse_pouch_detail}=    Replace String    ${dps_txt_crossdock_warehouse_pouch_detail}    {value}    ${txt_crossdock_warehouse}
    ${dps_txt_pouch_status_pouch_detail}=    Replace String    ${dps_txt_pouch_status_pouch_detail}    {value}    ${txt_pouch_status}
    ${dps_txt_parcel_amount_pouch_detail}=    Replace String    ${dps_txt_parcel_amount_pouch_detail}    {value}    ${txt_parcel_amount}
    ${dps_txt_origin_warehouse_pouch_detail}=    Replace String    ${dps_txt_origin_warehouse_pouch_detail}    {value}    ${txt_origin_warehouse}
    ${dps_txt_destination_warehouse_pouch_detail}=    Replace String    ${dps_txt_destination_warehouse_pouch_detail}    {value}    ${txt_destination_warehouse}
    ${actual_txt_title_pouch_detail}=    Get Text    ${dps_txt_title_pouch_detail}
    ${actual_txt_pouch_num}=    Get Text    ${dps_txt_pouch_number_pouch_detail}
    ${actual_txt_crossdock_warehouse}=    Get Text    ${dps_txt_crossdock_warehouse_pouch_detail}
    ${actual_txt_pouch_status}=    Get Text    ${dps_txt_pouch_status_pouch_detail}
    ${actual_txt_parcel_amount}=    Get Text    ${dps_txt_parcel_amount_pouch_detail}
    ${actual_origin_warehouse}=    Get Text    ${dps_txt_origin_warehouse_pouch_detail}
    ${actual_destination_warehouse}=    Get Text    ${dps_txt_destination_warehouse_pouch_detail}
    Should Be Equal    ${actual_txt_title_pouch_detail}    ${title_pouch_detail}
    Should Be Equal    ${actual_txt_pouch_num}    ${txt_pouch_num}
    Should Be Equal    ${actual_txt_crossdock_warehouse}    ${txt_crossdock_warehouse}
    Should Be Equal    ${actual_txt_pouch_status}    ${txt_pouch_status}
    Should Be Equal    ${actual_txt_parcel_amount}    ${txt_parcel_amount}
    Should Be Equal    ${actual_origin_warehouse}    ${txt_origin_warehouse}
    Should Be Equal    ${actual_destination_warehouse}    ${txt_destination_warehouse}

Verify Data Of Information Section In Pouch Detail Popup
    [Arguments]    ${expected_pouch_num}    ${expected_crossdock_warehouse}    ${expected_pouch_status}
    ...    ${expected_origin_warehouse}    ${expected_destination_warehouse}
    ${dps_txt_pouch_number_pouch_detail}=    Replace String    ${dps_txt_pouch_number_pouch_detail}    {value}    ${dc_operation.label_pouch_in_pouch_detail['pouch_number']}
    ${dps_txt_crossdock_warehouse_pouch_detail}=    Replace String    ${dps_txt_crossdock_warehouse_pouch_detail}    {value}    ${dc_operation.label_pouch_in_pouch_detail['crossdock_warehouse']}
    ${dps_txt_pouch_status_pouch_detail}=    Replace String    ${dps_txt_pouch_status_pouch_detail}    {value}    ${dc_operation.label_pouch_in_pouch_detail['pouch_status']}
    ${dps_txt_origin_warehouse_pouch_detail}=    Replace String    ${dps_txt_origin_warehouse_pouch_detail}    {value}    ${dc_operation.label_pouch_in_pouch_detail['origin_warehouse']}
    ${dps_txt_destination_warehouse_pouch_detail}=    Replace String    ${dps_txt_destination_warehouse_pouch_detail}    {value}    ${dc_operation.label_pouch_in_pouch_detail['destination_warehouse']}
    ${actual_txt_pouch_num}=    Get Text    ${dps_txt_pouch_number_pouch_detail}/..//span[2]
    ${actual_txt_crossdock_warehouse}=    Get Text    ${dps_txt_crossdock_warehouse_pouch_detail}/..//span[2]
    ${actual_txt_pouch_status}=    Get Text    ${dps_txt_pouch_status_pouch_detail}/..//div
    ${actual_origin_warehouse}=    Get Text    ${dps_txt_origin_warehouse_pouch_detail}/..//span[2]
    ${actual_destination_warehouse}=    Get Text    ${dps_txt_destination_warehouse_pouch_detail}/..//span[2]
    Should Be Equal    ${actual_txt_pouch_num}    ${expected_pouch_num}
    Should Be Equal    ${actual_txt_crossdock_warehouse}    ${expected_crossdock_warehouse}
    Should Be Equal    ${actual_txt_pouch_status}    ${expected_pouch_status}
    Should Be Equal    ${actual_origin_warehouse}    ${expected_origin_warehouse}
    Should Be Equal    ${actual_destination_warehouse}    ${expected_destination_warehouse}

Verify Label Section In Pouch Detail Popup
    [Arguments]    ${destination_warehouse_name}    ${number}    ${route}
    ...    ${symbol}    ${pouch_number}
    ${actual_destination_warehouse_name}=    Get Text   ${dps_txt_destination_warehouse_in_pouch_label}
    ${actual_number}=    Get Text    ${dps_txt_number_in_pouch_label}
    ${actual_route}=    Get Text    ${dps_txt_route_in_pouch_label}
    ${actual_pouch_number}=    Get Text    ${dps_txt_pouch_number_pouch_label}
    Should Be Equal    ${actual_destination_warehouse_name}    ${destination_warehouse_name}
    Should Be Equal    ${actual_number}    ${number}
    Should Be Equal    ${actual_route}    ${route}
    IF    '${symbol}' == 'รูปดาว'
        Wait Until Element Is Visible    ${dps_img_star_symbol_pouch_label}    timeout=10s
    END
    Should Be Equal    ${actual_pouch_number}    ${pouch_number}
    Wait Until Element Is Visible    ${dps_txt_pouch_number_pouch_label}    timeout=10s
    Wait Until Element Is Visible    ${dps_img_qr_pouch_label}    timeout=10s

Verify Label In Table On Pouch Detail Popup
    [Arguments]    ${expected_title}    ${txt_pouch_number}    ${txt_destination_warehouse}
    ...    ${txt_pickup_place}    ${txt_type}    ${txt_parcel_status}
    ...    ${btn_print_pouch}
    ${dps_txt_th_parcel_in_table_poch_detail}    Replace String    ${dps_txt_th_parcel_in_table_poch_detail}    {txt_pouch_number}    ${txt_pouch_number}
    ${dps_txt_th_parcel_in_table_poch_detail}    Replace String    ${dps_txt_th_parcel_in_table_poch_detail}    {txt_destination_warehouse}    ${txt_destination_warehouse}
    ${dps_txt_th_parcel_in_table_poch_detail}    Replace String    ${dps_txt_th_parcel_in_table_poch_detail}    {txt_pickup_place}    ${txt_pickup_place}
    ${dps_txt_th_parcel_in_table_poch_detail}    Replace String    ${dps_txt_th_parcel_in_table_poch_detail}    {txt_type}    ${txt_type}
    ${dps_txt_th_parcel_in_table_poch_detail}    Replace String    ${dps_txt_th_parcel_in_table_poch_detail}    {txt_parcel_status}    ${txt_parcel_status}
    ${dps_txt_title_parcel_in_pouch_list_pouch_label}=    Replace String    ${dps_txt_title_parcel_in_pouch_list_pouch_label}    {value}    ${expected_title}
    ${dps_btn_print_pouch_label_pouch_detail_page}=    Replace String    ${dps_btn_print_pouch_label_pouch_detail_page}    {value}    ${btn_print_pouch}
    ${actual_title}=    Get Text    ${dps_txt_title_parcel_in_pouch_list_pouch_label}
    ${actual_btn_print_pouch}=    Get Text    ${dps_btn_print_pouch_label_pouch_detail_page}
    common.Scroll Into View By Xpath    ${dps_txt_title_parcel_in_pouch_list_pouch_label}    true
    Wait Until Element Is Visible    ${dps_txt_th_parcel_in_table_poch_detail}    timeout=10s
    Should Be Equal    ${actual_title}    ${expected_title}
    Should Be Equal    ${actual_btn_print_pouch}    ${btn_print_pouch}

Verify Data In Table On Pouch Detail Popup
    [Arguments]    ${parcel_number}    ${destination_warehouse}    ${pickup_place}
    ...    ${type}    ${parcel_status}    
    common.Scroll Window To Vertical    500
    ${dps_txt_tr_parcel_in_table_pouch_detail}=    Replace String    ${dps_txt_tr_parcel_in_table_pouch_detail}    {parcel_number}    ${parcel_number}
    ${dps_txt_tr_parcel_in_table_pouch_detail}=    Replace String    ${dps_txt_tr_parcel_in_table_pouch_detail}    {destination_warehouse}    ${destination_warehouse}
    ${dps_txt_tr_parcel_in_table_pouch_detail}=    Replace String    ${dps_txt_tr_parcel_in_table_pouch_detail}    {pickup_place}    ${pickup_place}
    ${dps_txt_tr_parcel_in_table_pouch_detail}=    Replace String    ${dps_txt_tr_parcel_in_table_pouch_detail}    {type}    ${type}
    ${dps_txt_tr_parcel_in_table_pouch_detail}=    Replace String    ${dps_txt_tr_parcel_in_table_pouch_detail}    {parcel_status}    ${parcel_status}
    Wait Until Element Is Visible    ${dps_txt_tr_parcel_in_table_pouch_detail}

Click Dropdown Select Warehouse List
    [Arguments]    ${selected_warehouse}
    ${name}=    Get Text    ${dps_txt_dropdown_warehouse_tab_home_page}
    ${button_selected_warehouse_list}=    Replace String    ${dps_btn_selected_warehouse_list_home_page}    {value}    ${name}
    common.Click When Ready    ${button_selected_warehouse_list}
    ${selected_warehouse_list}=    Replace String    ${dps_cbo_warehouse_parcel_pickup}    {value}    ${selected_warehouse}
    common.Click Xpath By JavaScript    ${selected_warehouse_list}
    Sleep    2s

Verify Navigate To Pouch Page Success
    ${dps_txt_title_pouch_pouch_page}=    Replace String    ${dps_txt_title_pouch_pouch_page}    {value}    ${dc_operation.title['pouch']}
    Wait Until Element Is Visible    ${dps_txt_title_pouch_pouch_page}    timeout=${DEFAULT_TIMEOUT}

Check Open Pouch And Close Pouch By Destination Inventory
    [Arguments]    ${destination_inventory}    ${txt_warning}    ${txt_transaction_complete}    ${testcase_name}
    Filter Data By Destination Inventory [Pouch Page]    ${destination_inventory}
    ${count}=    Get Element Count    //td[text()='${destination_inventory}']/..//td[5]//button[@aria-checked='true']
    IF  '${count}' != '0'
        FOR    ${index}    IN RANGE    1    ${count}+1
            Log    Step No.2 ปิด Pouch ที่มีปลายทางเป็น ${destination_inventory} (ทำทีละรายการจนหมด)
            Click On/OFF Button Of Pouch List    ${destination_inventory}
            # Expected
            Verify Warning Confirm To Close Pouch    ${txt_warning}
            common.Verify Capture Screenshot    dc_operation    ${testcase_name}    Verify Warning Confirm To Close Pouch On Checking Pouch Step
            Log    Step No.3 คลิกปุ่ม ปิด Pouch/Print Label
            Click Close Pouch/Print Label Btton On Warning Popup
            Log    Step No.4 คลิกปุ่มพิมพ์
            Sleep    5s
            common.Click ESC On Keyboard    #FOR MAC
            # common.Click Space On Keyboard    #FOR WINDOW
            # Expected
            Verify Transaction Complete Popup    ${txt_transaction_complete}
            common.Verify Capture Screenshot    dc_operation    ${testcase_name}    Verify Transaction Complete Popup On Checking Pouch Step
            Log    Step No.5 คลิกที่ x Pop up
            CLick Close Button
            # Expected
            Verify Transaction Complete Popup Was Closed
            common.Verify Capture Screenshot    dc_operation    ${testcase_name}   Verify Transaction Complete Popup Was Closed On Checking Pouch Step
        END
    END

Check Open Pouch And Close Pouch By Destination Inventory [Reprint Label]
    [Arguments]    ${destination_inventory}    ${txt_warning}    ${txt_transaction_complete}    ${testcase_name}
    Filter Data By Destination Inventory [Pouch Page]    ${destination_inventory}
    ${count}=    Get Element Count    //td[text()='${destination_inventory}']/..//td[5]//button[@aria-checked='true']
    IF  '${count}' != '0'
        FOR    ${index}    IN RANGE    1    ${count}+1
            Log    Step No.2 ปิด Pouch ที่มีปลายทางเป็น ${destination_inventory} (ทำทีละรายการจนหมด)
            Click On/OFF Button Of Pouch List    ${destination_inventory}
            # Expected
            Verify Warning Confirm To Close Pouch    ${txt_warning}
            common.Verify Capture Screenshot    dc_operation    ${testcase_name}    Verify Warning Confirm To Close Pouch On Checking Pouch Step
            Log    Step No.3 คลิกปุ่ม ปิด Pouch/Print Label
            Click Close Pouch/Print Label Btton On Warning Popup
            Log    Step No.4 คลิกปุ่มพิมพ์
            Sleep    5s
            common.Click ESC On Keyboard
            # Expected
            Verify Transaction Complete Popup    ${txt_transaction_complete}
            common.Verify Capture Screenshot    dc_operation    ${testcase_name}    Verify Transaction Complete Popup On Checking Pouch Step
            Log    Step No.5 คลิกที่ x Pop up
            CLick Close Button
            # Expected
            Verify Transaction Complete Popup Was Closed
            common.Verify Capture Screenshot    dc_operation    ${testcase_name}   Verify Transaction Complete Popup Was Closed On Checking Pouch Step
        END
    END

Click On/OFF Button Of Pouch List
    [Arguments]    ${destination_inventory}
    common.Scroll Into View By Xpath    (//td[text()='${destination_inventory}']/..//td[5]//button[@aria-checked='true'])[1]    true
    common.Click When Ready    (//td[text()='${destination_inventory}']/..//td[5]//button[@aria-checked='true'])[1]

Verify Warning Confirm To Close Pouch
    [Arguments]    ${expected}
    ${dps_txt_warning_confirm_to_close_pouch}=    Replace String    ${dps_txt_warning_confirm_to_close_pouch}    {value}    ${expected}
    Wait Until Element Is Visible    ${dps_txt_warning_confirm_to_close_pouch}    timeout=10s
    ${actual_text}=    Get Text   ${dps_txt_warning_confirm_to_close_pouch} 
    Should Be Equal   ${actual_text}    ${expected}

Click Close Pouch/Print Label Btton On Warning Popup
    ${dps_btn_close_pouch_and_print_label_on_warning_popup}=    Replace String    ${dps_btn_close_pouch_and_print_label_on_warning_popup}    {value}    ${dc_operation['text_close_pouch_and_print_label']}
    common.Click When Ready    ${dps_btn_close_pouch_and_print_label_on_warning_popup}

Verify Transaction Complete Popup
    [Arguments]    ${expected}
    Sleep    3s
    ${dps_txt_transaction_complete_popup}=    Replace String    ${dps_txt_transaction_complete_popup}    {value}    ${expected}
    Wait Until Element Is Visible    ${dps_txt_transaction_complete_popup}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text}=    Get Text    ${dps_txt_transaction_complete_popup} 
    Should Be Equal    ${actual_text}    ${expected}

CLick Close Button
    common.Click When Ready    ${dps_btn_close_x_button_on_popup}

Verify Transaction Complete Popup Was Closed
    ${dps_txt_transaction_complete_popup}=    Replace String    ${dps_txt_transaction_complete_popup}    {value}    ${dc_operation['text_transaction_complete']}
    Wait Until Element Is Not Visible    ${dps_txt_transaction_complete_popup}    timeout=${DEFAULT_TIMEOUT}

Filter Data By Destination Inventory [Pouch Page]
    [Arguments]    ${destination_inventory}
    dps_pouch_page.Select Filter Button
    common.Click When Ready    ${dps_cbo_destination_inventory_in_filter}
    common.Click Xpath By JavaScript    //div[contains(normalize-space(@title), '${destination_inventory}')]
    dps_pouch_page.Click Search Button On Filter

Select Filter Button
    ${dps_btn_filter}=    Replace String    ${dps_btn_filter_pouch_page}    {value}    ${dc_operation['button_filter']}
    common.Click When Ready    ${dps_btn_filter}

Click Search Button On Filter
    ${dps_btn_search_filter}=    Replace String    ${dps_btn_search_filter_pouch_page}    {value}    ${dc_operation['button_search']}
    common.Click When Ready    ${dps_btn_search_filter}

Click Close Pouch Button In Pouch Detail
    common.Click When Ready    //span[text()=' ปิด Pouch/Print Label']/..

Verify Close Pouch Confirmation Popup
    [Arguments]    ${close_pouch}
    ${dps_txt_close_pouch}=    Replace String    //div[@class='ant-modal-content']//div//h1[contains(normalize-space(), '{value}')]    {value}    ${close_pouch}
    Wait Until Element Is Visible    ${dps_txt_close_pouch}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_close_pouch}=    Get Text    ${dps_txt_close_pouch}
    Should Be Equal    ${actual_txt_close_pouch}    ${close_pouch}

Click Close Pouch Button In Popup
    common.Click When Ready    //div[@class='ant-modal-content']//span[text()='ปิด Pouch/Print Label']/..
