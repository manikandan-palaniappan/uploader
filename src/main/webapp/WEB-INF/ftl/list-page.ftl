<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Files List</title>
    </head>

    <div class="w3-container w3-teal">
        <h1>KITTING FILE UPLOADER</h1>
    </div>

    <div class="w3-bar w3-cyan">
        <a href="/uploader/home" class="w3-bar-item w3-hover-green w3-button">Home</a>
        <a class="w3-bar-item w3-button w3-dark-grey">List Files</a>
        <u><a onclick="document.forms['logoutForm'].submit()" class="w3-bar-item w3-hover-green w3-button w3-right">Logout</a> </u>
        <form id="logoutForm" method="POST" action="/uploader/logout">
        </form>
    </div>

    <h3>Files in Upload Directory</h3>

    <body class="w3-light-grey">
        <#if hasFiles >
            <div>
                <#list files as file>
                    <div>
                    ${file.getName()}
                    </div>
                </#list>
            </div>
        <#else>
        <div class="w3-panel w3-round-xlarge w3-yellow">
            <span>No files found in upload directory</span>
        </div>
        </#if>

        <p>
            <a class="w3-button w3-section w3-teal w3-ripple w3-hover-green" href="/uploader/upload">Upload More Files</a>
        </p>

        <div class="w3-container w3-teal w3-bottom">
            <p>Essilor</p>
        </div>

    </body>
</html>
