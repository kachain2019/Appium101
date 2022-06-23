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
    Verify music name

# เปิดแอพ
# พิม
# ค้นหา
# เลือกเพลง
# verify
