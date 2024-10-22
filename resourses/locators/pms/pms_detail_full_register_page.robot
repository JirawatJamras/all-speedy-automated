*** Variables ***
${pms_txt_title_detail}    //div[@class='ant-card-head-title']//span[text()='{value}']
${pms_txt_detail_full_regis}    //span[text()='{value}']/..
${pms_txt_customer_type_full_regis}    //label[@for='customerType']

${pms_txtbox_customer_type_full_regis}    //input[@id='customerType']

${pms_btn_next_page}    //b[text()='{value}']/..

${pms_tab_dry_parcel}    //div[@data-node-key='defaultPost']//div[@role='tab']
${pms_tab_chill_parcel}    //div[@data-node-key='controlTem']//div[@role='tab']
${pms_tab_return_business}    //div[@data-node-key='return']//div[@role='tab']