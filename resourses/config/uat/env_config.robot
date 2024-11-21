*** Variables ***
${DEFAULT_TIMEOUT}                      30s
${BROWSER_NAME}                         Chrome


####################### DPS UAT DATA #######################
${DPS_UAT_URL}                          https://dps-uat.allspeedy.co.th/
${DPS_PORTAL_UAT_URL}                   https://dps-uat.allspeedy.co.th/portal
${DPS_Homepage_URL}                     https://dps-uat.allspeedy.co.th/homepage

####################### PMS UAT DATA #######################
${PMS_UAT_URL}                          https://pms-uat.allspeedy.co.th/
${PMS_USER_MANAGER_UAT_URL}             https://pms-uat.allspeedy.co.th/usermanager/requests

####################### B2C UAT DATA #######################
${B2C_UAT_URL}                          https://www-uat.allspeedy.co.th/auth/login
${B2C_UAT_PICKUP_SCHEDULE_URL}          https://www-uat.allspeedy.co.th/pickup-schedule/list
${CPS_API_UAT_URL}                      https://cps-api-uat.allspeedy.co.th/v1
${C2C_UAT_URL}                          https://web-stg.7eleven.co.th/

####################### MongoDB ############################
${DB_URI}           mongodb+srv://admin:PRgxr23TZeubWeQP@all-speedy-db-uat.devnv.mongodb.net/
${DATABASE_NAME}    distcenterdb
${COLLECTION}       dc-cut-off-times
${QUERY}            Y    #status

####################### SPS UAT DATA #######################
${REMOTE_URL}                           http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}                        android
${ENV}                                  uat
${AUTOMATION_ANDRIOD_NAME}              UiAutomator2
${AUTOMATION_IOS_NAME}                  XCUITest
${ANDROID_PLATFORM_NAME}                Android
${IOS_PLATFORM_NAME}                    iOS
${DEVICE_NAME}                          emulator-5554
${ALLSPEEDY_ANDROID_PACKAGE}            speedy.delivery.app
${ALLSPEEDY_ANDROID_ACTIVITY}           speedy.delivery.app.MainActivity
${POSONLINE_ANDROID_PACKAGE}            th.co.gosoft.posonline
${POSONLINE_ANDROID_ACTIVITY}           th.co.gosoft.posonline.MainActivity
${CHROME_ANDROID_PACKAGE}               com.android.chrome
${CHROME_ANDROID_ACTIVITY}              com.google.android.apps.chrome.Main
#..
#..
#..
#..
${PLATFORM_VERSION}                     15.0