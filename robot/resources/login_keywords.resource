*** Settings ***
Documentation    Login page keywords + locators for Sauce Demo.
Library          Browser
Resource         common.resource

*** Variables ***
${LOC_USERNAME}        [data-test="username"]
${LOC_PASSWORD}        [data-test="password"]
${LOC_LOGIN_BUTTON}    [data-test="login-button"]
${LOC_ERROR}           [data-test="error"]
${LOC_PAGE_TITLE}      .title

*** Keywords ***
Open Login Page
    New Page    ${BASE_URL}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Fill Text     ${LOC_USERNAME}    ${username}
    Fill Text     ${LOC_PASSWORD}    ${password}
    Click         ${LOC_LOGIN_BUTTON}

Verify Error Message
    [Arguments]    ${expected}
    Get Text    ${LOC_ERROR}    contains    ${expected}

Verify On Inventory Page
    Wait For Elements State    ${LOC_PAGE_TITLE}    visible
    Get Url     contains    /inventory.html
    Get Text    ${LOC_PAGE_TITLE}    ==    Products
