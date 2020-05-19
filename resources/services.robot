***Settings***
Documentation       Aqui nós vamos encapsular algumas chamadas de serviços

Library             RequestsLibrary
Library             Collections
Library             OperatingSystem

Library             libs/db.py

***Keywords***
### Helpers
Get Json
    [Arguments]     ${json_file}

    ${file}=     Get File        ${EXECDIR}/resources/fixtures/${json_file}
    ${json}=     evaluate        json.loads($file)        json  

    [Return]        ${json}

###Keywords




Get Auth Token
    [Arguments]         ${email}            ${pass}

    ${resp}=            Post Token          ${email}            ${pass}

    ${token}            Convert To String   ${resp.json()['token']}


    [Return]            ${token}

Post Token  
    [Arguments]         ${email}            ${pass}

    Create Session      pixel         http://pixel-web:3333

    &{payload}=         Create Dictionary       email=${email}       password=${pass}        
    &{headers}=         Create Dictionary       Content-Type=application/json

    ${resp}=            Post Request    pixel       /auth   data=${payload}     headers=${headers}

    [Return]            ${resp}  


Post Product
    [Arguments]     ${payload}      ${token}

    Remove Product By Title         ${payload['title']}      

    &{headers}=         Create Dictionary       Content-Type=application/json    Authorization=JWT ${token}   

    ${resp}=            Post Request    pixel      /products    data=${payload}    headers=${headers}         

    [Return]            ${resp}

Get Product
    [Arguments]     ${id}       ${token}

    Create Session      pixel         http://pixel-web:3333

    &{headers}=         Create Dictionary       Content-Type=application/json    Authorization=JWT ${token}

    ${resp}             Get Request     pixel   /products/${id}     headers=${headers}

    [Return]        ${resp}

Delete Product
    [Arguments]     ${id}       ${token}

    Create Session      pixel         http://pixel-web:3333

    &{headers}=         Create Dictionary       Content-Type=application/json    Authorization=JWT ${token}

    ${resp}             Delete Request     pixel   /products/${id}     headers=${headers}

    [Return]        ${resp}


