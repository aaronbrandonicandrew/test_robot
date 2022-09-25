*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
TC 03
# Cancel button should navigate to trading homepage
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/closing-account   chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    pass
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //p[@class="dc-text closing-account__information--bold"]
    Click Element    //button[@class="dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel"]
    Wait Until Page Contains Element    //*[@data-testid="dt_contract_dropdown"]    30
    [Teardown]    Close Browser