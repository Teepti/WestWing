*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/CommonUtilityKeywords.robot


*** Variables ***
${Text_to_be_search}    Möbel
${Search_input_box}    xpath://*[@id="wwOneHeader"]/div/div[1]/header/div[6]/div[1]/form/input
${Header_Page_File_Name}    screenshot_search_header_section.png
${Accept_Cookies_button}    xpath://*[@id="onetrust-accept-btn-handler"]


*** Keywords ***
When I search for "möbel"
    [Arguments]    ${Text_to_be_search}  ${Search_input_box}  ${Accept_Cookies_button}
    sleep    10
    Handle Accept Cookies popup    ${Accept_Cookies_button}
    Input Search Text and Click Search    ${Text_to_be_search}  ${Search_input_box}
    Page Screenshot Capture    ${Header_Page_File_Name}


