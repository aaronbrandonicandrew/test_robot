*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
Task 1
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    aaron+4@besquare.com.my
    Input Text    //input[@type='password']    C0rrect_p4ssword
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper']    30
    Click Element    dt_core_account-info_acc-info
    Wait Until Page Contains Element    //div[@class='acc-switcher__loginid-text' and contains(.,'CR4457136')]    30
    Click Element   dt_core_account-switcher_demo-tab
    Wait Until Page Contains Element    //div[@class='acc-switcher__loginid-text' and contains(.,'VRTC6739285')]    30
    [Teardown]    Close Browser


   