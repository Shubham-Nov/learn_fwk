*** Settings ***
Library    SeleniumLibrary
Variables    locators.py
Library    ../utils.py

*** Variables ***
${url}    https://the-internet.herokuapp.com/login
${uname}    tomsmith
${pword}    SuperSecretPassword!       

*** Keywords ***
Get Browser Path
    ${b_path}    Get Webdriver Path    browser_name=firefox
    [Return]    ${b_path}

Open Url
    ${b_path}    Get Browser Path
    Open Browser    url=${url}    browser=firefox    #executable_path=/home/shubham/Desktop/LearnPython/learn_fwk/learn_robot_fwk/resources/linux/geckodriver
    Maximize Browser Window

Enter User Name
    Wait Until Page Contains Element    locator=${locators1['uname']}    timeout=20
    Input Text    locator=${locators1['uname']}    text=${uname}


Enter Password
    Wait Until Page Contains Element    locator=${locators1['pword']}    timeout=20
    Input Password    locator=${locators1['pword']}    password=${pword}


Click Login Button
    Wait Until Page Contains Element    locator=${locators1['login']}     timeout=20
    Click Element    locator=${locators1['login']}

Click Logout Button
    Wait Until Page Contains Element    locator=${locators1['logout']}    timeout=20
    Click Element    locator=${locators1['logout']} 

Get Login Page Header Text
    Wait Until Page Contains Element    locator=${locators1['login_ver']}    timeout=20
    ${text}    Get Text    locator=${locators1['login_ver']} 
    [Return]    ${text}
