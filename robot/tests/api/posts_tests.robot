*** Settings ***
Documentation     API tests against JSONPlaceholder (TC9, TC10, TC11).
Library           RequestsLibrary
Library           Collections
Resource          ../../resources/common.resource

Suite Setup       Create Session    jph    ${API_URL}

*** Test Cases ***
TC9 GET Post 1 Returns 200 With Required Fields
    [Documentation]    GET /posts/1 → status 200, JSON has id, title, body.
    [Tags]    api    positive
    ${response}=    GET On Session    jph    /posts/1    expected_status=200
    Dictionary Should Contain Key    ${response.json()}    id
    Dictionary Should Contain Key    ${response.json()}    title
    Dictionary Should Contain Key    ${response.json()}    body

TC10 POST Post Returns 201 With Generated Id
    [Documentation]    POST /posts → status 201, response JSON contains id.
    [Tags]    api    positive
    &{payload}=    Create Dictionary    title=foo    body=bar    userId=${1}
    ${response}=    POST On Session    jph    /posts    json=${payload}    expected_status=201
    Dictionary Should Contain Key    ${response.json()}    id

TC11 GET Non-Existent Post Returns 404
    [Documentation]    GET /posts/9999 → status 404.
    [Tags]    api    negative
    ${response}=    GET On Session    jph    /posts/9999    expected_status=404
    Should Be Equal As Integers    ${response.status_code}    404
