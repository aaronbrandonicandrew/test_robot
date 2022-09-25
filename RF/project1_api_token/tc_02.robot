*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
TC 02
# This test is to check and verify scope checkbox
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
    Element Should Be Visible    //*[text()='Read']//ancestor::div[@class='composite-checkbox api-token__checkbox composite-checkbox--active']
    Element Should Be Visible    //*[text()='Trade']//ancestor::div[@class='composite-checkbox api-token__checkbox composite-checkbox--active']
    Element Should Be Visible    //*[text()='Payments']//ancestor::div[@class='composite-checkbox api-token__checkbox composite-checkbox--active']
    Element Should Be Visible    //*[text()='Trading information']//ancestor::div[@class='composite-checkbox api-token__checkbox composite-checkbox--active']
    Element Should Be Visible    //*[text()='Admin']//ancestor::div[@class='composite-checkbox api-token__checkbox composite-checkbox--active']
    [Teardown]    Close Browser