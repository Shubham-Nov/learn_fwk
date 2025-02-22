*** Settings ***
Resource    ../lib/page_objects/login_page.robot

*** Variables ***
${Expected_text}    Login Page

*** Test Cases ***
Login To Web
    [Setup]    Open Url
    
    Enter User Name
    Enter Password
    Click Login Button
    Sleep    5
    Click Logout Button
    ${get_str}    Get Login Page Header Text    
    Sleep    5
    Should Be Equal    first=${Expected_text}    second=${get_str}

    [Teardown]    Close All Browsers