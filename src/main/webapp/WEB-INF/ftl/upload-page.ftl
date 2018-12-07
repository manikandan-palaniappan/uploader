<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Upload Files</title>
    </head>

    <div class="w3-container w3-teal">
        <h1>KITTING FILE UPLOADER</h1>
    </div>

    <div class="w3-bar w3-cyan">
        <a href="/uploader/home" class="w3-bar-item w3-hover-green w3-button">Home</a>
        <a href="/uploader/list" class="w3-bar-item w3-hover-green w3-button">List Files</a>
        <u><a onclick="document.forms['logoutForm'].submit()" class="w3-bar-item w3-hover-green w3-button w3-right">Logout</a> </u>
        <form id="logoutForm" method="POST" action="/uploader/logout">
        </form>
    </div>

    <div id="errorDiv" class="w3-panel w3-round-xlarge w3-red" style="display: none;">
        <span id="errorMsg"></span>
    </div>
    <div id="uploadingDiv" class="w3-panel w3-round-xlarge w3-light-green" style="display: none;">
        <span id="uploadInProcessMsg"></span>
    </div>

    <h3>Upload Files to Server (Max 1GB files)</h3>

    <body onload="updateSize();" class="w3-light-grey">
        <form id="uploadForm" name="uploadingForm" enctype="multipart/form-data" action="/uploader/upload" method="POST" onsubmit="return validateForm()">
            <p>
                <input id="fileInput" type="file" name="uploadingFiles" onchange="updateSize();" multiple>
                selected files: <span id="fileNum">0</span>;
                total size: <span id="fileSize">0</span>;
            </p>
            <p>
                <input id="uploadButton" class="w3-button w3-teal w3-hover-green w3-ripple" type="submit" value="Upload">
            </p>

        </form>

        <script>
            function updateSize() {

                //resetting the forms elements
                document.getElementById('errorMsg').innerHTML="";
                document.getElementById('fileNum').innerHTML="0";
                document.getElementById('fileSize').innerHTML="0";
                document.getElementById("errorDiv").style.display="none";
                document.getElementById("uploadingDiv").style.display="none";

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
                    document.getElementById("errorDiv").style.display="block";
                } else {
                    document.getElementById("fileNum").innerHTML = nFiles;
                    document.getElementById("fileSize").innerHTML = sOutput;
                }
            }

            function validateForm() {

                var nBytes = 0,
                    oFiles = document.getElementById("fileInput").files,
                    nFiles = oFiles.length;
                for (var nFileId = 0; nFileId < nFiles; nFileId++) {
                    nBytes += oFiles[nFileId].size;
                }

                if (nBytes > 0) {
                    document.getElementById("uploadInProcessMsg").innerText = "Upload in Progress....... Please Wait";
                    document.getElementById("uploadingDiv").style.display="block";
                    document.getElementById("uploadButton").disabled = true;
                    return true;
                } else {
                    document.getElementById('errorMsg').innerHTML = "Error!!! Select atleast one file to upload";
                    document.getElementById("errorDiv").style.display="block";
                    return false;
                }
            }
        </script>

        <div class="w3-container w3-teal w3-bottom">
            <p>Essilor</p>
        </div>
    </body>
</html>
