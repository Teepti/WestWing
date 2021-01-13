*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}              https://www.westwingnow.de
${BROWSER}          Chrome

*** Keywords ***
Start Test Case
    [Arguments]  ${URL}    ${BROWSER}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --headless
	Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Run Keyword If    os.sep == '/'    Create Webdriver    Chrome    my_alias    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    my_alias    chrome_options=${chrome_options}
    Set Window Size    1200    1000
    #Maximize Browser Window
    sleep  2
    Go To    ${URL}

Finish Test Case
    Close All Browsers

Verify Page Title
    [Arguments]  ${Title}
    Title Should be  ${Title}

Verify Search Text on a Page
    [Arguments]  ${Text}
    Page should contain    ${Text}

Handle Accept Cookies popup
    [Arguments]  ${Locator}
    Click Element  ${Locator}

Input Search Text and Click Search
    [Arguments]  ${Text_to_be_search}  ${Search_input_box}
    Input text  ${Search_input_box}   ${Text_to_be_search}   clear=True
    Press keys  ${Search_input_box}   RETURN
    sleep  2

Verify Element on a Page
    [Arguments]  ${Element_locator}
    page should contain element    ${Element_locator}

Page Screenshot Capture
    [Arguments]  ${FileName}
    Capture page Screenshot    ${FileName}

Navigate To Page
    [Arguments]    ${URL}
    Go To    ${URL}




