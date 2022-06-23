*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}=                           http://tutorialsninja.com/demo/
${BROWSER}=                       chrome
${camera_image}=                  //img[contains(@alt, "Canon")]
${reviews_tab}=                   //a[contains(text(), "Reviews")]
${continue_button}=               //button[contains(text(), "Continue")]
${input_name_field}=              //*[@id="input-name"]
${text_field}=                    //textarea
${alert}=                         //div[contains(text(), "Review Text must be between 25 and 1000")]

*** Test Cases ***
Writing Review
    [Tags]   smoke  negative
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    Scroll Element Into View    ${camera_image}
    Click Element    ${camera_image}
    Scroll Element Into View    ${reviews_tab}
    Scroll Element Into View    ${continue_button}
    Input Text    ${input_name_field}    qq
    Input Text    ${text_field}    qwerty
    Select Radio Button    rating    5
    Radio Button Should Be Set To    rating    5
    Click Button    ${continue_button}
    Wait Until Page Contains Element    ${alert}
    Close Browser
