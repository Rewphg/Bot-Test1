*** Settings ***
Library     Selenium2Library
Test Setup  เปิด Browser
Test Teardown  Close All Browsers

*** Variables ***
${URL}  http://10.0.1.11
${BROWSWER}  safari
${USER}  member1@webautomate.com
${Password}  password

*** Keywords ***
เปิด Browser
    Open Browser  ${URL}  ${BROWSWER}
    Wait Until Element Is Visible   username

*** Test Cases ***
Fill UsPw
    Input Text  username  ${USER}
    Input Text  password  ${Password}
    Click Element  submit
    Wait Until Page Contains Element  id=toggle-sidebar-btn

No Password
    Input Text  username  ( username)
    Click Element  submit
    Wait Until Page Contains  Login

Capital User
    Input Text  username  MEMBER1@WEBAUTOMATE.COM
    Input Text  password  ${Password}
    Click Element  submit
    Wait Until Page Contains  Login

Start with Capital
    Input Text  username  Member1@webautomate.com
    Input Text  password  ${Password}
    Click Element  submit
    Wait Until Page Contains  Login

Contain only Emoji
    Input Text  username  (😄😅)
    Click Element  submit
    Wait Until Page Contains  Fill in

Contain only regex
    Input Text  username  @#$%^
    Input Text  password  ${Password}
    Click Element  submit
    Wait Until Page Contains  Invalid

User Contain Underscore
    Input Text  username  _${USER}
    Input Text  password  ${Password}
    Click Element  submit
    Wait Until Page Contains  Invalid
Only password
    Input Text  username  ${USER}
    Input Text  password  ${Password}
    Click Element  submit
    Wait Until Page Contains  Login success
Uderscore in middle of username
    Input Text  username  member1_@webautomate.com
    Input Text  password  ${Password}
    Click Element  submit
    Wait Until Page Contains  Invalid
Password Start with Capital
    Input Text  username  ${USER}
    Input Text  password  Password
    Click Element  submit
    Wait Until Page Contains  Invalid
Uppercase password
    Input Text  username  ${USER}
    Input Text  password  PASSWORD 
    Click Element  submit
    Wait Until Page Contains  Invalid
Password with Uderscore
    Input Text  username  ${USER}
    Input Text  password  _password
    Click Element  submit
    Wait Until Page Contains  Invalid