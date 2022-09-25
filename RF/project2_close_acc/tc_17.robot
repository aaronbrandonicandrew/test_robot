*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${text}    abc123

*** Test Cases ***
TC 17
# Close account button should delete account
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
    Click Element   //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]
    Wait Until Page Contains Element    //button[span[contains(string(),'Close')]]
    Click Element    //button[span[contains(string(),'Close')]]
    Sleep    3 
    Wait Until Page Contains Element    //div/p[contains(string(),'sorry to see you leave')]
    Sleep    5
    [Teardown]    Close Browser