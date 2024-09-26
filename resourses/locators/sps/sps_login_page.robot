*** Variables ***
${sps_txtbox_username_login_page}    //android.webkit.WebView[@text="CPALL IDP"]/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.widget.EditText
${sps_txtbox_password_login_page}    //android.webkit.WebView[@text="CPALL IDP"]/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText

${sps_btn_logon_login_page}    //android.view.View[@content-desc="Log On"]

${sps_txt_errormsg_need_enter_login_name_login_page}    //android.widget.TextView[@text="{value}"]