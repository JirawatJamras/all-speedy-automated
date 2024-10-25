*** Variables ***
${btn_add_booking}    //span[text()='{value}']/..
${btn_accept_condition}    //span[text()='{value}']/..

${txt_return_business_header}    //div[@class='ant-card-head-title']//h3
${txt_link_return_business_header}    //div[@class='ant-modal-title']//span[contains(@class,'ant-typography') and contains(@class,'text-xl')]
${txt_link_name_return_business}    //label[@for='return_linkName']//span[@class='text-lg font-bold']
${txt_phone_return_business}    //label[@for='return_tel']//span[@class='text-lg font-bold']
${txt_name_return_business}    //label[@for='return_name']//span[@class='text-lg font-bold']
${txt_shipping_payer_return_business}    //label[@for='return_paymentBy']
${txt_location_pickup_return_business}    //form[@class='ant-form ant-form-vertical css-oj2tq8']//h5
${txt_address_return_business}    //label[@for='return_address_info']
${txt_postcode_return_business}    //label[@for='return_address_full']

${txtbox_link_name_return_business}    //input[@id='return_linkName']
${txtbox_phone_return_business}    //input[@id='return_tel']
${txtbox_name_return_business}    //input[@id='return_name']
${txtbox_address_return_business}    //textarea[@id='return_address_info']
${txtbox_postcode_return_business}    //span[text()='{value}']

${opt_owner_pay_return_business}    //span[text()='{value}']/..//input[@value='owner']

${tab_send_home_return_business}    //div[@data-node-key='home' and @class='ant-tabs-tab ant-tabs-tab-active']