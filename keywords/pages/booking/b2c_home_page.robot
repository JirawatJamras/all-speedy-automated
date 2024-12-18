*** Keywords ***
Click Book Parcel Delivery
    ${btn} =  Replace String    ${b2c_mnu_book_parcel_delivery_home_page}    {value}    ${Booking['text_menu_booking']}
    Wait Until Element Is Enabled    ${btn}    timeout=${DEFAULT_TIMEOUT}
    common.Click When Ready    ${btn}

Click Parcel Delivery Service Menu
    ${b2c_mnu_parcel_delivery_service_home_page}=    Replace String    ${b2c_mnu_parcel_delivery_service_home_page}    {value}    ${call_car_pick_up['text_delivery_service']}
    FOR    ${i}    IN RANGE    0    5
        Mouse Over    ${b2c_mnu_parcel_delivery_service_home_page}
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible   ${b2c_cbo_parcel_delivery_service}    timeout=5s
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
    END

Select Sub Menu Call Car Pick Up
    ${b2c_mnu_call_car_pick_up_home_page}=    Replace String    ${b2c_mnu_call_car_pick_up_home_page}    {value}    ${call_car_pick_up['text_call_car_pick_up']}
    common.Click When Ready    ${b2c_mnu_call_car_pick_up_home_page}

Select Sub Menu Favorites
    ${b2c_mnu_favorites_home_page}=    Replace String    ${b2c_mnu_favorites_home_page}    {value}    ${Booking['text_favorite_list']}
    common.Click When Ready    ${b2c_mnu_favorites_home_page}

Select Sub Menu Return Business
    ${mnu_return_business_home_page}=    Replace String    ${mnu_return_business_home_page}    {value}    ${sub_menu['return_business']}
    common.Click When Ready    ${mnu_return_business_home_page}

Verify My Profile Page
    [Arguments]    ${company_profile}    ${profile}    ${profile_name}    ${profile_phone}    ${profile_email}    ${profile_position}    
    ...    ${sir_name}    ${company_name}    ${name}    ${phone}    ${email}    ${position}
    ${b2c_txt_company_profile}=        Replace String    ${b2c_txt_company_profile}        {value}    ${company_profile}  
    ${b2c_txt_profile}=                Replace String    ${b2c_txt_profile}                {value}    ${profile}  
    ${b2c_txt_profile_name}=           Replace String    ${b2c_txt_profile_name}           {value}    ${profile_name}  
    ${b2c_txt_profile_phone}=          Replace String    ${b2c_txt_profile_phone}          {value}    ${profile_phone}  
    ${b2c_txt_profile_mail}=           Replace String    ${b2c_txt_profile_mail}           {value}    ${profile_email}  
    ${b2c_txt_profile_position}=       Replace String    ${b2c_txt_profile_position}       {value}    ${profile_position}  
    ${b2c_txt_sir_name}=               Replace String    ${b2c_txt_sir_name}               {value}    ${sir_name}
    ${b2c_txt_company_name}=           Replace String    ${b2c_txt_company_name}           {value}    ${company_name}
    ${b2c_txt_name}=                   Replace String    ${b2c_txt_name}                   {value}    ${name}
    ${b2c_txt_phone}=                  Replace String    ${b2c_txt_phone}                  {value}    ${phone}
    ${b2c_txt_email}=                  Replace String    ${b2c_txt_email}                  {value}    ${email}
    ${b2c_txt_position}=               Replace String    ${b2c_txt_position}               {value}    ${position}
    Wait Until Element Is Visible    ${b2c_txt_company_profile}
    ${actual_company_profile} =    Get Text    ${b2c_txt_company_profile}
    ${actual_sir_name} =    Get Text      ${b2c_txt_sir_name}
    ${actual_company_name} =    Get Text     ${b2c_txt_company_name}  
    ${actual_profile} =    Get Text     ${b2c_txt_profile}  
    ${actual_profile_name} =    Get Text    ${b2c_txt_profile_name}
    ${actual_profile_phone} =    Get Text    ${b2c_txt_profile_phone}
    ${actual_profile_mail} =    Get Text    ${b2c_txt_profile_mail}
    ${actual_profile_position} =    Get Text    ${b2c_txt_profile_position}
    ${actual_name} =    Get Text    ${b2c_txt_name}
    ${actual_phone} =    Get Text    ${b2c_txt_phone}
    ${actual_email} =    Get Text    ${b2c_txt_email}
    ${actual_position} =    Get Text    ${b2c_txt_position}
    Should Be Equal    ${company_profile}    ${actual_company_profile}
    Should Be Equal    ${profile}    ${actual_profile}
    Should Be Equal    ${profile_name}    ${actual_profile_name}
    Should Be Equal    ${profile_phone}    ${actual_profile_phone}
    Should Be Equal    ${profile_email}    ${actual_profile_mail}
    Should Be Equal    ${profile_position}    ${actual_profile_position}
    Should Be Equal    ${sir_name}    ${actual_sir_name}
    Should Be Equal    ${company_name}    ${actual_company_name}    
    Should Be Equal    ${name}    ${actual_name}
    Should Be Equal    ${phone}    ${actual_phone}
    Should Be Equal    ${email}    ${actual_email}
    Should Be Equal    ${position}    ${actual_position}

Verify Company Profile Page
    [Arguments]    ${company_profile}
    ${text_company_profile}=        Replace String    ${b2c_txt_sir_name}        {value}    ${company_profile}  
    Wait Until Element Is Visible    ${text_company_profile}    timeout=${DEFAULT_TIMEOUT}

Wait Until Profile Page Loaded
    ${b2c_btn_edit_profile_info_home_page}=    Replace String    ${b2c_btn_edit_profile_info_home_page}    {value}    ${Booking['text_btn_edit']}
    ${b2c_txt_business_profile_title_home_page}=    Replace String    ${b2c_txt_business_profile_title_home_page}    {value}    ${Booking['text_company_profile']}
    Wait Until Element Is Visible    ${b2c_txt_business_profile_title_home_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Page Contains Element    ${b2c_btn_edit_profile_info_home_page}    timeout=${DEFAULT_TIMEOUT}
    Sleep   3s