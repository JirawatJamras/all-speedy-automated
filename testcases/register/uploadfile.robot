*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Upload
    [Documentation]    RM Lead : Assign RM ทีละรายการในคำขอ Pre-Register  
    [Tags]    Register    UAT    BEW
    uploadfile

*** Keywords ***

uploadfile
    # common.Open URL    https://www-uat.allspeedy.co.th/business-register/fullRegister/14354493880336861576
    # register_business_full_register.Click Next 
    # register_business_full_register.Click Next 
    # register_business_full_register.Click Next
    register_business_full_register.Upload Certificate Business Registration    ${testpdf}
    register_business_full_register.Upload Copy File 20    ${testpdf}
    register_business_full_register.Upload Copy ID Card    ${testpdf}
    register_business_full_register.Copy Of Bank Account    ${testpdf}
    register_business_full_register.Upload Copy Of House Registration    ${testpdf}
    register_business_full_register.Upload Permission form for Deduction from Bank Account    ${testpdf}
    register_business_full_register.Upload Other File    ${testpdf}
    register_business_full_register.Click Acceptance Terms of Service
    register_business_full_register.Click Acceptance Privacy Policy
