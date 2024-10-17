*** Variables ***
${register_tab_business_customer}    //div[@role='tab'][text()='{value}']/..
${register_tab_general_customer}    //div[@role='tab'][text()='{value}']/..

#old
${register_btn_business_customers_tab_general_customers_page}    //div[text()='ลูกค้าธุรกิจ'][@id='rc-tabs-2-tab-business']/..
${register_btn_general_custmers_tab_general_customers_page}    //div[text()='ลูกค้าทั่วไป'][@id='rc-tabs-2-tab-customer']/..
${register_txt_can_not_be_reached_page}    //*[text()='This site can’t be reached']