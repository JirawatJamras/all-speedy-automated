Install Python and Visual Studio Code
Install Python:
    Go to the Python website and download the latest version suitable for your operating system.
Run the installer and ensure you check the option “Add Python to PATH” during installation.
Verify the installation by opening a Terminal (Mac/Linux) or Command Prompt (Windows) and typing:
    -python --version 3.12.0
    -python-3.12.0-amd64
Install Robot Framework:
    - requirement.txt
    - pip install pyyaml
    - pip install robotframework
    - pip install robotframework-seleniumlibrary
    - pip install DateTime


-- Run for Mac OS --
robot -v ENV:uat -i UAT  ../testcases/c2c/allspeedy_c2c_001.robot
robot -v ENV:uat -i UAT  ../testcases/b2c/allspeedy_b2c_001.robot
robot -v ENV:uat -i UAT  ../testcases/b2c/allspeedy_dps_001.robot

robot  ../testcases/register/register.robot
python -m robot  ../testcases/register/register.robot


-- Run for Windows --
CD D:\All-speedy-automated\result
robot -v ENV:uat -i UAT  ../testcasses/c2c/allspeedy_c2c_001.robot
robot -v ENV:uat -i UAT  ../testcases/b2c/allspeedy_b2c_001.robot
robot -v ENV:uat -i UAT  ../testcases/b2c/allspeedy_dps_001.robot


-v คือ Environment                   #(\resources\config)
-i คือ Tag                           #[Tags]   UAT    Regression
-t คือ testcase เช่น -t *01*          #AllSpeedy_B2C_001_ID_1

Report
     - results : log.html
     - results : report.html