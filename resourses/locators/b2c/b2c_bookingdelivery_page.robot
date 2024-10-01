*** Variables ***
### term&con ###
${term&condition_txt}     //h1[@class='h-margin' and contains(text(), 'ความยินยอมในการเก็บรวบรวม ใช้ หรือเปิดเผยข้อมูลส่วนบุคคลของผู้ใช้บริการสปีด-ดี')]
${accept_termsservice_btn}     //button[.//span[text()='ยอมรับเงื่อนไขการใช้บริการ']]
${close_condition_popup}     (//button[@type='button' and @aria-label='Close'])[1]
${term&condition_title}    //div[@id=":r17:"]/span/text()[1]