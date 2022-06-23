*** Settings ***
Library    SeleniumLibrary

Test Setup    Start browser
#Test Teardown    ...
*** Variables ***
${URL}=                           http://tutorialsninja.com/demo/
${BROWSER}=                       chrome
${cameras_category}=              //a[contains(@href, "path=33")]
${products_quantity}=             //div[contains(text(), "Showing 1 to 2 of 2")]



*** Test Cases ***
Searching Product
    [Tags]   smoke
    Click Element    ${cameras_category}
    Scroll Element Into View    ${products_quantity}
    Page Should Contain    Showing 1 to 2 of 2
    Close Browser

*** Keywords ***

Start browser
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window