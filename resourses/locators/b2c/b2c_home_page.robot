*** Variables ***
${b2c_mnu_book_parcel_delivery_home_page}    //div[@class='ant-space-item']//a[@href='/booking' and text()='จองการจัดส่งพัสดุ']
${b2c_mnu_tracking_parcel_delivery}    //div[contains(@class,'ant-col hidden')]//a[@href='/status-tracking' and text()='ติดตามการจัดส่งพัสดุ']
${b2c_mnu_parcel_delivery_service_home_page}    //div[text()='บริการขนส่งพัสดุ']
${b2c_mnu_call_car_pick_up_home_page}    //a[text()='เรียกรถเข้ารับพัสดุ']
${b2c_mnu_my_parcel_home_page}    //a[text()='พัสดุของฉัน']
${b2c_mnu_favorites_home_page}    //a[text()='รายการโปรด']
${b2c_mnu_return_business_home_page}    //a[text()='Return Business']
${b2c_mnu_calculate_shipping_cost_home_page}    //a[text()='คำนวณค่าจัดส่ง']
${b2c_mnu_shipping_methods_home_page}    //a[text()='วิธีการส่งพัสดุ']
${b2c_mnu_term_of_service_home_page}    //a[text()='เงื่อนไขการให้บริการ']
${b2c_mnu_register_business_customer_home_page}    //a[text()='ลงทะเบียนลูกค้าธุรกิจ']

${b2c_btn_add}     //button[contains(@class, 'ant-btn') and span[text()='เพิ่ม']]
${b2c_btn_edit_profile_info_home_page}    //span[text()='แก้ไข']/..

${b2c_txt_business_profile_title_home_page}    //h2[text()='โปรไฟล์บริษัท']

${b2c_txt_company_profile}    //h2[text()='{value}']
${b2c_txt_profile}     //div[@class='text-[25px] text-[#005390] font-semibold']
${b2c_txt_profile_name}     //h1[@class='font-semibold w-1/2 text-[25px]'][contains(text(),'{value}')]
${b2c_txt_profile_phone}     //h1[@class='font-semibold w-1/2 text-[25px]'][contains(text(),'{value}')]
${b2c_txt_profile_mail}     //h1[@class='font-semibold w-1/2 text-[25px]'][normalize-space()='{value}']
${b2c_txt_profile_position}     //h1[@class='font-semibold w-1/2 text-[25px]'][contains(text(),'{value}')]
${b2c_txt_sir_name}    //h1[@class='text-[30px] font-bold'][normalize-space()='{value}']
${b2c_txt_company_name}    //h1[@class='text-[23px] font-bold'][normalize-space()='{value}']
${b2c_txt_name}     //h1[@class='ml-20 w-full text-[25px]'][normalize-space()='{value}']
${b2c_txt_phone}     //h1[@class='ml-20 w-full text-[25px]'][normalize-space()='{value}']
${b2c_txt_email}     //h1[@class='ml-20 w-full text-[25px]'][normalize-space()='{value}']
${b2c_txt_position}     //h1[@class='ml-20 w-full text-[25px]'][normalize-space()='{value}']
${b2c_cbo_parcel_delivery_service}    //ul[contains(@class,'ant-dropdown-menu')]





