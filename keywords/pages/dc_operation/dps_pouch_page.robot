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

Verify Pouch Detail Popup
    //span[text()='หมายเลข POUCH']/..//span[2]
    //span[text()='คลัง Crossdock']/..//span[2]
    //span[text()='สถานะ Pouch']/..//div
    //span[text()='จำนวนพัสดุ']/..//span[2]
    //span[text()='คลังต้นทาง']/..//span[2]
    //span[text()='คลังปลายทาง']/..//span[2]

    //div[@class='print-section ']//h1