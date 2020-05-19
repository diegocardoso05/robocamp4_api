*** Settings ***
Library               Collections
Library               RequestsLibrary

*** Test Cases ***
Post Auth Token
    Create Session    pixel            http://pixel-web:3333

    # {email: "papito@ninjapixel.com", password: "pwd123"}
    # {"Content-Type": "application/json"}

    &{payload}=     Create Dictionary       email=papito@ninjapixel.com        password=pwd123        
    &{headers}=     Create Dictionary       Content-Type=application/json


    ${resp}=            Post Request      pixel       /auth       data=${payload}     headers=${headers}
    Status Should Be    200               ${resp}
    Log           ${resp.text}


Unauthorized
    Create Session    pixel            http://pixel-web:3333

    &{payload}=     Create Dictionary       email=papito@ninjapixel.com        password=asc123        
    &{headers}=     Create Dictionary       Content-Type=application/json


    ${resp}=            Post Request      pixel       /auth       data=${payload}     headers=${headers}
    Status Should Be    401               ${resp}
    Log           ${resp.text}