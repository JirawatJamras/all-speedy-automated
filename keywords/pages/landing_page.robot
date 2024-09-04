**** Keywords ****
Click Go Login Button
    Wait Until Element Is Visible    ${btn_gologin}
    Click Xpath By JavaScript    ${btn_gologin}