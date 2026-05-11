*** Settings ***
Documentation    Inventory / product page keywords + locators.
Library          Browser
Library          Collections
Resource         common.resource

*** Variables ***
${LOC_ITEM_NAME}        [data-test="inventory-item-name"]
${LOC_ITEM_PRICE}       [data-test="inventory-item-price"]
${LOC_SORT}             [data-test="product-sort-container"]
${LOC_CART_BADGE}       .shopping_cart_badge
${LOC_DETAIL_NAME}      [data-test="inventory-item-name"]
${LOC_DETAIL_PRICE}     [data-test="inventory-item-price"]
${LOC_ADD_BUTTONS}      button[data-test^="add-to-cart"]

*** Keywords ***
Get First Product Name
    ${name}=    Get Text    ${LOC_ITEM_NAME} >> nth=0
    RETURN    ${name}

Get First Product Price
    ${price}=    Get Text    ${LOC_ITEM_PRICE} >> nth=0
    RETURN    ${price}

Open First Product
    Click    ${LOC_ITEM_NAME} >> nth=0

Sort Products
    [Arguments]    ${value}
    Select Options By    ${LOC_SORT}    value    ${value}

Add Product To Cart By Index
    [Arguments]    ${index}
    Click    ${LOC_ADD_BUTTONS} >> nth=${index}

Get Cart Badge Text
    Wait For Elements State    ${LOC_CART_BADGE}    visible
    ${text}=    Get Text    ${LOC_CART_BADGE}
    RETURN    ${text}
