*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}=                           http://tutorialsninja.com/demo/
${BROWSER}=                       chrome
${phones_category}=               //a[contains(text(), "Phones")]
${phones_link}=                   http://tutorialsninja.com/demo/index.php?route=product/category&path=24
${sort_dropdown}=                 //select[@id="input-sort"]
${sortDesc}=                      //option[contains(text(), "Price (High > Low)")]
${desc_link}=                     http://tutorialsninja.com/demo/index.php?route=product/category&path=24&sort=p.price&order=DESC



*** Test Cases ***
Searching Product
    [Tags]   smoke
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    Click Link    ${phones_category}
    Wait Until Location Is    ${phones_link}
    Click Element    ${sort_dropdown}
    Click Element    ${sortDesc}
    Wait Until Location Is    ${desc_link}
    Close Browser
