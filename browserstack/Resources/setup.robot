*** Settings ***
Library           Selenium2Library

*** Variables ***
${Username}       swtestacademy@gmail.com
${Password}       wrongpass
${SiteUrl}        http://www.linkedin.com
${DashboardTitle}    World's Largest Professional Network | LinkedIn
${ExpectedWarningMessage}    Hmm, we don't recognize that email. Please try again.
${WarningMessage}    Login Failed!
${Delay}          5s
${BSUser}   digitalops@wnyc.org
${AccessKey}   N21vdRPwpz6Bynaq3v24
${RemoteUrl}   http://${BSUser}:${AccessKey}@hub.browserstack.com/wd/hub


*** Keywords ***
Open LinkedinPage
    [Arguments]   ${BROWSER}  ${BROWSER_VERSION}  ${OS}  ${OS_VERSION}
    Open Browser   url=${SiteUrl}   browser=${BROWSER}   remote_url=${RemoteURL}   desired_capabilities=browser:${BROWSER},browser_version:${BROWSER_VERSION},os:${OS},os_version:${OS_VERSION}

Maximize Browser
    Maximize Browser Window

Enter User Name
    Input Text   id=login-email    ${Username}

Enter Wrong Password
    Input Text   id=login-password    ${Password}

Click Login
    Click Button   css=[name=submit]

#Check Title
#    Title Should be   ${DashboardTitle}  #There is an encoding problem in this function.

Assert Warning Message
    Element Text Should Be   id=session_key-login-error   ${ExpectedWarningMessage}   ${WarningMessage}