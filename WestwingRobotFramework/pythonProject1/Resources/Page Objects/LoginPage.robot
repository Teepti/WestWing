*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/CommonUtilityKeywords.robot


*** Variables ***
${email_input}    xpath:/html/body/div[1]/div/div[2]/div/div[1]/div/div[2]/form/div[1]/input
${password_input}    xpath://*[@id="app-root"]/div/div[2]/div/div[1]/div/div[2]/form/div[2]/input
${username}    teeptisachdeva@gmail.com
${password}    Acc0unt@westwing2705
${receive_info_mails_checkbox}    xpath://*[@id="app-root"]/div/div[2]/div/div[1]/div/div[2]/form/div[3]/label[1]/input
${Terms_condition_checkbox}    xpath://*[@id="app-root"]/div/div[2]/div/div[1]/div/div[2]/form/div[3]/label[2]/input
${Register_Button}    xpath://*[@id="app-root"]/div/div[2]/div/div[1]/div/div[2]/form/button
${Product_listing_page_title}            Möbel online kaufen | Möbel Online Shop | WestwingNow
${Login_File_Name}    screenshot_login_register_overlay.png




*** Keywords ***
When I switch to login form of the overlay and log in with credentials
    [Arguments]    ${email_input}  ${password_input}  ${username}  ${password}  ${Terms_condition_checkbox}  ${receive_info_mails_checkbox}  ${Register_Button}
    Page Screenshot Capture    ${Login_File_Name}
    Enter username in login form    ${email_input}  ${username}
    Enter password in login form    ${password_input}  ${password}
    Accept emails received checkbox    ${receive_info_mails_checkbox}
    Accept Terms and Conditions    ${Terms_condition_checkbox}
    Submit Login Form    ${Register_Button}
    Title should be remain same as before login    ${Product_listing_page_title}

Enter username in login form
    [Arguments]    ${email_input}  ${username}
    Input text    ${email_input}    ${username}

Enter password in login form
    [Arguments]    ${password_input}    ${password}
    Input password    ${password_input}  ${password}

Accept Terms and Conditions
    [Arguments]    ${Terms_condition_checkbox}
    select checkbox    ${Terms_condition_checkbox}

Accept emails received checkbox
    [Arguments]    ${receive_info_mails_checkbox}
    select checkbox    ${receive_info_mails_checkbox}

Submit Login Form
    [Arguments]    ${Register_Button}
    click Element    ${Register_Button}

Title should be remain same as before login
    [Arguments]    ${Product_listing_page_title}
    Title should Be  ${Product_listing_page_title}





