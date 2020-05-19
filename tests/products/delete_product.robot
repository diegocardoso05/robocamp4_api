***Settings***
Documentation    Pixel API DELETE    /products 


Resource    ../../resources/services.robot


***Test Cases***
Delete Product
    [Tags]    success

    ${token}=       Get Auth Token      papito@ninjapixel.com    pwd123
    ${payload}=     Get Json            delete.json      
    ${product}=     Post Product        ${payload}               ${token}

    ${id}=      Convert To String    ${product.json()['id']}
    ${resp}=    Delete Product       ${id}    ${token}    

    Status Should Be    204    ${resp}  
