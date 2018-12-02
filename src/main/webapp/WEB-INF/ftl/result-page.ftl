<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Upload Files Result</title>
    </head>

    <div style="border: 1px solid #ccc; padding: 5px; margin-bottom: 20px;">

    	<a href="/uploader/home">Home</a> |
        <a href="/uploader/list">List Files</a> |
    	<u> <a onclick="document.forms['logoutForm'].submit()">Logout</a> </u> |

    	<form id="logoutForm" method="POST" action="/uploader/logout">
    	</form>

    </div>

    <h2>Upload Results</h2>

    <body>
        <#if error.isPresent()>
            <p style="color: red;">Error!!! ${error.get()}</p>
        <#else>
            <div>
                <div><b>Files uploaded successfully:</b></div>
                <#list filesUploaded as file>
                <div>
                    ${file}
                </div>
                </#list>
            </div>
        </#if>
    </body>

    <u>
  		<h2 style="color: green;">
        <a href="/uploader/upload">Upload files</a></h3>
  	</u>
</html>
