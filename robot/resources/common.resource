*** Settings ***
Documentation    Shared variables for the QA Automation suite.

*** Variables ***
${BASE_URL}         https://www.saucedemo.com/
${API_URL}          https://jsonplaceholder.typicode.com
${BROWSER}          chromium
${HEADLESS}         ${TRUE}

# Sauce Demo users
${USER_STANDARD}    standard_user
${USER_LOCKED}      locked_out_user
${PASSWORD}         secret_sauce
${PASSWORD_WRONG}   wrong_password
