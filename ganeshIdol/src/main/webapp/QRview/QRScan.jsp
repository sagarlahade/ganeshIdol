<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	
</head>

<body>
	<input type="file" name="" id="fileId"
		onchange="imageUploaded()">
	<br><br>

	<button onclick="displayString()">
		Display String
	</button>
</body>
<script type="text/javascript">

	let base64String = "";

function imageUploaded() {
	var file = document.querySelector(
		'input[type=file]')['files'][0];

	var reader = new FileReader();
	console.log("next");
	
	reader.onload = function () {
		base64String = reader.result.replace("data:", "")
			.replace(/^.+,/, "");

		imageBase64Stringsep = base64String;

		// alert(imageBase64Stringsep);
		console.log(base64String);
	}
	reader.readAsDataURL(file);
}

function displayString() {
	console.log("Base64String about to be printed");
	UserAction(base64String);
}

function UserAction(base64Img) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
             alert(this.responseText);
         }
    };
    xhttp.open("POST", "BarCodeReader", true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send(base64Img);
}

</script>
</html>