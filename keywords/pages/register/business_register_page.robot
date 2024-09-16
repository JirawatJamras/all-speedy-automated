**** Keywords ***
Click Checkbox_Partner_Types_Legal
    Wait Until Element Is Visible    ${Checkbox_Partner_Types_Legal entity}
    Click Element    ${Checkbox_Partner_Types_Legal entity}
Verify Checkbox_Partner_Types_Legal
    Verify PartnerType LegalEntity    ${Menu_Checkbox_Partnertype['expected_txtbox'],['LegalEntitytxt']}
Select Company registration prefix    
    Wait Until Element Is Visible    ${Dropdown_Company registration prefix}
    Click Element    ${Dropdown_Company registration prefix}
    Wait Until Element Is Visible    ${Dropdown_General partnership} 
    Click Element    ${Dropdown_General partnership}    