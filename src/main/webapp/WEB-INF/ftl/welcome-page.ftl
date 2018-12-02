<html>
<head>
	<title>Welcome</title>
</head>
<body>
	<div style="border: 1px solid #ccc; padding: 5px; margin-bottom: 20px;">

		Home |
		<a href="/uploader/list">List Files</a> |
		<u> <a onclick="document.forms['logoutForm'].submit()">Logout</a> </u> |

		<form id="logoutForm" method="POST" action="/uploader/logout">
		</form>

	</div>
	<h3>Hello User</h3>
	<u>
		<h2 style="color: green;">
		<a href="/uploader/upload">Upload files</a></h3>
	</u>
</body>
</html>
