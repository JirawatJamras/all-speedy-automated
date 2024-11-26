*** Keywords ***
Verify Call Car Pick Up Page
    [Arguments]    ${title}
    ${b2c_txt_call_pickup}=  Replace String   ${b2c_txt_call_pickup_parcel_pickup_page}   {value}   ${title}
    Wait Until Element Is Not Visible    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_txt_call_pickup}    timeout=${DEFAULT_TIMEOUT}

Click Add Button
    common.Scroll Window To Vertical    0
    common.Click When Ready    ${b2c_btn_add_call_car_pickup_page}

Verify Popup Parcel Pickup Schedule
    [Arguments]    ${parcel_pickup_schedule}    ${car_round_name}    ${parcel_type}    ${parcel_pickup_date}
    ...    ${parcel_pickup_time}    ${save_button}    ${cancel_button}
    ${txt_parcel_pickup_schedule}=  Replace String   ${b2c_txt_parcel_pickup_schedule_in_add_popup}   {value}   ${parcel_pickup_schedule}
    ${txt_car_round_name}=  Replace String   ${b2c_txt_car_round_name_in_add_popup}   {value}   ${car_round_name}
    ${txt_parcel_type}=  Replace String   ${b2c_txt_parcel_type_in_add_popup}   {value}   ${parcel_type}
    ${txt_parcel_pickup_date}=  Replace String    ${b2c_txt_parcel_pickup_date_in_add_popup}    {value}   ${parcel_pickup_date}
    ${txt_parcel_pickup_time}=  Replace String    ${b2c_txt_parcel_pickup_time_in_add_popup}    {value}   ${parcel_pickup_time}
    ${btn_save}=  Replace String    ${b2c_btn_save_in_add_popup}    {value}   ${save_button}
    ${btn_cancel}=  Replace String    ${b2c_btn_cancel_in_add_popup}    {value}   ${cancel_button}

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
    [Arguments]    ${nextDay}
    ${selected_parcel_pickup_date}=  Replace String   ${b2c_cbo_parcel_pickup_date}   {value}   ${nextDay}
    common.Click When Ready    ${b2c_txtbox_parcel_pickup_date}
    common.Click When Ready    ${selected_parcel_pickup_date}

Select Parcel Pickup Time
    [Arguments]    ${time}
    ${selected_parcel_pickup_time}=  Replace String   ${b2c_cbo_parcel_pickup_time}   {value}   ${time}
    common.Click When Ready    ${b2c_txtbox_parcel_pickup_time}
    common.Click When Ready    ${selected_parcel_pickup_time}

Click Save Button
    ${b2c_btn_save_in_add_popup}=  Replace String   ${b2c_btn_save_in_add_popup}   {value}   ${call_car_pick_up['button_save']}
    common.Click When Ready    ${b2c_btn_save_in_add_popup}

Verify Parcel Pickup Status
    [Arguments]    ${status}    ${round}    ${tomorrow}    ${pickup_time}    ${today}
    ...    ${text_parcel_number}    ${parcel_num}    ${text_price}    ${price_value}    ${text_pickup_location}    ${company_address}
    ...    ${sub_district}    ${district}    ${province}    ${postcode}
    ${actual_status}=  Replace String   ${b2c_txt_parcel_pickup_round}    {status}    ${status}
    ${label_pickup_round}=  Replace String   ${actual_status}    {round}    ${round} ${tomorrow} ${pickup_time}
    ${label_pickup_date}=  Replace String   ${label_pickup_round}    {pickupdate}    ${call_car_pick_up['text_parcel_pickup_date']} 
    ${value_pickup_date}=  Replace String   ${label_pickup_date}    {value}    ${tomorrow}
    ${label_cut_off}=  Replace String   ${b2c_txt_cutoff_pickup_round}    {cutoff}    ${call_car_pick_up['text_cut_off_time']}
    ${value_cut_off}=  Replace String   ${label_cut_off}    {cutoff_value}    ${today}
    ${label_parcel}=  Replace String   ${value_cut_off}    {parcel}    ${text_parcel_number}
    ${value_parcel}=  Replace String   ${label_parcel}    {value}    ${parcel_num}
    ${label_price}=  Replace String   ${b2c_txt_location_pickup}    {price}    ${text_price}
    ${value_price}=  Replace String   ${label_price}    {price_value}    ${price_value}
    ${label_location}=  Replace String   ${value_price}    {location}    ${text_pickup_location}
    ${value_location}=  Replace String   ${label_location}    {location_value}    ${company_address} ${sub_district} ${district} ${province} ${postcode}
    Wait Until Element Is Visible    ${b2c_txt_complete_save_pickup_round}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_card_parcel_pickup_list}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${value_pickup_date}${value_parcel}${value_location}    timeout=${DEFAULT_TIMEOUT}

Search Parcel Pickup By Date
    [Arguments]    ${start_date}    ${end_date}
        ${button_filter}=  Replace String   ${b2c_btn_filter_pickup_round}    {value}    ${call_car_pick_up['button_filter']}
        ${button_search}=  Replace String   ${btn_btn_search_pickup_round}    {value}    ${call_car_pick_up['button_search']}
        Scroll Window To Vertical    0
        common.Click When Ready    ${button_filter}
        common.Input When Ready    ${input_parcel_pickup_date}    ${start_date}
        common.Input When Ready    ${input_parcel_pickup_end_date}    ${end_date}
        common.Click When Ready    ${button_search}
        common.Click When Ready    ${button_filter}

Verify Parcel Pickup Status After Cut Off Time
    [Arguments]    ${status}    ${tomorrow}    ${today}    ${booking_id}    ${round}    ${pickup_time}    ${parcel_num}
    ${button_confirm}=  Replace String   ${b2c_btn_confirm_close_popup}    {value}    ${call_car_pick_up['button_confirm']}
    ${actual_status}=  Replace String   ${b2c_txt_status_and_id_pickup_round}    {status}    ${status}
    ${actual_status_and_id}=  Replace String   ${actual_status}    {booking_id}    ${booking_id}

    ${actual_status}=  Replace String   ${b2c_txt_parcel_pickup_round}    {status}    ${status}
    ${label_pickup_round}=  Replace String   ${actual_status}    {round}    ${round} ${tomorrow} ${pickup_time}
    ${label_pickup_date}=  Replace String   ${label_pickup_round}    {pickupdate}    ${call_car_pick_up['text_parcel_pickup_date']}
    ${value_pickup_date}=  Replace String   ${label_pickup_date}    {value}    ${tomorrow}
    ${label_cut_off}=  Replace String   ${b2c_txt_cutoff_pickup_round}    {cutoff}    ${call_car_pick_up['text_cut_off_time']}
    ${value_cut_off}=  Replace String   ${label_cut_off}    {cutoff_value}    ${today}
    ${label_parcel}=  Replace String   ${value_cut_off}    {parcel}    ${call_car_pick_up['text_parcel_number']}
    ${value_parcel}=  Replace String   ${label_parcel}    {value}    ${parcel_num}
    ${card}=    Set Variable    ${value_pickup_date}${value_parcel}

    ${next_day}    Set Date Pattern    ${tomorrow}
    ${day}    Set Date Pattern    ${today}
    Register Keyword To Run On Failure    NOTHING
    ${status}=    Set Variable    FAIL
    ${status_2}=    Set Variable    False
    ${loop}=    Set Variable    0

    Wait Until Element Is Visible    ${b2c_card_parcel_pickup_list}    timeout=${DEFAULT_TIMEOUT}
    Search Parcel Pickup By Date    ${day}    ${next_day}

    WHILE    '${status_2}' == 'False'
        ${loop}=    Evaluate    ${loop} + 1
        Run Keyword If    ${loop} > 75    Fail    After 5 minutes of cut off time, the status has not changed.
        Scroll Window To Vertical    0
        Run Keyword And Ignore Error    Wait Until Element Is Visible    ${card}
        ${number}=    Get Element Count    ${card}
        FOR    ${index}    IN RANGE    1    ${number}+1
            Scroll Element Into View    (${card})[${index}]
            common.Click When Ready    (${card})[${index}]
            ${status}    ${element}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${actual_status_and_id}
            ${status_2}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${actual_status_and_id}
            Exit For Loop If    '${status}' == 'PASS'    
            common.Click When Ready    ${b2c_btn_x_in_add_popup}
            common.Click When Ready    ${button_confirm}
        END
        Exit For Loop If    '${status_2}' == 'True'
        Scroll Window To Vertical    1000
        ${nextpage}=    Get Element Attribute    ${b2c_next_page_pickup_round}    aria-disabled
        ${status_button}=    Run Keyword And Return Status    Should Be Equal As Strings    ${nextpage}    false
        Run Keyword If    '${status_button}' == 'False'    Run Keywords    
        ...    Reload Page
        ...    AND    Search Parcel Pickup By Date    ${day}    ${next_day}
        ...    ELSE    common.Click When Ready    ${b2c_btn_next_page_pickup_round}
    END
    Register Keyword To Run On Failure    Capture Page Screenshot
    common.Click When Ready    ${b2c_btn_x_in_add_popup}
    common.Click When Ready    ${button_confirm}

Verify Parcel Pickup Schedule Change Status To Confirm
    [Arguments]    ${status}    ${tomorrow}    ${today}    ${booking_id}    ${round}    ${pickup_time}    ${parcel_num}
    ${button_confirm}=  Replace String   ${b2c_btn_confirm_close_popup}    {value}    ${call_car_pick_up['button_confirm']}
    ${actual_status}=  Replace String   ${b2c_txt_status_and_id_pickup_round}    {status}    ${status}
    ${actual_status_and_id}=  Replace String   ${actual_status}    {booking_id}    ${booking_id}

    ${actual_status}=  Replace String   ${b2c_txt_parcel_pickup_round}    {status}    ${status}
    ${label_pickup_round}=  Replace String   ${actual_status}    {round}    ${round} ${tomorrow} ${pickup_time}
    ${label_pickup_date}=  Replace String   ${label_pickup_round}    {pickupdate}    ${call_car_pick_up['text_parcel_pickup_date']}
    ${value_pickup_date}=  Replace String   ${label_pickup_date}    {value}    ${tomorrow}
    ${label_cut_off}=  Replace String   ${b2c_txt_cutoff_pickup_round}    {cutoff}    ${call_car_pick_up['text_cut_off_time']}
    ${value_cut_off}=  Replace String   ${label_cut_off}    {cutoff_value}    ${today}
    ${label_parcel}=  Replace String   ${value_cut_off}    {parcel}    ${call_car_pick_up['text_parcel_number']}
    ${value_parcel}=  Replace String   ${label_parcel}    {value}    ${parcel_num}
    ${card}=    Set Variable    ${value_pickup_date}${value_parcel}

    ${next_day}    Set Date Pattern    ${tomorrow}
    ${day}    Set Date Pattern    ${today}
    Register Keyword To Run On Failure    NOTHING
    ${status}=    Set Variable    FAIL
    ${status_2}=    Set Variable    False

    Wait Until Element Is Visible    ${b2c_card_parcel_pickup_list}    timeout=${DEFAULT_TIMEOUT}
    Search Parcel Pickup By Date    ${day}    ${next_day}

    WHILE    '${status_2}' == 'False'
        Scroll Window To Vertical    0
        Run Keyword And Ignore Error    Wait Until Element Is Visible    ${card}
        ${number}=    Get Element Count    ${card}
        FOR    ${index}    IN RANGE    1    ${number}+1
            Scroll Element Into View    (${card})[${index}]
            common.Click When Ready    (${card})[${index}]
            ${status}    ${element}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${actual_status_and_id}
            ${status_2}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${actual_status_and_id}
            Exit For Loop If    '${status}' == 'PASS'    
            common.Click When Ready    ${b2c_btn_x_in_add_popup}
            common.Click When Ready    ${button_confirm}
        END
        Exit For Loop If    '${status_2}' == 'True'
        Scroll Window To Vertical    1000
        ${nextpage}=    Get Element Attribute    ${b2c_next_page_pickup_round}    aria-disabled
        ${status_button}=    Run Keyword And Return Status    Should Be Equal As Strings    ${nextpage}    false
        Run Keyword If    '${status_button}' == 'False'    Run Keywords    
        ...    Reload Page
        ...    AND    Search Parcel Pickup By Date    ${day}    ${next_day}
        ...    ELSE    common.Click When Ready    ${b2c_btn_next_page_pickup_round}
    END
    Register Keyword To Run On Failure    Capture Page Screenshot
    common.Click When Ready    ${b2c_btn_x_in_add_popup}
    common.Click When Ready    ${button_confirm}

Verify Parcel Pickup Canceled Status
    [Arguments]    ${round}    ${tomorrow}    ${pickup_time}    ${today}
    ...    ${text_parcel_number}    ${parcel_num}    ${text_price}    ${price_value}    ${text_pickup_location}    ${company_address}
    ...    ${sub_district}    ${district}    ${province}    ${postcode}
    ${actual_status}=  Replace String   ${b2c_txt_parcel_pickup_round}    {status}    ${call_car_pick_up.status['cancel']}
    ${label_pickup_round}=  Replace String   ${actual_status}    {round}    ${round} ${tomorrow} ${pickup_time}
    ${label_pickup_date}=  Replace String   ${label_pickup_round}    {pickupdate}    ${call_car_pick_up['text_parcel_pickup_date']} 
    ${value_pickup_date}=  Replace String   ${label_pickup_date}    {value}    ${tomorrow}
    ${label_cut_off}=  Replace String   ${b2c_txt_cutoff_pickup_round}    {cutoff}    ${call_car_pick_up['text_cut_off_time']}
    ${value_cut_off}=  Replace String   ${label_cut_off}    {cutoff_value}    ${today}
    ${label_parcel}=  Replace String   ${value_cut_off}    {parcel}    ${text_parcel_number}
    ${value_parcel}=  Replace String   ${label_parcel}    {value}    ${parcel_num}
    ${label_price}=  Replace String   ${b2c_txt_location_pickup}    {price}    ${text_price}
    ${value_price}=  Replace String   ${label_price}    {price_value}    ${price_value}
    ${label_location}=  Replace String   ${value_price}    {location}    ${text_pickup_location}
    ${value_location}=  Replace String   ${label_location}    {location_value}    ${company_address} ${sub_district} ${district} ${province} ${postcode}
    ${next_day}    Set Date Pattern    ${tomorrow}
    ${day}    Set Date Pattern    ${today}
    Wait Until Element Is Visible    ${b2c_card_parcel_pickup_list}    timeout=${DEFAULT_TIMEOUT}
    Search Parcel Pickup By Date    ${day}    ${next_day}
    Wait Until Element Is Visible    ${b2c_card_parcel_pickup_list}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${value_pickup_date}${value_parcel}${value_location}    timeout=${DEFAULT_TIMEOUT}

################# OLD ###################
Verify Car Round Name Dropdown Was Disabled
    Element Should Be Disabled    ${b2c_cbo_car_round_name_call_car_pickup_page}

Click Parcel Type Dropdown
    ${b2c_btn_basic_parcel_type}=    Replace String    ${b2c_btn_basic_parcel_type_car_pickup_page}    {value}    ${call_car_pick_up['text_parcel_type']}
    common.Click When Ready      ${b2c_btn_basic_parcel_type}

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
    ${b2c_cbo_pickup_parcel_date_in_add_popup}=    Replace String    ${b2c_cbo_pickup_parcel_date_in_add_popup}    {value}    ${call_car_pick_up['text_parcel_pickup_date']}
    common.Click When Ready    ${b2c_cbo_pickup_parcel_date_in_add_popup}

Select Date Pickup Parcel Future Date
    ${b2c_tbl_pickup_parcel_calendar}=    Replace String    ${b2c_tbl_pickup_parcel_calendar}    {value}    ${newDate}
    FOR    ${i}    IN RANGE    0    5
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible   ${b2c_tbl_pickup_parcel_calendar}    timeout=${DEFAULT_TIMEOUT}
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
        common.Click When Ready    ${btn_next_months_calendar_in_add_popup}
    END
    common.Click When Ready    ${b2c_tbl_pickup_parcel_calendar}

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
    ${b2c_cbo_pickup_parcel_time_in_add_popup}=    Replace String    ${b2c_cbo_pickup_parcel_time_in_add_popup}    {value}    ${call_car_pick_up['text_parcel_pickup_time']}
    common.Click When Ready    ${b2c_cbo_pickup_parcel_time_in_add_popup}

Select Pickup Parcel Time
    [Arguments]    ${time}
    ${b2c_cbo_time_pickup}=    Replace String    ${b2c_cbo_time_pickup}    {value}    ${time}
    common.Click When Ready    ${b2c_cbo_time_pickup}

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
    Wait Until Element Is Visible    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}
    Element Should Contain    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}    ${newDate}

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
    Wait Until Element Is Visible    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}
    Element Should Not Contain    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}    ${newDate}

Get The Highest Displayed Date And Set New Highest Date
    Wait Until Element Is Visible    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}
    Wait Until Element Is Visible    ${txt_parcel_pickup_schedule}    timeout=${DEFAULT_TIMEOUT}
    ${titleName}=    Get Text    ${txt_parcel_pickup_schedule} 
    ${highestDisplayedDate}=    Split String And Select    ${titleName}    ${SPACE}    1
    ${newDate}=    Convert Date    ${highestDisplayedDate}    date_format=%d-%m-%Y    result_format=%Y-%m-%d
    ${tomorrow_day}=    Add Time To Date    ${newDate}    1 days    result_format=%d-%m-%Y
    Set Suite Variable    ${newDate}    ${tomorrow_day}

Get The Highest Displayed Date And Set New Highest Date 2
    # Wait Until Element Is Visible    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}
    # ${titleName}=    Get Text    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}//div[@class='ant-card-meta-title']//h5
    ${titleName}=    Set Variable    รอบปกติ 31-10-2567 16:00:00 - 19:00 น.    
    ${highestDisplayedDate}=    Split String And Select    ${titleName}    ${SPACE}    1
    ${date} =    Add Time To Date    ${highestDisplayedDate}    1 days    date_format=%d-%m-%Y    result_format=%d-%m-%Y
    Log    ${date}

Delete The Lastest Parcel Pickup Schedule
    [Arguments]    ${current_date}    ${current_time}
    ${btn_delete_car_round}=    Replace String    ${b2c_btn_delete_car_round_car_pickup_page}    {date}    ${current_date}
    ${btn_delete_car_round}=    Replace String    ${btn_delete_car_round}    {time}    ${current_time}
    ${b2c_btn_confirm_in_asking_to_close_popup}=    Replace String    ${b2c_btn_confirm_in_asking_to_close_popup}    {value}    ${Booking['text_confirm_popup']}
    Wait Until Element Is Visible    ${btn_delete_car_round}    timeout=${DEFAULT_TIMEOUT}
    Click Element    ${btn_delete_car_round}
    Wait Until Element Is Visible    ${b2c_btn_confirm_in_asking_to_close_popup}    timeout=${DEFAULT_TIMEOUT}
    Click Element    ${b2c_btn_confirm_in_asking_to_close_popup}
    Wait Until Element Is Visible    ${b2c_txt_delete_complete_pickup_page}    timeout=${DEFAULT_TIMEOUT}

Go To Call Car Pickup Menu And Delete The Lastest Parcel Pickup Schedule
    [Arguments]    ${current_date}    ${current_time}
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    Delete The Lastest Parcel Pickup Schedule    ${current_date}    ${current_time}
    
Click Select Item On Parcel Pickup Schedule List
    common.Click When Ready    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}

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
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Not Visible    ${b2c_txt_pickup_date_in_filter}    timeout=${DEFAULT_TIMEOUT}
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
    END

Verify Open Filter Section
    Wait Until Element Is Visible    ${b2c_txt_pickup_date_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_search_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}    timeout=${DEFAULT_TIMEOUT}

Verify Close Filter Section
    Wait Until Element Is Not Visible    ${b2c_txt_pickup_date_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${b2c_btn_search_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}    timeout=${DEFAULT_TIMEOUT}

Verify Added New Car Pickup Schedule
    [Arguments]    ${parcel_type}    ${special_round}    ${pickup_date}    ${pickup_time_title}    ${pickup_time_detail}    ${pickup_point}
    ${cut_off_date}=    Get Cut Off Date From Value    ${pickup_date}
    Wait Until Element Is Visible    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}    timeout=${DEFAULT_TIMEOUT}
    common.Scroll Window To Vertical    0
    ${actual_info_new_pickup_card}=    Get Text    ${b2c_card_pickup_parcel_schedule_call_car_pickup_page}
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

Get Normal Parcel Pickup Date
    Wait Until Element Is Visible    ${img_parcel_in_card}    timeout=${DEFAULT_TIMEOUT}
    ${card_first_normal_parcel}=    Replace String    ${card_first_normal_parcel_pickup_list}    {title}    ${call_car_pick_up.car_round_name['normal']}
    ${card_first_normal_parcel}=    Replace String    ${card_first_normal_parcel}    {number_of_parcel}    ${Booking_S048['parcel_number']}
    Scroll Element Into View    ${b2c_btn_last_page_car_pickup_page}
    common.Click When Ready    ${b2c_btn_last_page_car_pickup_page}
    Wait Until Element Is Visible    ${img_parcel_in_card}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${card_first_normal_parcel}
    ${txt_normal_parcel_pickup_schedule}=    Replace String    ${txt_normal_parcel_pickup_schedule}    {value}    ${call_car_pick_up.car_round_name['normal']}
    ${titleName}=    Get Text    ${txt_normal_parcel_pickup_schedule} 
    ${highestDisplayedDate}=    Split String And Select    ${titleName}    ${SPACE}    1
    ${parts}=    Split String    ${highestDisplayedDate}    -
    ${day}=    Set Variable    ${parts}[0]
    ${month}=    Set Variable    ${parts}[1]
    ${year}=    Set Variable    ${parts}[2]
    ${day}=    Convert To Integer    ${day}
    ${day_str}=    Convert To String    ${day}
    ${digit}=    Get Length    ${day_str}
    IF    '${digit}' == '1'
        ${day_str}=    Set Variable    0${day_str}
    END
    ${newDate}=    Set Variable    ${day_str}-${month}-${year}
    RETURN    ${newDate}

Verify Car Pickup Schedule Card
    [Arguments]    ${booking_stauts}    ${car_round}    ${pickup_date}    ${pickup_time_title}    ${pickup_time_detail}    ${pickup_point}
    ${cut_off_date}=    Get Cut Off Date From Value    ${pickup_date}
    ${card_first_normal_parcel}=    Replace String    ${card_first_normal_parcel_pickup_list}    {title}    ${car_round}
    ${card_first_normal_parcel}=    Replace String    ${card_first_normal_parcel}    {number_of_parcel}    ${Booking_S048['parcel_number']}
    Scroll Element Into View    ${card_first_normal_parcel}
    Wait Until Element Is Visible    ${card_first_normal_parcel}    timeout=${DEFAULT_TIMEOUT}
    ${actual_info_new_pickup_card}=    Get Text    ${card_first_normal_parcel}
    ${actual_info_new_pickup_card}=    Replace String   ${actual_info_new_pickup_card}   \n   ${SPACE}
    Should Be Equal As Strings    ${actual_info_new_pickup_card}    ${car_round} ${pickup_date} ${pickup_time_title} น. วันที่รถเข้ารับพัสดุ: ${pickup_date} ${pickup_time_detail}น. เวลา Cut Off รอบรถ: ${cut_off_date} ${Booking.pickup_schedule.default['cut_off_time']} จำนวนพัสดุ: ${Booking_S048['parcel_number']} ราคา: 0 บาท จุดรับพัสดุ: ${pickup_point} ${booking_stauts}