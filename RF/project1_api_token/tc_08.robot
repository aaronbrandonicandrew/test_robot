*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
TC 08
# This test is to test the copy, view token, scopes info and delete functions
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/api-token/   chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    pass
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //h4[@class='dc-text da-article__header']
    Click Element    //*[text()='Admin']//parent::label
    Input Text    //input[@type='text']    bill
    Click Button    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
    Wait Until Page Contains Element    //*[text()='bill']//ancestor::td[@class='da-api-token__table-cell da-api-token__table-cell--name']
    Wait Until Page Contains Element    //*[text()='Admin']//ancestor::td[@class='da-api-token__table-cell']
    Click Element    //*[@class="dc-icon dc-clipboard"]
    Wait Until Page Contains Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']
    Click Button    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']
    Click Element    //*[@class='dc-icon da-api-token__visibility-icon']
    Wait Until Page Contains Element    //p[@class="dc-text"]
    Click Element    //*[@class='dc-icon dc-clipboard da-api-token__delete-icon']
    Click Button    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']
    Wait Until Page Does Not Contain    //*[text()='bill']//ancestor::td[@class='da-api-token__table-cell da-api-token__table-cell--name']
    [Teardown]    Close Browser