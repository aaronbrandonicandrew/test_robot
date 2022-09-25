*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${text}    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

*** Test Cases ***
TC 13
# Max characters limit at reasons explanation box
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/closing-account   chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    pass
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //p[@class="dc-text closing-account__information--bold"]
    Click Element    //button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]
    Wait Until Page Contains Element    //p[@class='dc-text closing-account-reasons__title']    20
    Click Element    //span[contains(string(),'financial priorities')]
    Wait Until Page Contains Element    //*[@class="dc-icon dc-icon--active"]    20
    Input Text    //*[@name="other_trading_platforms"]    ${text}
    Page Should Not Contain Element   //button[span[contains(string(),'Continue')] and @disabled]
    Wait Until Page Contains Element    //div/p[contains(string(),'Remaining characters: 0')]
    [Teardown]    Close Browser