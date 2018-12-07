<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Login</title>
</head>

<body>
    <header class="w3-container w3-teal">
        <h1>KITTING FILE UPLOADER</h1>
    </header>
    <#if errorMsg ??>
        <div class="w3-panel w3-round-xlarge w3-red">
        <span>${errorMsg}</span>
        </div>
    </#if>
    <#if msg ??>
        <div class="w3-panel w3-round-xlarge w3-green">
        <span>${msg}</span>
        </div>
    </#if>
    <div class="w3-container w3-half w3-margin-top">
        <form class="w3-container w3-card-4 w3-light-grey w3-text-blue" method="POST" action="/uploader/login">
            <h2 class="w3-center">Login with your account</h2>
            <p>
                <input name="username" class="w3-input w3-border" type="text" placeholder="Username"
                       style="width:90%" autofocus="true" required></p>
            <p>
                <input name="password" class="w3-input w3-border" type="password" placeholder="Password"
                       style="width:90%" required></p>
            <p>
                <button class="w3-button w3-section w3-teal w3-ripple w3-hover-green"> Log in </button></p>
        </form>
    </div>
</body>
</html>
