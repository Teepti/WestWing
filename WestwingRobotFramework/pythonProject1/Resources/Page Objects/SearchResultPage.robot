*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/CommonUtilityKeywords.robot


*** Variables ***
${Product_listing_page_title}            Möbel online kaufen | Möbel Online Shop | WestwingNow
${product_list_page_screenshot_fileName}    screenshot_product_listing_page.png
${Text_to_be_search}    Möbel
${product_list_locator}    xpath://*[@id="app-root"]/div/div[1]/div[7]/div/div/main/div
${first_product_locator}    xpath://*[@id="app-root"]/div/div[1]/div[7]/div/div/main/div/div[2]/div[1]/a/div/div[2]/div[2]
${login_overlay_text}    Schnell registrieren, damit Sie Ihr Lieblingsprodukt dauerhaft speichern können!
${Counter_Number}    1
${Wishlist_counter_locator}    css:#wwOneHeader > div > div.OneHeader__OneHeaderWrapper-d0qgmn-0.ioEPPS > header > div.IconsButtonTray__Icons-sc-1k6jcrl-0.imIMYe > div.IconsButtonTray__ItemWrapper-sc-1k6jcrl-4.gIlVoo.WishlistCount.qa-header-wishlist-link > div > span.IconsButtonTray__MenuIconWrapper-sc-1k6jcrl-1.ktRzWe > span
${Wishlist_URL}    https://www.westwingnow.de/customer/wishlist/index/
${Wishlist_page_title}    Meine Wunschliste | WestwingNow




*** Keywords ***
Then I should see product listing page with a list of products
    [Arguments]    ${Product_listing_page_title}    ${product_list_page_screenshot_fileName}  ${Text_to_be_search}
    Verify Page Title    ${Product_listing_page_title}
    Verify Search Text on a Page    ${Text_to_be_search}
    Execute JavaScript    window.scrollTo(0, 500)
    Page Screenshot Capture    ${product_list_page_screenshot_fileName}
    Verify list of products on a page    ${product_list_locator}
    Execute JavaScript    window.scrollTo(500, 0)

Verify list of products on a page
    [Arguments]    ${product_list_locator}
    Verify Element on a Page  ${product_list_locator}

When I click on wishlist icon of the first found product
    [Arguments]    ${first_product_locator}
    click Element    ${first_product_locator}

Then I should see the login/registration overlay
    [Arguments]    ${login_overlay_text}
    Verify Search Text on a Page    ${login_overlay_text}

Then the product should be added to the wishlist
     [Arguments]    ${Wishlist_counter_locator}  ${Counter_Number}
     sleep    5
     Verify wishlist counter    ${Wishlist_counter_locator}  ${Counter_Number}

Verify wishlist counter
    [Arguments]    ${Wishlist_counter_locator}  ${Counter_Number}
    Element Text should be  ${Wishlist_counter_locator}    ${Counter_Number}

And I go to the wishlist page
     [Arguments]    ${Wishlist_URL}  ${Wishlist_page_title}
     Navigate To Page    ${Wishlist_URL}
     Verify Page Title    ${Wishlist_page_title}


