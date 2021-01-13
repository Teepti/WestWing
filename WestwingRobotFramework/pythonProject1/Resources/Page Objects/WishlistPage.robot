*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/CommonUtilityKeywords.robot


*** Variables ***
${Delete_button_of_product_locator}    xpath://*[@id="wishlistRoot"]/div/div[4]/div/ul/li/button
${Wishlist_counter_locator}    css:#wwOneHeader > div > div.OneHeader__OneHeaderWrapper-d0qgmn-0.ioEPPS > header > div.IconsButtonTray__Icons-sc-1k6jcrl-0.imIMYe > div.IconsButtonTray__ItemWrapper-sc-1k6jcrl-4.gIlVoo.WishlistCount.qa-header-wishlist-link > div > span.IconsButtonTray__MenuIconWrapper-sc-1k6jcrl-1.ktRzWe > span
${Wish_List_Page_File_Name}    screenshot_wishlist_page.png


*** Keywords ***
And I delete the product from my wishlist
     [Arguments]    ${Delete_button_of_product_locator}    ${Wishlist_counter_locator}
     Delete Product from Wishlist    ${Delete_button_of_product_locator}
     Wishlist counter should be decremented    ${Wishlist_counter_locator}
     Page Screenshot Capture    ${Wish_List_Page_File_Name}

Delete Product from Wishlist
    [Arguments]  ${Delete_button_of_product_locator}
    click Element    ${Delete_button_of_product_locator}
    sleep   3

Wishlist counter should be decremented
    [Arguments]    ${Wishlist_counter_locator}
    Element should not be visible    ${Wishlist_counter_locator}
