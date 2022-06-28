*** Settings ***
Library           AppiumLibrary
Resource          ${CURDIR}/../Resource/Keyword/commonKeyword.robot
Resource          ${CURDIR}/../Resource/Localized/EN/commonLocalized.robot
Resource          ${CURDIR}/../Resource/Localized/TH/commonLocalized.robot

*** Test Cases ***
TC1 - Verify play music is correct
    Open application youtube on android
    Go to ui youtube account page
    Verify icon ui youtube account page
    Verify menu name ui youtube account page         ${list_mnu_th}
    Input music
    Search music
    Click music
    Verify music name
    Verify ui on page play music
