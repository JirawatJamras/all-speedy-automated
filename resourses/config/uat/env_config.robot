*** Variables ***
${DEFAULT_TIMEOUT}              30s

####################### DPS UAT DATA #######################
${DPS_UAT_URL}           https://dps-uat.allspeedy.co.th/
${DPS_PORTAL_UAT_URL}    https://dps-uat.allspeedy.co.th/portal
${PMS_UAT_URL}           https://pms-uat.allspeedy.co.th/
${DPS_Homepage_URL}      https://dps-uat.allspeedy.co.th/homepage

####################### PMS UAT DATA #######################
${PMS_UAT_URL}    https://pms-uat.allspeedy.co.th/

####################### B2C UAT DATA #######################
${B2C_UAT_URL}    https://www-uat.allspeedy.co.th/auth/login
${C2C_UAT_URL}    https://www-uat.allspeedy.co.th/auth/login

####################### SPS UAT DATA #######################
${REMOTE_URL}                   http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}                Android
${ENV}                          uat
${AUTOMATION_ANDRIOD_NAME}      UiAutomator2
${AUTOMATION_IOS_NAME}          XCUITest
${ANDROID_PLATFORM_NAME}        Android
${IOS_PLATFORM_NAME}            iOS
${ANDROID_PACKAGE}              speedy.delivery.app
${ANDROID_ACTIVITY}             speedy.delivery.app.MainActivity