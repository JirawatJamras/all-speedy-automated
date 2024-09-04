**** Keywords ****
Click Go Login
    Wait Until Element Is Visible    ${btn_gologin}
    Click Xpath By JavaScript    ${btn_gologin}