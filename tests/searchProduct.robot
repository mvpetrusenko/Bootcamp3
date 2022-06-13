*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}=                           http://tutorialsninja.com/demo/
${BROWSER}=                       chrome
${search_box}=                    //input[@name="search"]
${search_button}=                 //*[@id="search"]/span/button



*** Test Cases ***
Searching Product
    [Tags]   smoke
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    Click Element    ${search_box}
    Input Text    ${search_box}    Canon
    Click Button    ${search_button}
    Wait Until Location Is    http://tutorialsninja.com/demo/index.php?route=product/search&search=Canon
    Close Browser
