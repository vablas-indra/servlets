<%-- Copyright 2005 Sun Microsystems, Inc. All rights reserved. You may not 
modify, use, reproduce, or distribute this software except in compliance with 
the terms of the License at: http://developer.sun.com/berkeley_license.html
$Id: index.jsp,v 1.4 2005/05/01 18:01:05 tnorbye Exp $ --%>

<html>
    <head>
        <link rel="stylesheet" href="css/autocomplete.css"/>
        <script type="text/javascript" src="js/autocomplete.js"> </script>
        <title>Auto-Completion using Asynchronous JavaScript and XML (AJAX)</title>
    </head>
    <body onload="init()">
        
        <h1>Auto-Completion using Asynchronous JavaScript and XML (AJAX)</h1>
        <hr/>
        <p>
            This example shows how you can do real time auto-completion using 
            AJAX interactions.
        </p>
        <p>
            In the form below enter a name. Possible names that will be completed 
            are displayed beneath the form. 
            Click on one of the selections to see the employee details. 
            Try typing &quot;Greg&quot, &quot;Murray&quot;, &quot;Jones&quot;, 
            or "&quot;Cindy&quot;.
        </p>
        
        <form name="autofillform" action="autocomplete" method="get">
            <input type="hidden" name="action" value="lookupbyname"/>
            <table border="0" cellpadding="5" cellspacing="0">
                <tr>
                    <td><b>Employee Name:</b></td>
                    <td>
                        <input    type="text"
                                  size="20"  
                                  id="complete-field"
                                  name="id"
                                  onkeyup="doCompletion();">
                    </td>
                    <td align="left">
                        <input id="submit_btn" type="Submit" value="Lookup Employee">
                    </td>
                </tr>
            </table>
        </form>
        <div style="position: absolute; top:170px;left:140px" id="menu-popup">
            <table id="names"
                   bgcolor="#FFFAFA"
                   border="1"
                   bordercolor="black"
                   cellspacing="0" 
                   cellpadding="0"/>
        </div>
    </body>
</html>
