*** Keywords ***
Proceed Pouch By Pouch Number
    [Arguments]    ${pouch_number}
    common.Click When Ready    //td[text()='${pouch_number}']/..//td[7]//img/..

Click Print Pouch Label
    common.Scroll Into View By Xpath    ${dps_btn_print_pouch_label_pouch_detail_page}    true
    common.Click When Ready    ${dps_btn_print_pouch_label_pouch_detail_page}
    Sleep    5s

Verify Pouch In Pouch Page
    [Arguments]    ${pouch_number}    ${inventory_crossdock}    ${destination_inventory}
    ...    ${parcel_amount}    ${status}    ${update_date}    ${pencil_icon}
    ${checked}=    Set Variable If    '${status}' == 'On'    true    false
    ${dps_txt_pouch_in_pouch_list}=    Replace String    ${dps_txt_pouch_in_pouch_list}    {pouch_number}    ${pouch_number}
    ${dps_txt_pouch_in_pouch_list}=    Replace String    ${dps_txt_pouch_in_pouch_list}    {inventory_crossdock}    ${inventory_crossdock}
    ${dps_txt_pouch_in_pouch_list}=    Replace String    ${dps_txt_pouch_in_pouch_list}    {destination_inventory}    ${destination_inventory}
    ${dps_txt_pouch_in_pouch_list}=    Replace String    ${dps_txt_pouch_in_pouch_list}    {parcel_amount}    ${parcel_amount}
    ${dps_txt_pouch_in_pouch_list}=    Replace String    ${dps_txt_pouch_in_pouch_list}    {checked}    ${checked}
    ${dps_txt_pouch_in_pouch_list}=    Replace String    ${dps_txt_pouch_in_pouch_list}    {update_date}    ${update_date}
    ${dps_img_pencil_in_pouch_in_pouch_list}=    Replace String    ${dps_img_pencil_in_pouch_in_pouch_list}    {pouch_number}    ${pouch_number}
    ${dps_img_pencil_in_pouch_in_pouch_list}=    Replace String    ${dps_img_pencil_in_pouch_in_pouch_list}    {inventory_crossdock}    ${inventory_crossdock}
    ${dps_img_pencil_in_pouch_in_pouch_list}=    Replace String    ${dps_img_pencil_in_pouch_in_pouch_list}    {destination_inventory}    ${destination_inventory}
    ${dps_img_pencil_in_pouch_in_pouch_list}=    Replace String    ${dps_img_pencil_in_pouch_in_pouch_list}    {parcel_amount}    ${parcel_amount}
    ${dps_img_pencil_in_pouch_in_pouch_list}=    Replace String    ${dps_img_pencil_in_pouch_in_pouch_list}    {checked}    ${checked}
    ${dps_img_pencil_in_pouch_in_pouch_list}=    Replace String    ${dps_img_pencil_in_pouch_in_pouch_list}    {update_date}    ${update_date}
    Wait Until Element Is Visible    ${dps_txt_pouch_in_pouch_list}    timeout=5s
    Run Keyword IF    '${pencil_icon}' == 'ไอคอนรูปดินสอ'    Page Should Contain Element    ${dps_img_pencil_in_pouch_in_pouch_list}

# Verify Pouch Detail Popup
#     //span[text()='หมายเลข POUCH']/..//span[2]
#     //span[text()='คลัง Crossdock']/..//span[2]
#     //span[text()='สถานะ Pouch']/..//div
#     //span[text()='จำนวนพัสดุ']/..//span[2]
#     //span[text()='คลังต้นทาง']/..//span[2]
#     //span[text()='คลังปลายทาง']/..//span[2]
#     //div[@class='print-section ']//h1

Click Dropdown Select Warehouse List
    [Arguments]    ${selected_warehouse}
    ${name}=    Get Text    ${dps_txt_dropdown_warehouse_tab_home_page}
    ${button_selected_warehouse_list}=    Replace String    ${dps_btn_selected_warehouse_list_home_page}    {value}    ${name}
    common.Click When Ready    ${button_selected_warehouse_list}
    ${selected_warehouse_list}=    Replace String    ${dps_cbo_warehouse_parcel_pickup}    {value}    ${selected_warehouse}
    common.Click When Ready    ${selected_warehouse_list}

Verify Navigate To Pouch Page Success
    ${dps_txt_title_pouch_pouch_page}=    Replace String    ${dps_txt_title_pouch_pouch_page}    {value}    ${dc_operation.title['pouch']}
    Wait Until Element Is Visible    ${dps_txt_title_pouch_pouch_page}    timeout=${DEFAULT_TIMEOUT}

Check Open Pouch And Close Pouch By Destination Inventory
    [Arguments]    ${destination_inventory}    ${testcase_name}
    Filter Data By Destination Inventory [Pouch Page]    ${destination_inventory}
    ${count}=    Get Element Count    //td[text()='${destination_inventory}']/..//td[5]//button[@aria-checked='true']
    IF  '${count}' != '0'
        FOR    ${index}    IN RANGE    1    ${count}+1
            Log    Step No. 4 ปิด Pouch ที่มีปลายทางเป็น DC SB (ทำทีละรายการจนหมด)
            Click On/OFF Button Of Pouch List    ${destination_inventory}    ${index}
            # Expected
            Verify Warning Confirm To Close Pouch
            common.Verify Capture Screenshot    dc_operation    ${testcase_name}    Verify Warning Confirm To Close Pouch On Checking Pouch Step
            Log    Step No.5 คลิกปุ่ม ปิด Pouch/Print Label
            Click Close Pouch/Print Label Btton On Warning Popup
            Log    Step No.6 คลิกปุ่มพิมพ์
            Sleep    5s
            Click ESC On Keyboard
            # Expected
            Verify Transaction Complete Popup
            common.Verify Capture Screenshot    dc_operation    ${testcase_name}    Verify Transaction Complete Popup On Checking Pouch Step
            Log    Step No.7 กดปุ่ม x
            CLick Close Button
            # Expected
            Verify Transaction Complete Popup Was Closed
            common.Verify Capture Screenshot    dc_operation    ${testcase_name}   Verify Transaction Complete Popup Was Closed On Checking Pouch Step
        END
    END

Click On/OFF Button Of Pouch List
    [Arguments]    ${destination_inventory}    ${index}
    common.Scroll Into View By Xpath    (//td[text()='${destination_inventory}']/..//td[5]//button[@aria-checked='true'])[${index}]    true
    common.Click When Ready    (//td[text()='${destination_inventory}']/..//td[5]//button[@aria-checked='true'])[${index}]

Verify Warning Confirm To Close Pouch
    ${dps_txt_warning_confirm_to_close_pouch}=    Replace String    ${dps_txt_warning_confirm_to_close_pouch}    {value}    ${dc_operation['text_warning_confirm_to_close_pouch']}
    Wait Until Element Is Visible    ${dps_txt_warning_confirm_to_close_pouch}    timeout=10s

Click Close Pouch/Print Label Btton On Warning Popup
    ${dps_btn_close_pouch_and_print_label_on_warning_popup}=    Replace String    ${dps_btn_close_pouch_and_print_label_on_warning_popup}    {value}    ${dc_operation['text_close_pouch_and_print_label']}
    common.Click When Ready    ${dps_btn_close_pouch_and_print_label_on_warning_popup}

Verify Transaction Complete Popup
    ${dps_txt_transaction_complete_popup}=    Replace String    ${dps_txt_transaction_complete_popup}    {value}    ${dc_operation['text_transaction_complete']}
    Wait Until Element Is Visible    ${dps_txt_transaction_complete_popup}    timeout=${DEFAULT_TIMEOUT}

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