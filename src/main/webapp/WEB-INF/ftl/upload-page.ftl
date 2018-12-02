<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Upload Files</title>
    </head>

    <div style="border: 1px solid #ccc; padding: 5px; margin-bottom: 20px;">

    	<a href="/uploader/home">Home</a> |
        <a href="/uploader/list">List Files</a> |
    	<u> <a onclick="document.forms['logoutForm'].submit()">Logout</a> </u> |

    	<form id="logoutForm" method="POST" action="/uploader/logout">
    	</form>

    </div>

    <h2>Upload files to server (Max 1GB files)</h2>

    <body onload="updateSize();">
        <form id="uploadForm" name="uploadingForm" enctype="multipart/form-data" action="/uploader/upload" method="POST" onsubmit=uploadInProgress()>
            <p>
                <input id="fileInput" type="file" name="uploadingFiles" onchange="updateSize();" multiple>
                selected files: <span id="fileNum">0</span>;
                total size: <span id="fileSize">0</span>;
            </p>
            <p>
                <input type="submit" value="Upload files">
            </p>
            <span id="errorMsg" style="color: red;"> </span>
            <span id="uploadInProcessMsg" style="color: #ff8843;"> </span>
        </form>

        <script>
            function updateSize() {
                document.getElementById('errorMsg').innerHTML="";
                var nBytes = 0,
                        oFiles = document.getElementById("fileInput").files,
                        nFiles = oFiles.length;
                for (var nFileId = 0; nFileId < nFiles; nFileId++) {
                    nBytes += oFiles[nFileId].size;
                }

                var sOutput = nBytes + " bytes";
                // optional code for multiples approximation
                for (var aMultiples = ["KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB"], nMultiple = 0, nApprox = nBytes / 1024; nApprox > 1; nApprox /= 1024, nMultiple++) {
                    sOutput = nApprox.toFixed(3) + " " + aMultiples[nMultiple] + " (" + nBytes + " bytes)";
                }
                // end of optional code

                if(nBytes > 1073741824) {
                    document.getElementById("uploadForm").reset();
                    document.getElementById('errorMsg').innerHTML = "Maximum upload size exceeded. Must be less than 1GB";
                } else {
                    document.getElementById("fileNum").innerHTML = nFiles;
                    document.getElementById("fileSize").innerHTML = sOutput;
                }
            }

            function uploadInProgress() {

                var nBytes = 0,
                    oFiles = document.getElementById("fileInput").files,
                    nFiles = oFiles.length;
                for (var nFileId = 0; nFileId < nFiles; nFileId++) {
                    nBytes += oFiles[nFileId].size;
                }

                if (nBytes > 0) {
                    document.getElementById("uploadInProcessMsg").innerText = "Upload in Progress....... Please Wait"
                }
            }
        </script>
    </body>
</html>
