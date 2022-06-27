*** Settings ***
Library           AppiumLibrary
Resource          ${CURDIR}/../../Resource/Repository/commonRepository.robot
Resource          ${CURDIR}/../../Resource/Variable/commonVariable.robot

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
    # Wait Until Element Is Visible        ${lbl_name_music}
    # ${title_music}      Get WebElement 	      ${lbl_name_music}
    # Log To Console      ${title_music}    
    # Element Text Should Be      ${lbl_name_music}       ${music_name
    ${status_ad}     Run Keyword And Return Status     Wait Until Element Is Visible       ${img_ad}
    Log To Console      ${status_ad}
    IF  '${status_ad}' == 'True'
        Log To Console   Have ad
        Capture Page Screenshot   ${OUTPUTDIR}/CaptureScreens/AdMusic.png
        Wait Until Element Is Visible       ${pnl_skip_ad}
        Click Element       ${pnl_skip_ad}
    ELSE
        Log To Console     Not ad
    END

Go to ui youtube account page
    Wait Until Page Contains Element    ${icn_account} 
    Click Element    ${icn_account} 

Verify locator ui youtube account [EN] page
    Element Text Should Be      ${lbl_en_youtube_name}      com.google.android.youtube:id/account_name
    # Element Attribute Should Match      //android.widget.LinearLayout[@resource-id]     resource-id      com.google.android.youtube:id/account_name

Verify icon ui youtube account [EN] page
    Wait Until Page Contains Element        ${pnl_content}
    Get Element Location        ${icn_en_switch_accounts}
    Get Element Location        ${icn_en_account_channel}
    Get Element Location        ${icn_en_your_channel}
    Get Element Location        ${icn_en_turn_on}
    Get Element Location        ${icn_en_add_account}
    Get Element Location        ${icn_en_get_youTube_premium}
    Get Element Location        ${icn_en_purchases_and_memberships}
    Get Element Location        ${icn_en_time_watched}
    Get Element Location        ${icn_en_your_data_in_youTube}
    Get Element Location        ${icn_en_settings}
    Get Element Location        ${icn_en_help_and_feedback}
    Get Element Location        ${icn_en_youTube_studio}
    Get Element Location        ${icn_en_youtube_music}

Verify menu name ui youtube account [EN] page
    Element Text Should Be      ${mnu_en_youtube_name}      ONE COOL COOL
    Element Text Should Be      ${mnu_en_manage_account}    Manage your Google Account
    Element Text Should Be      ${mnu_en_turn_on}      Turn on Incognito
    Element Text Should Be      ${mnu_en_add_account}      Add account
    Element Text Should Be      ${mnu_en_get_youTube_premium}      Get YouTube Premium
    Element Text Should Be      ${mnu_en_purchases_and_memberships}      Purchases and memberships
    Element Text Should Be      ${mnu_en_time_watched}      Time watched
    Element Text Should Be      ${mnu_en_your_data_in_youTube}      Your data in YouTube
    Element Text Should Be      ${mnu_en_settings}      Settings
    Element Text Should Be      ${mnu_en_help_and_feedback}      Help & feedback
    Element Text Should Be      ${mnu_en_youtube_studio}        YouTube Studio
    Element Text Should Be      ${mnu_en_youtube_music}         YouTube Music
    Element Text Should Be      ${mnu_en_privacy_policy}        Privacy Policy
    Element Text Should Be      ${mnu_en_terms_of_service}        Terms of Service
    Capture Page Screenshot     ${OUTPUTDIR}/CaptureScreens/profile.png
    Click Element       ${btn_close}

Verify ui on page play music [EN]
    Wait Until Page Contains Element    ${pnl_onload}
    # Get Element Attribute      Xpath=//android.view.ViewGroup[1]/android.view.ViewGroup        content-desc
    Get Element Location      ${icn_like}
    Get Element Location      ${icn_dislike}
    Get Element Location      ${icn_livechat}
    Get Element Location      ${icn_share}
    Get Element Location      ${icn_create}
    Get Element Location      ${icn_dowload}
    Capture Page Screenshot   ${OUTPUTDIR}/CaptureScreens/ShowMusic.png
