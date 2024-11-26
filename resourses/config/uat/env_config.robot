*** Variables ***
${DEFAULT_TIMEOUT}                      30s
${BROWSER_NAME}                         Chrome

####################### DPS UAT DATA #######################
${DPS_UAT_URL}                          https://dps-uat.allspeedy.co.th/

####################### PMS UAT DATA #######################
${PMS_UAT_URL}                          https://pms-uat.allspeedy.co.th/

####################### B2C UAT DATA #######################
${B2C_UAT_URL}                          https://www-uat.allspeedy.co.th/auth/login
${CPS_API_UAT_URL}                      https://cps-api-uat.allspeedy.co.th/v1
${C2C_UAT_URL}                          https://web-stg.7eleven.co.th/

####################### MongoDB ############################
${DB_URI}           mongodb+srv://admin:PRgxr23TZeubWeQP@all-speedy-db-uat.devnv.mongodb.net/
${DATABASE_NAME}    distcenterdb
${COLLECTION}       dc-cut-off-times
${QUERY}            Y    #status