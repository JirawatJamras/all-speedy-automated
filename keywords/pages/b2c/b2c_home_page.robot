*** Keywords ***
Click Book Parcel Delivery
    common.Click When Ready    ${b2c_mnu_book_parcel_delivery_home_page}

Click Parcel Delivery Service Menu
    Mouse Over    ${b2c_mnu_parcel_delivery_service_home_page}

Select Sub Menu My Parcel
    common.Click When Ready    ${b2c_mnu_my_parcel_home_page}

Select Sub Menu Call Car Pick Up
    common.Click When Ready    ${b2c_mnu_call_car_pick_up_home_page}

Select Sub Menu Favorites
    common.Click When Ready    ${b2c_mnu_favorites_home_page}

Select Sub Menu Return Business
    common.Click When Ready    ${b2c_mnu_return_business_home_page}

Select Sub Menu Calculate Shipping Costs
    common.Click When Ready    ${b2c_mnu_calculate_shipping_cost_home_page}

Select Sub Menu Shipping Methods
    common.Click When Ready    ${b2c_mnu_shipping_methods_home_page}

Select Sub Menu Term Of Service
    common.Click When Ready    ${b2c_mnu_term_of_service_home_page}

Select Sub Menu Register Business Customer
    common.Click When Ready    ${b2c_mnu_register_business_customer_home_page}

Verify My Profile PageBusiness
    [Arguments]    ${name}
    Wait Until Element Is Visible    ${b2c_personal_information_txtbox}
    ${expected_emailtxtbox} =    Get value    ${b2c_personal_information_txtbox}
    Should Be Equal    ${name}    ${expected_emailtxtbox}

Click Button To Add
    Wait Until Element Is Visible    ${b2c_btn_add}    timeout=30s
    Click Element        ${b2c_btn_add}

Click Tracking Parcel Delivery Menu Button
    common.Click When Ready    ${b2c_mnu_tracking_parcel_delivery}