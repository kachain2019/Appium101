*** Settings ***
Library           AppiumLibrary
Resource          ${CURDIR}/../Resource/Keyword/commonKeyword.robot

*** Test Cases ***
TC1 - Verify play music is correct
    Open application youtube on android
    Go to ui youtube account page
    Verify name ui youtube account [EN] page


# เปิดแอพ
# พิม
# ค้นหา
# เลือกเพลง
# verify
