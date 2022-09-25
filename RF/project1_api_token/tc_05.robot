*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
TC 05
# This test is to input invalid token name with scopes
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/api-token/   chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    pass
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //h4[@class='dc-text da-article__header']
    Click Element    //*[text()='Read']//parent::label
    Input Text    //input[@type='text']    s
    Element Should Be Disabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
    [Teardown]    Close Browser