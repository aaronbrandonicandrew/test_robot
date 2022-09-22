*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
Task 3
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
    Click Element    //span[@class="acc-switcher__id"]
    Wait Until Page Contains Element    //div[@class='btn-purchase__info btn-purchase__info--right']    30
    Click Element   //div[@class='cq-symbol-select-btn__container']
    Wait Until Page Contains Element    //*[@class="ciq-menu ciq-enabled cq-chart-title stx-show cq-symbols-display stxMenuActive"]
    Sleep    10
    Click Element    //*[contains(text(),'Forex')]
    Wait Until Page Contains Element    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ' and contains(.,'AUD/USD')]    50
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ' and contains(.,'AUD/USD')]
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    20
    Click Element    //*[@class='contract-type-widget__display']
    Click Element    //*[@id='dt_contract_high_low_item']
    Click Element    //*[@class='dc-input__field']
    Press Keys    none    BACKSPACE+1
    Click Element    //button[@id='dc_payout_toggle_item']
    Click Element    //input[@id='dt_amount_input']
    Press Keys    none    BACKSPACE+5.50
    Sleep    2
    Click Element    //button[@id='dt_purchase_put_button']
    [Teardown]    Close Browser


   