*** Settings ***
Resource  ../Resources/setup.robot
Suite Teardown    Close Browser
Force Tags        BrowserStack

*** Test Cases ***
Login Should Failed With Unregistered Mail Address
    #Open LinkedinPage  BROWSER=Chrome  BROWSER_VERSION=47.0  OS=Windows  OS_VERSION=7
    Open LinkedinPage  BROWSER=Chrome  BROWSER_VERSION=47.0  OS=OS X  OS_VERSION=El Capitan
    #Check Title
    Enter User Name
    Enter Wrong Password
    Click Login
    sleep    ${Delay}
    Assert Warning Message
    [Teardown]    Close Browser