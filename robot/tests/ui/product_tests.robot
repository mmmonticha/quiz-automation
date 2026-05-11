*** Settings ***
Documentation     UI product tests for Sauce Demo (TC5, TC6).
Library           Browser
Resource          ../../resources/common.resource
Resource          ../../resources/login_keywords.resource
Resource          ../../resources/inventory_keywords.resource

Suite Setup       New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown    Close Browser    ALL
Test Setup        Open Inventory As Standard User
Test Teardown     Close Context

*** Keywords ***
Open Inventory As Standard User
    New Context
    Open Login Page
    Login With Credentials    ${USER_STANDARD}    ${PASSWORD}
    Verify On Inventory Page

*** Test Cases ***
TC5 First Product Name And Price Match On Detail Page
    [Documentation]    Click first product → name and price on detail page match the list.
    [Tags]    product    positive
    ${list_name}=     Get First Product Name
    ${list_price}=    Get First Product Price
    Open First Product
    Get Text    ${LOC_DETAIL_NAME}     ==    ${list_name}
    Get Text    ${LOC_DETAIL_PRICE}    ==    ${list_price}

TC6 Sort Z To A First Product Is Test All The Things T-Shirt
    [Documentation]    Sort name (Z→A); first product must be "Test.allTheThings() T-Shirt".
    [Tags]    product    sort
    Sort Products    za
    ${first_after_sort}=    Get First Product Name
    Should Start With    ${first_after_sort}    Test.allTheThings() T-Shirt
