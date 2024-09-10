*** Keywords ***
Click Register On Button
    Wait Until Element Is Visible    ${register_btn_business}
    Click Element                    ${register_btn_business}

Check Checkbox State
    ${checked}=  Get Element Attribute    ${checkbox_locator}    checked
    RETURN    ${checked} == 'true'


Verify PartnerType LegalEntity    
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${partnertype_txt}    timeout=10s
    Element Should Be Visible    ${partnertype_txt}    ${menu_txt}
    Check Checkbox State

Verify Company Name Text Box  
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${companyname_txtbox}    timeout=10s
    Element Should Be Visible    ${companyname_txtbox}    ${menu_txt}

Verify Tax Identification Number Text Box  
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${tax_identification_number}    timeout=10s
    Element Should Be Visible    ${tax_identification_number}    ${menu_txt}