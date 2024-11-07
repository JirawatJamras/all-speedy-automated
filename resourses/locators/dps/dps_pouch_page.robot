*** Variables ***
${dps_btn_print_pouch_label_pouch_detail_page}    //span[text()=' Print Pouch Label']/..

${dps_txt_pouch_in_pouch_list}    //td[text()='{pouch_number}']/..//td[text()='{inventory_crossdock}']/..//td[text()='{destination_inventory}']/..//td[text()='{parcel_amount}']/..//button[@aria-checked='{checked}']/../../../../../../..//td[contains(text(),'{update_date}')]

${dps_img_pencil_in_pouch_in_pouch_list}    //td[text()='{pouch_number}']/..//td[text()='{inventory_crossdock}']/..//td[text()='{destination_inventory}']/..//td[text()='{parcel_amount}']/..//button[@aria-checked='{checked}']/../../../../../../..//td[contains(text(),'{update_date}')]/..//img[@src='/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fedit-3.9188d6d3.png&w=1080&q=75']