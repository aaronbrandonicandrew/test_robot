*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
TC 07
# This test is to create token with a combination of scopes
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/api-token/   chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    pass
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //h4[@class='dc-text da-article__header']
    Click Element    //*[text()='Read']//parent::label
    Click Element    //*[text()='Trade']//parent::label
    Click Element    //*[text()='Payments']//parent::label
    Click Element    //*[text()='Trading information']//parent::label
    Click Element    //*[text()='Admin']//parent::label
    Input Text    //input[@type='text']    john
    Click Button    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
    Wait Until Page Contains Element    //*[text()='john']//ancestor::td[@class='da-api-token__table-cell da-api-token__table-cell--name']    
    Wait Until Page Contains Element    //*[text()='Read']//ancestor::td[@class='da-api-token__table-cell']
    Wait Until Page Contains Element    //*[text()='Trade']//ancestor::td[@class='da-api-token__table-cell']
    Wait Until Page Contains Element    //*[text()='Payments']//ancestor::td[@class='da-api-token__table-cell']
    Wait Until Page Contains Element    //*[text()='Trading information']//ancestor::td[@class='da-api-token__table-cell']
    Wait Until Page Contains Element    //*[text()='Admin']//ancestor::td[@class='da-api-token__table-cell']
    [Teardown]    Close Browser