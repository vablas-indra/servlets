<!--
       Based on an example from the book 'Pragmatic Ajax'

       Netbeans project from: https://ajaxnetbeans.dev.java.net/
-->

<html>
    <head>
        <script type="text/javascript" src="xhr.js"></script>
        <script type="text/javascript">
var xhr;

function modifyPage() {
    xhr = getXHR();
    xhr.open("GET", "./getMessage", "true");
    xhr.setRequestHeader("User-Agent", "my browser");
    xhr.onreadystatechange= function() {
        if (xhr.readyState != 4) return;
        if (xhr.status == 200) {
            document.getElementById("message").innerHTML = xhr.responseText;
        } else {
            alert("Error processing response with status " + xhr.status);
        }
    }
    xhr.send(null);
}
        </script>
    </head>
    <body>
        <div id="message"></div>
        <button onclick="modifyPage()">Click Me</button>
    </body>
</html>
