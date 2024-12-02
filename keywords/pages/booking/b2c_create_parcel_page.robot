*** Keywords ***   
Click Add To Favorites
    ${add_to_favorites_btn}=    Replace String    ${add_to_favorites_btn}    {value}    ${Booking['text_add_to_fovorite']}
    common.Click When Ready    ${add_to_favorites_btn}