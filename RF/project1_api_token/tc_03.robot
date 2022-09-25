*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
TC_03
# This test is to input token name without scopes
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/api-token/   chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    pass
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //h4[@class='dc-text da-article__header']
    Input Text    //input[@type='text']    uwu
    Element Should Be Disabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
    [Teardown]    Close Browser