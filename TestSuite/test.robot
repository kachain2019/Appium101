*** Settings ***
Library           AppiumLibrary
Resource          ${CURDIR}/../Resource/Keyword/commonKeyword.robot

*** Test Cases ***
TC1 - Verify play music is correct
    Open application youtube on android
    Go to ui youtube account page
    Verify icon ui youtube account page
    Verify menu name ui youtube account page         ${list_mnu_en}
    # Input music
    # Search music
    # Click music
    # Verify music name
    # Verify ui on page play music [EN]
