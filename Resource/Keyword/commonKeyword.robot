*** Settings ***
Library           AppiumLibrary
Resource          ${CURDIR}/../../Resource/Repository/commonRepository.robot
Resource          ${CURDIR}/../../Resource/Variable/commonVariable.robot
# Resource          ${CURDIR}/../../Resource/Variable/commonVariable.robot

*** Keywords ***
Open application youtube on android
    Open Application    ${REMOTE_URL}     platformName=${PLATFORM_NAME_ANDROID}    
    ...   deviceName=${DEVICE_NAME_ANDROID}      
    ...   appPackage=${APP_PACKAGE}     
    ...   appActivity=${MAIN_ACTIVITY}

Input music
    Wait Until Page Contains Element       ${icn_search}
    Capture Page Screenshot   ${OUTPUTDIR}/CaptureScreens/Home.png
    Click Element       ${icn_search} 
    Input Text          ${txt_search}      ${music_name}

Search music
    Capture Page Screenshot   ${OUTPUTDIR}/CaptureScreens/SearchMusic.png
    Press Keycode       66
    # Wait Until Element Is Visible       ${lbl_select_music}
    # Click Element       ${lbl_select_music}

Click music
     Wait Until Page Contains Element       ${lbl_music}
     Click Element       ${lbl_music}

Verify music name
    ${status_ad}     Run Keyword And Return Status     Wait Until Element Is Visible       ${img_ad}
    Log To Console      ${status_ad}
    IF  '${status_ad}' == 'True'
        Log To Console   Have Ad
        Capture Page Screenshot   ${OUTPUTDIR}/CaptureScreens/AdMusic.png
        ${status_skip_ad}     Run Keyword And Return Status     Wait Until Element Is Visible       ${pnl_skip_ad}
        IF  '${status_skip_ad}' == 'True'
            Click Element       ${pnl_skip_ad}
        ELSE
            Wait Until Element Is Visible       ${img_ad}
            Click Element       ${img_ad}
        END
    ELSE
        Log To Console     Not Ad
    END

Go to ui youtube account page
    Wait Until Page Contains Element    ${icn_account} 
    Click Element    ${icn_account} 

Verify icon ui youtube account page
    Wait Until Page Contains Element        ${pnl_content}
    Page Should Contain Element        ${icn_switch_accounts}
    Page Should Contain Element        ${icn_account_channel}
    Page Should Contain Element        ${icn_your_channel}
    Page Should Contain Element        ${icn_turn_on}
    Page Should Contain Element        ${icn_add_account}
    Page Should Contain Element        ${icn_get_youTube_premium}
    Page Should Contain Element        ${icn_purchases_and_memberships}
    Page Should Contain Element        ${icn_time_watched}
    Page Should Contain Element        ${icn_your_data_in_youTube}
    Page Should Contain Element        ${icn_settings}
    Page Should Contain Element        ${icn_help_and_feedback}
    Page Should Contain Element        ${icn_youTube_studio}
    Page Should Contain Element        ${icn_youtube_music}
    # Page Should Contain Element        ${icn_youtube_kids}
    
Verify menu name ui youtube account page
    [Arguments]     ${list_mnu_name}
    Element Text Should Be      ${mnu_youtube_name}      ${list_mnu_name}[0]
    Element Text Should Be      ${mnu_manage_account}    ${list_mnu_name}[1]
    Capture Page Screenshot     ${OUTPUTDIR}/CaptureScreens/profile1.png
    Swipe By Percent      50   90   50   10
    FOR    ${i}     ${name}    IN ENUMERATE   @{list_mnu_name}
        Log To Console    ${i+2} : ${list_mnu_name}[${i+2}]
        Element Text Should Be      Xpath=//android.widget.LinearLayout[${i+2}]/android.widget.RelativeLayout/android.widget.TextView       ${list_mnu_name}[${i+2}]                
        ${i}    Set Variable    ${i+1}
        Exit For Loop IF    ${i} == ${12}
    END
    Capture Page Screenshot     ${OUTPUTDIR}/CaptureScreens/profile2.png
    Element Text Should Be      ${mnu_privacy_policy}        ${list_mnu_name}[14]
    Element Text Should Be      ${mnu_terms_of_service}      ${list_mnu_name}[15]  
    Click Element       ${btn_close}

Verify ui on page play music
    Wait Until Page Contains Element    ${pnl_onload}
    # Get Element Attribute      Xpath=//android.view.ViewGroup[1]/android.view.ViewGroup        content-desc
    Page Should Contain Element      ${icn_like}
    Page Should Contain Element      ${icn_dislike}
    Page Should Contain Element      ${icn_livechat}
    Page Should Contain Element      ${icn_share}
    Page Should Contain Element      ${icn_create}
    Page Should Contain Element      ${icn_dowload}
    Capture Page Screenshot   ${OUTPUTDIR}/CaptureScreens/ShowMusic1.png
    Swipe By Percent	90	50	10	50	# Swipes screen from right to left.
    Page Should Contain Element      ${icn_clip}
    Page Should Contain Element      ${icn_save}
    Page Should Contain Element      ${icn_profile}
    Page Should Contain Element      ${txt_subscribe}
    Page Should Contain Element      ${icn_explan_comments}
    Page Should Not Contain Element         ${icn_pause_music}
    # Element Attribute Should Match    Xpath=//android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup       content-desc      Subscribe to LIPTAofficial.
    Capture Page Screenshot   ${OUTPUTDIR}/CaptureScreens/ShowMusic2.png
    Swipe By Percent      50   75   50   25
    Capture Page Screenshot   ${OUTPUTDIR}/CaptureScreens/ShowMusic3.png
