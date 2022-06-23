*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}=                           http://tutorialsninja.com/demo/
${BROWSER}=                       chrome
${product_cart_button}=           //button[contains(@onclick, "cart.add('43')")]
${added_product}=                 //*[@id="common-home"]/div[1]
${cart_button}=                   //button[contains(@class,"btn-inverse")]
${remove_button}=                //button[contains(@onclick,"cart")]
${removed_product}=              //span[@id="cart-total"]//i[@class="fa fa-shopping-cart"]



*** Test Cases ***
Adding Product to Cart
    [Tags]   smoke
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    Scroll Element Into View    ${cart_button}
    Click Button    ${product_cart_button}
    Element Should Contain    ${added_product}     MacBook

Deleting Product from Cart
    [Tags]   smoke
    [Setup]
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    Click Button    ${cart_button}
    Click Button    ${remove_button}
    Wait Until Page Contains    0 item(s) - $0.00
    Close Browser

*** Keywords ***
#Setup for deleting product from cart
#    get cookie
#    add product to cart via api



