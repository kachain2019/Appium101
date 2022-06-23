*** Settings ***
Library           AppiumLibrary
Resource          ${CURDIR}/../Resource/Keyword/commonKeyword.robot
# Resource          ${CURDIR}/../Resource/Localized/TH/commonLocalized.robot
# Resource          ${CURDIR}/../Resource/Repository/commonRepository.robot
# Resource          ${CURDIR}/../Resource/Variable/commonVariable.robot

*** Test Cases ***
TC1
    Open application youtube on android
    Input music
    Search music
    Select music
    # Verify music name

    # Click Element       ${txt_search} 
    # Input Text          ${txt_input_search}      ${music}
    # Press Keycode       66
    # AppiumLibrary.Wait Until Page Contains Element         ${lbl_music}
    # Click Element       ${lbl_music}
    # Close All Applications

# เปิดแอพ
# พิม
# ค้นหา
# เลือกเพลง
# verify

# Test Open Android app Keyword
#     Open Android app Keyword