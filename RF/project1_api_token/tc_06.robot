*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
TC 06
# This test is to input valid token name with scopes
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/api-token/   chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    pass
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //h4[@class='dc-text da-article__header']
    Click Element    //*[text()='Read']//parent::label
    Input Text    //input[@type='text']    uwu
    Click Button    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
    Wait Until Page Contains Element    //*[text()='uwu']//parent::td[@class='da-api-token__table-cell da-api-token__table-cell--name']    10    
    Wait Until Page Contains Element   //*[text()='Read']//ancestor::td[@class='da-api-token__table-cell']
    [Teardown]    Close Browser