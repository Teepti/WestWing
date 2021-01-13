*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/CommonUtilityKeywords.robot
Resource    ../Resources/Page Objects/Homepage.robot
Resource    ../Resources/Page Objects/SearchResultPage.robot
Resource    ../Resources/Page Objects/LoginPage.robot
Resource    ../Resources/Page Objects/HeaderPage.robot
Resource    ../Resources/Page Objects/WishlistPage.robot

Test Setup    Start Test Case    ${URL}  ${BROWSER}
#Test Teardown    Finish Test Case


*** Test Cases ***
Westwing Look Feature
    Given I am on the WestwingNow home page  ${Home_page_title}
    When I search for "möbel"    ${Text_to_be_search}  ${Search_input_box}  ${Accept_Cookies_button}
    Then I should see product listing page with a list of products    ${Product_listing_page_title}  ${product_list_page_screenshot_fileName}  ${Text_to_be_search}
    When I click on wishlist icon of the first found product    ${first_product_locator}
    Then I should see the login/registration overlay    ${login_overlay_text}
    When I switch to login form of the overlay and log in with credentials    ${email_input}  ${password_input}  ${username}  ${password}  ${Terms_condition_checkbox}  ${receive_info_mails_checkbox}  ${Register_Button}
    Then the product should be added to the wishlist    ${Wishlist_counter_locator}  ${Counter_Number}
    And I go to the wishlist page    ${Wishlist_URL}  ${Wishlist_page_title}
    And I delete the product from my wishlist    ${Delete_button_of_product_locator}    ${Wishlist_counter_locator}


