<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Files List</title>
    </head>

    <div style="border: 1px solid #ccc; padding: 5px; margin-bottom: 20px;">

    	<a href="/uploader/home">Home</a> |
        List Files |
    	<u> <a onclick="document.forms['logoutForm'].submit()">Logout</a> </u> |

    	<form id="logoutForm" method="POST" action="/uploader/logout">
    	</form>

    </div>

    <h2>Files in Upload Directory</h2>

    <body>
        <#if hasFiles >
            <div>
                <#list files as file>
                    <div>
                    ${file.getName()}
                    </div>
                </#list>
            </div>
        <#else>
            <p style="color: red;">No files found in upload directory</p>
        </#if>
    </body>

    <u>
  		<h2 style="color: green;">
        <a href="/uploader/upload">Upload files</a></h3>
  	</u>
</html>
