*** Settings ***
Documentation     UI login tests for Sauce Demo (TC1–TC4).
Library           Browser
Resource          ../../resources/common.resource
Resource          ../../resources/login_keywords.resource

Suite Setup       New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown    Close Browser    ALL
Test Setup        New Context
Test Teardown     Close Context

*** Test Cases ***
TC1 Login With Standard User Redirects To Inventory
    [Documentation]    Login standard_user/secret_sauce → URL has /inventory.html and title "Products".
    [Tags]    login    positive
    Open Login Page
    Login With Credentials    ${USER_STANDARD}    ${PASSWORD}
    Verify On Inventory Page

TC2 Login With Wrong Password Shows Error
    [Documentation]    Wrong password → error contains "Username and password do not match".
    [Tags]    login    negative
    Open Login Page
    Login With Credentials    ${USER_STANDARD}    ${PASSWORD_WRONG}
    Verify Error Message    Username and password do not match

TC3 Login With Empty Username Shows Error
    [Documentation]    Empty username → error contains "Username is required".
    [Tags]    login    negative
    Open Login Page
    Login With Credentials    ${EMPTY}    ${PASSWORD}
    Verify Error Message    Username is required

TC4 Login With Locked Out User Shows Error
    [Documentation]    locked_out_user → error contains "Sorry, this user has been locked out".
    [Tags]    login    negative
    Open Login Page
    Login With Credentials    ${USER_LOCKED}    ${PASSWORD}
    Verify Error Message    Sorry, this user has been locked out
