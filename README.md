Install Python and Visual Studio Code


Install Python:
    Go to the Python website and download the latest version suitable for your operating system.
Run the installer and ensure you check the option “Add Python to PATH” during installation.


Verify the installation by opening a Terminal (Mac/Linux) or Command Prompt (Windows) and typing:
    -python --version 3.12.0
    -python-3.12.0-amd64

Install Robot Framework:
    pip    install    -r requirement.txt


# all-speedy-automated
-- Run Command --
robot -v ENV:uat -i Regression -v LANG:en  ../testcases/
robot -v ENV:uat -i Regression  ../testcases/
robot -v ENV:uat -i Booking  ../testcases/
robot -v ENV:uat -i DC_Operation  ../testcases/
robot -v ENV:uat -i Register  ../testcases/


# Setting Command
-v คือ แทนค่าตัวแปร                    #(\resources\config)
-i คือ Tag                           #[Tags]   Regression    Booking    DC_Operation
-t คือ testcase เช่น -t *01*          #AllSpeedy_B2C_001_ID_1 

# For Window
robot -v ENV:uat -i Regression -t *001* -t *003* -t *006*   ../testcases/

# For MacOS
robot -v ENV:uat -i Regression -t '*001*' -t '*003*' -t '*006*' ../testcases/

# Pabot
pabot --processes 3 -v ENV:uat -i Regression ..\testcases |  tee output.txt
python -m pabot --processes 3 -v ENV:uat -i Regression ../testcases/  |  tee output.txt

Report
     - Report : log.html
     - Report : report.html