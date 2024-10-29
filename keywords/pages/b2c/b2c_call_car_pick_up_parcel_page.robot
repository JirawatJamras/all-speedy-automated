*** Keywords ***
Verify Call Car Pick Up Page
    [Arguments]    ${title}
    ${b2c_txt_call_pickup_parcel_pickup_page}=  Replace String   ${b2c_txt_call_pickup_parcel_pickup_page}   {value}   ${title}
    Wait Until Element Is Not Visible    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_txt_call_pickup_parcel_pickup_page}    timeout=${DEFAULT_TIMEOUT}

Click Add Button
    common.Click When Ready    ${b2c_btn_add_call_car_pickup_page}

Verify Popup Parcel Pickup Schedule
    [Arguments]    ${parcel_pickup_schedule}    ${car_round_name}    ${parcel_type}    ${parcel_pickup_date}
    ...    ${parcel_pickup_time}    ${save_button}    ${cancel_button}
    ${txt_parcel_pickup_schedule}=  Replace String   ${b2c_txt_parcel_pickup_schedule_in_add_popup}   {value}   ${parcel_pickup_schedule}
    ${txt_car_round_name}=  Replace String   ${b2c_txt_car_round_name_in_add_popup}   {value}   ${car_round_name}
    ${txt_parcel_type}=  Replace String   ${b2c_txt_parcel_type_in_add_popup}   {value}   ${parcel_type}
    ${txt_parcel_pickup_date}=  Replace String    ${b2c_txt_parcel_pickup_date_in_add_popup}    {value}   ${parcel_pickup_date}
    ${txt_parcel_pickup_time}=  Replace String    ${b2c_txt_parcel_pickup_time_in_add_popup}    {value}   ${parcel_pickup_time}
    ${btn_save}=  Replace String    ${btn_save_in_add_popup}    {value}   ${save_button}
    ${btn_cancel}=  Replace String    ${btn_cancel_in_add_popup}    {value}   ${cancel_button}

    Wait Until Element Is Visible    ${txt_parcel_pickup_schedule}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_car_round_name}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_parcel_type}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_parcel_pickup_date}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_parcel_pickup_time}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${btn_save}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${btn_cancel}    timeout=${DEFAULT_TIMEOUT}

Select Parcel Type
    [Arguments]    ${value}
    ${selected_parcel_type}=  Replace String   ${b2c_cbo_parcel_type}   {value}   ${value}
    common.Click When Ready    ${b2c_txtbox_parcel_type}
    common.Click When Ready    ${selected_parcel_type}

Select Parcel Pickup Date
    ${nextDay}    dps_home_page.Set_Next_DAY
    ${selected_parcel_pickup_date}=  Replace String   ${b2c_cbo_parcel_pickup_date}   {value}   ${nextDay}
    common.Click When Ready    ${b2c_txtbox_parcel_pickup_date}
    common.Click When Ready    ${selected_parcel_pickup_date}

Select Parcel Pickup Time
    [Arguments]    ${time}
    ${selected_parcel_pickup_time}=  Replace String   ${b2c_cbo_parcel_pickup_time}   {value}   ${time}
    common.Click When Ready    ${b2c_txtbox_parcel_pickup_time}
    common.Click When Ready    ${selected_parcel_pickup_time}

Click Save Button
    ${btn_save_in_add_popup}=  Replace String   ${btn_save_in_add_popup}   {value}   ${call_car_pick_up['button_save']}
    common.Click When Ready    ${btn_save_in_add_popup}

Verify Add Special Pickup Round Success
    [Arguments]    ${text_special}    ${text_pickup_time}
    ${nextDay}    dps_home_page.Set_Next_DAY
    ${heading_card_special_round}=  Replace String   ${b2c_txt_parcel_pickup_round}   {value}   ${text_special} ${nextDay} ${text_pickup_time}
    ## เหลือ verify detail
    Wait Until Element Is Visible    ${b2c_txt_complete_save_pickup_round}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_card_parcel_pickup_list}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${b2c_img_loading}    timeout=40s
    Wait Until Element Is Visible    ${heading_card_special_round}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${heading_card_special_round}

################# OLD ###################
Verify Car Round Name Dropdown Was Disabled
    Element Should Be Disabled    ${b2c_cbo_car_round_name_call_car_pickup_page}

Click Parcel Type Dropdown
    ${btn_basic_parcel_type_car_pickup_page}=    Replace String    ${btn_basic_parcel_type_car_pickup_page}    {value}    ${call_car_pick_up['text_parcel_type']}
    common.Click When Ready      ${btn_basic_parcel_type_car_pickup_page}

Select Parcel Type Dropdown
    [Arguments]    ${parcel_type}
    ${b2c_cbo_parcel_type}=    Replace String    ${b2c_cbo_parcel_type}    {value}    ${parcel_type}
    common.Click When Ready    ${b2c_cbo_parcel_type}

Verify Unselected Parcel Type In Dropdown
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_cbo_parcel_type_call_car_pickup_page}    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${b2c_cbo_parcel_type_call_car_pickup_page}    ${value}

Verify Select Parcel Type In Dropdown
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_cbo_parcel_type_call_car_pickup_page}    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${b2c_cbo_parcel_type_call_car_pickup_page}    ${value}

Verify Unselected Date Pickup Parcel
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_btn_placeholder_date_pickup_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    ${placeholder}=    Get Element Attribute    ${b2c_btn_placeholder_date_pickup_in_add_popup}    placeholder
    Should Be Equal    ${placeholder}    ${value}

Click Pickup Parcel Date Button
    ${cbo_pickup_parcel_date_in_add_popup}=    Replace String    ${cbo_pickup_parcel_date_in_add_popup}    {value}    ${call_car_pick_up['text_parcel_pickup_date']}
    common.Click When Ready    ${cbo_pickup_parcel_date_in_add_popup}

Select Date Pickup Parcel Future Date
    ${tbl_pickup_parcel_calendar}=    Replace String    ${tbl_pickup_parcel_calendar}    {value}    ${newDate}
    FOR    ${i}    IN RANGE    0    5
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible   ${tbl_pickup_parcel_calendar}    timeout=2s
        Log    ${tbl_pickup_parcel_calendar}
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
        common.Click When Ready    ${btn_next_months_calendar_in_add_popup}
    END
    common.Click When Ready    ${tbl_pickup_parcel_calendar}

Verify Selected Date Pickup Parcel Future Date
    Wait Until Element Is Visible    ${cbo_pickup_parcel_date_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    ${cbo_pickup_parcel_date_in_add_popup}=    Replace String    ${cbo_pickup_parcel_date_in_add_popup}    {value}    ${call_car_pick_up['text_parcel_pickup_date']}
    ${value}=    Get Element Attribute    ${cbo_pickup_parcel_date_in_add_popup}    value
    Should Be Equal    ${value}    ${newDate}

Select Date Pickup Parcel Previouse Date
    ${cbo_pickup_parcel_date_in_add_popup}=    Replace String    ${cbo_pickup_parcel_date_in_add_popup}    {value}    ${call_car_pick_up['text_parcel_pickup_date']}
    FOR    ${i}    IN RANGE    0    5
        common.Click When Ready    ${cbo_pickup_parcel_date_in_add_popup}
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible   ${b2c_txt_parcel_pickup_schedule}    timeout=2s
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
    END
    ${canClick}    Run Keyword And Return Status    common.Click When Ready    ${b2c_btn_previous_date_in_add_popup}
    Should Not Be True    ${canClick}

Verify Date Pickup Parcel Can Not Be Select Previouse Date
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_tbl_pickup_parcel_calendar_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    common.Click When Ready    ${b2c_txt_pickup_parcel_date_in_add_popup}
    Verify Unselected Date Pickup Parcel    ${value}
 
Click Pickup Parcel Time Button
    ${cbo_pickup_parcel_time_in_add_popup}=    Replace String    ${cbo_pickup_parcel_time_in_add_popup}    {value}    ${call_car_pick_up['text_parcel_pickup_time']}
    common.Click When Ready    ${cbo_pickup_parcel_time_in_add_popup}

Select Pickup Parcel Time
    [Arguments]    ${time}
    ${cbo_time_pickup}=    Replace String    ${cbo_time_pickup}    {value}    ${time}
    common.Click When Ready    ${cbo_time_pickup}

Verify Selected Pickup Parcel Time
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    ${value}

Verify Unselected Pickup Parcel Time
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    ${defaultValue}=    Get Text    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}
    Should Be Equal    ${defaultValue}    ${value}

Click Clear Pickup Parcel Time Button
    Click Xpath By JavaScript    //strong[text()='เวลารถเข้ารับพัสดุ']/../../../..//span[@class='ant-select-clear']

Edit Pickup Parcel Time
    [Arguments]    ${value}
    common.Click When Ready    ${b2c_cdo_pickup_parcel_time_in_add_popup}
    ${caninput}=    Run Keyword And Return Status    Input Text    ${b2c_cdo_2_pickup_parcel_time_in_add_popup}    ${value}
    Should Not Be True    ${caninput}
    common.Click When Ready    ${b2c_cdo_pickup_parcel_time_in_add_popup}

Verify Can Not Edit Pickup Parcel Time
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    Element Should Not Contain    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    ${value}

Verify Saved Popup Is Visible
    Wait Until Element Is Visible    ${b2c_txt_complete_save_information_car_pickup_page}

Verify Saved Information In Visible In List
    [Arguments]    ${data}
    Wait Until Element Is Visible    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]
    Element Should Contain    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]    ${newDate}

Click Cancel Button On Parcel Pickup Schedule Popup
    common.Click When Ready    ${b2c_btn_cancel_in_add_popup}

Verify Asking Popup To Close Popup
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${b2c_txt_asking_to_close_popup_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${b2c_txt_asking_to_close_popup_in_add_popup}    ${text}
    Wait Until Element Is Visible    ${b2c_btn_cancel_in_asking_to_close_popup}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_confirm_in_asking_to_close_popup}

Click X Button On Parcel Pickup Schedule Popup
    common.Click When Ready    ${b2c_btn_x_in_add_popup}

Click Confirm To Close Parcel Pickup Schedule Popup Button
    common.Click When Ready    ${b2c_btn_confirm_in_asking_to_close_popup}

Verify Website Never Save Sender Information
    [Arguments]    ${data}
    Wait Until Element Is Visible    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]
    Element Should Not Contain    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]    ${newDate}

Get The Highest Displayed Date And Set New Highest Date
    Wait Until Element Is Visible    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]
    ${titleName}=    Get Text    ${txt_parcel_pickup_schedule} 
    ${highestDisplayedDate}=    Split String And Select    ${titleName}    ${SPACE}    1
    ${parts}=    Split String    ${highestDisplayedDate}    -
    ${day}=    Set Variable    ${parts}[0]
    ${month}=    Set Variable    ${parts}[1]
    ${year}=    Set Variable    ${parts}[2]
    ${day}=    Convert To Integer    ${day}
    ${nextDay}=    Evaluate    ${day} + 1
    ${day}    Convert To String    ${nextDay}
    ${digit}=     Get Length    ${day}
    IF    '${digit}' == '1'
        ${day}=    Set Variable    0${day}
    END
    ${newDate}=    Set Variable    ${day}-${month}-${year}
    Set Suite Variable    ${newDate}    ${newDate}

Get The Highest Displayed Date And Set New Highest Date 2
    # Wait Until Element Is Visible    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]
    # ${titleName}=    Get Text    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]//div[@class='ant-card-meta-title']//h5
    ${titleName}=    Set Variable    รอบปกติ 31-10-2567 16:00:00 - 19:00 น.    
    ${highestDisplayedDate}=    Split String And Select    ${titleName}    ${SPACE}    1
    ${date} =    Add Time To Date    ${highestDisplayedDate}    1 days    date_format=%d-%m-%Y    result_format=%d-%m-%Y
    Log    ${date}

Delete The Lastest Parcel Pickup Schedule
    common.Click When Ready    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]//span[@aria-label='delete']
    common.Click When Ready    //button[text()=' ยืนยัน']
    Wait Until Element Is Visible    ${b2c_txt_delete_complete_pickup_page}    timeout=${DEFAULT_TIMEOUT}

Go To Call Car Pickup Menu And Delete The Lastest Parcel Pickup Schedule
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    Delete The Lastest Parcel Pickup Schedule
    
Click Select Item On Parcel Pickup Schedule List
    common.Click When Ready    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]

Verify Information Detail Popup of Parcel Pickup Schedule
    Wait Until Element Is Visible    ${b2c_txt_pickup_parcel_schedule_in_detail_popup}    timeout=${DEFAULT_TIMEOUT}

Verify Information Detail Popup of Select Pickup Booking List
    Wait Until Element Is Visible    ${b2c_txt_select_pickup_booking_list_in_detail_popup}    timeout=${DEFAULT_TIMEOUT}

Verify Pickup Parcel Schedule Page
    Wait Until Element Is Visible    ${b2c_txt_call_pickup_parcel_pickup_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_txt_pickup_parcel_schedule_pickup_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_add_call_car_pickup_page}    timeout=${DEFAULT_TIMEOUT}

Click Open Filter
    common.Click When Ready    ${b2c_btc_filter_pickup_page}
   
Click Close Filter
    FOR    ${i}    IN RANGE    0    5
        common.Click When Ready    ${b2c_btc_filter_pickup_page}
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Not Visible    ${b2c_txt_pickup_date_in_filter}    timeout=2s
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
    END

Verify Open Filter Section
    Wait Until Element Is Visible    ${b2c_txt_pickup_date_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_search_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]    timeout=${DEFAULT_TIMEOUT}

Verify Close Filter Section
    Wait Until Element Is Not Visible    ${b2c_txt_pickup_date_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${b2c_btn_search_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]    timeout=${DEFAULT_TIMEOUT}

Verify Added New Car Pickup Schedule
    [Arguments]    ${parcel_type}    ${special_round}    ${pickup_date}    ${pickup_time_title}    ${pickup_time_detail}    ${pickup_point}
    ${cut_off_date}=    Get Cut Off Date From Value    ${pickup_date}
    Wait Until Element Is Visible    ${card_frist_parcel_pickup_list}
    ${actual_info_new_pickup_card}=    Get Text    ${card_frist_parcel_pickup_list}
    ${actual_info_new_pickup_card}=    Replace String   ${actual_info_new_pickup_card}   \n   ${SPACE}
    Run Keyword If    '${parcel_type}' == 'พัสดุทั่วไป (Dry)'    Element Should Be Visible   ${img_dry_parcel}
    Run Keyword If    '${parcel_type}' == 'พัสดุควบคุมอุณหภูมิ'    Element Should Be Visible   ${img_dry_parcel}
    Should Be Equal As Strings    ${actual_info_new_pickup_card}    ${special_round} ${pickup_date} ${pickup_time_title} น. วันที่รถเข้ารับพัสดุ: ${pickup_date} ${pickup_time_detail}น. เวลา Cut Off รอบรถ: ${cut_off_date} ${call_car_pick_up['cut_off_time']} จำนวนพัสดุ: 0 รายการ ราคา: 0 บาท จุดรับพัสดุ: ${pickup_point}

Get Cut Off Date From Value
    [Arguments]    ${date}
    ${parts}=    Split String    ${date}    -
    ${day}=    Set Variable    ${parts}[0]
    ${month}=    Set Variable    ${parts}[1]
    ${year}=    Set Variable    ${parts}[2]
    ${day}=    Convert To Integer    ${day}
    ${nextDay}=    Evaluate    ${day} - 1
    ${day}    Convert To String    ${nextDay}
    ${digit}=     Get Length    ${day}
    IF    '${digit}' == '1'
        ${day}=    Set Variable    0${day}
    END
    ${cut_off_date}=    Set Variable    ${day}-${month}-${year}
    RETURN    ${cut_off_date}

Get Date Parcel Pickup
    Wait Until Element Is Visible    ${card_frist_parcel_pickup_list}
    ${titleName}=    Get Text    ${txt_parcel_pickup_schedule} 
    ${highestDisplayedDate}=    Split String And Select    ${titleName}    ${SPACE}    1
    ${parts}=    Split String    ${highestDisplayedDate}    -
    ${day}=    Set Variable    ${parts}[0]
    ${month}=    Set Variable    ${parts}[1]
    ${year}=    Set Variable    ${parts}[2]
    ${day}=    Convert To Integer    ${day}
    ${digit}=     Get Length    ${day}
    IF    '${digit}' == '1'
        ${day}=    Set Variable    0${day}
    END
    ${newDate}=    Set Variable    ${day}-${month}-${year}
    RETURN   ${newDate}

Verify Car Pickup Schedule Card
    [Arguments]    ${special_round}    ${pickup_date}    ${pickup_time_title}    ${pickup_time_detail}    ${pickup_point}
    ${cut_off_date}=    Get Cut Off Date From Value    ${pickup_date}
    Wait Until Element Is Visible    ${card_frist_parcel_pickup_list}
    ${actual_info_new_pickup_card}=    Get Text    ${card_frist_parcel_pickup_list}
    ${actual_info_new_pickup_card}=    Replace String   ${actual_info_new_pickup_card}   \n   ${SPACE}
    Should Be Equal As Strings    ${actual_info_new_pickup_card}    ${special_round} ${pickup_date} ${pickup_time_title} น. วันที่รถเข้ารับพัสดุ: ${pickup_date} ${pickup_time_detail}น. เวลา Cut Off รอบรถ: ${cut_off_date} ${call_car_pick_up['cut_off_time']} จำนวนพัสดุ: ${call_car_pick_up.default['parcel_number']} รายการ ราคา: 0 บาท จุดรับพัสดุ: ${pickup_point}