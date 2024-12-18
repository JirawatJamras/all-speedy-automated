*** Variables ***
${parcel_type_dry_btn}     //img[@alt='Dry']
${parcel_type_chill_btn}    //img[@alt='Chill']
${choose_favorites_btn}     //button[span[text()='{value}']]
${favorites_accept_btn}    //button[span[text()='{value}']]
${add_to_favorites_btn}    //span[text()='{value}']
${close_noti_btn}     (//button[@type='button' and @aria-label='Close'])[2]

${title_create_parcel_page_txt}     //div[@class='ant-modal-title']//div[text()='{value}']
${favorites_default_text}     //div[text()='{value}']