*** Settings ***
Library           AppiumLibrary
Library           BuiltIn
Resource          ${CURDIR}/../../Resource/Repository/commonRepository.robot
Resource          ${CURDIR}/../../Resource/Variable/commonVariable.robot

*** Keywords ***
Open Android app Keyword
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_ANDROID}    deviceName=${DEVICE_NAME_ANDROID}      appPackage=${APP_PACKAGE}     appActivity=${ACTIVITY}
    Click Element       xpath=//android.widget.ImageView[@content-desc="ค้นหา"]
    Input Text      id=com.google.android.youtube:id/search_edit_text     ทักครับ
    Press Keycode      66
    Wait Until Page Contains Element   android=UiSelector().descriptionContains("ทักครับ - Lipta Feat. GUYGEEGEE [OFFICIAL MUSIC VIDEO]")
    Click Element       android=UiSelector().descriptionContains("ทักครับ - Lipta Feat. GUYGEEGEE [OFFICIAL MUSIC VIDEO]")

Open application youtube on android
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_ANDROID}    deviceName=${DEVICE_NAME_ANDROID}      appPackage=${APP_PACKAGE}     appActivity=${MAIN_ACTIVITY}

Input music
    Click Element       ${txt_search} 
    Input Text          ${txt_input_search}      ${music}

Search music
    Press Keycode       66
    # Click Element       Xpath=//*[@resource-id="com.google.android.youtube:id/text"][text()="ทักครับ"]
    # Wait Until Page Contains Element      Xpath=//android.widget.LinearLayout[0]
    # Click Element       Xpath=//android.widget.LinearLayout[0]
    # Click Element       //android.widget.LinearLayout[@content-desc="Back"])[1]

Select music
     Wait Until Page Contains Element       ${lbl_music}
     Click Element       ${lbl_music}

Verify music name
    Wait Until Page Contains Element        ${lbl_name_music}
    ${title_music}         Get Text       ${lbl_name_music}
    Log Source      ${title_music}    
    Element Text Should Be        ${lbl_name_music}          ทักครับ - Lipta Feat. GUYGEEGEE [OFFICIAL MUSIC VIDEO]
