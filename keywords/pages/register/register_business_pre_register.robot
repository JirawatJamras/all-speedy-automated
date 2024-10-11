*** Keywords ***
Click Checkbox Partner Types Legal
    [Arguments]    ${Partner_Types}
    Wait Until Element Is Visible    //span[text()='${Partner_Types}']/../..//label[@class='ant-radio-wrapper ant-radio-wrapper-checked css-1x1kih3']
    Click Element    //span[text()='${Partner_Types}']/../..//label[@class='ant-radio-wrapper ant-radio-wrapper-checked css-1x1kih3']

Select Partner Type Radio Button
    [Arguments]    ${type}
    Click Xpath By JavaScript    //input[@name='customerType'][@value='${type}']

Select Company Title Name   
    [Arguments]    ${Title}
    common.Click when ready    ${register_dropdown_company_title_name_register_page}
    Wait Until Element Is Visible    //div[text()='${Title}'][@class='ant-select-item-option-content'] 
    Click Element    //div[text()='${Title}'][@class='ant-select-item-option-content']
