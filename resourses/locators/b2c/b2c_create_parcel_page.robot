*** Variables ***

### create a parcel ###
${parcel_type_dry_btn}     //img[@alt='Dry']
${parcel_type_chill_btn}    //img[@alt='Chill']
${title_create_parcel_page_txt}     //div[@class='ant-modal-title']//div[text()='สร้างพัสดุ']
${close_noti_txt}     //h2[@id='swal2-title']
${close_noticonfirm_btn}    //button[contains(@class, 'swal2-confirm') and contains(text(), 'ยืนยัน')]
${close_noti_btn}     (//button[@type='button' and @aria-label='Close'])[2]

${choose_favorites_btn}     //button[span[text()='เลือกจากรายการโปรด']]
${favorites_defult_text}     //div[@class='ant-space-item']//span[contains(@class, 'ant-typography') and contains(@class, 'bg-amber-500')]
${search_favorites_txtbox}     //input[@placeholder='ค้นหา']

${select_favorites_btn}     //button[contains(@class, 'ant-btn') and contains(@class, 'bg-green-500')]