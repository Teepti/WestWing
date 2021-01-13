*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/CommonUtilityKeywords.robot

*** Variables ***
${URL}              https://www.westwingnow.de
${BROWSER}          Chrome
${Home_page_title}    Ihr Möbel & Interior Online-Shop | WestwingNow
${Home_Page_File_Name}    screenshot_home_page.png


*** Keywords ***
Given I am on the WestwingNow home page
    [Arguments]  ${Home_page_title}
    #Handle Accept Cookies popup    ${Accept_Cookies_button}
    Verify Page Title    ${Home_page_title}
    Page Screenshot Capture    ${Home_Page_File_Name}



