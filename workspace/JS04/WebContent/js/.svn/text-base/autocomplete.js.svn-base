var isIE;
var req;
var names;
var target;

function getElementX(element){
    var targetLeft = 0;
    if (element.offsetParent) {
        while (element.offsetParent) {
            targetLeft += element.offsetLeft;
            element = element.offsetParent;
        }
    } else if (element.x) {
        targetLeft += element.x;
    }
    return targetLeft;
}
        
function getElementY(element){
    var targetTop = 0;
    if (element.offsetParent) {
        while (element.offsetParent) {
            targetTop += element.offsetTop;
            element = element.offsetParent;
        }
    } else if (element.y) {
        targetTop += element.y;
    }
    return targetTop;
}
    
function init() {
    target = document.getElementById("complete-field");
    var popup = document.getElementById("menu-popup");
    popup.style.top = (getElementY(target) + target.offsetHeight) + "px";
    popup.style.left = getElementX(target) + "px";
}
    
function initRequest(url) {
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        req = new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function doCompletion() {
    var url = "autocomplete?action=complete&id=" + escape(target.value);
    initRequest(url);
    req.onreadystatechange = processRequest;
    req.open("GET", url, true);
    req.send(null);
}

function processRequest() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessages();
        } else if (req.status == 204){
            clearTable();
        }
    }
}

function parseMessages() {
    if (!names) {
        names = document.getElementById("names");
    }
    clearTable();
    var employees = req.responseXML.getElementsByTagName("employees")[0];
    for (loop = 0; loop < employees.childNodes.length; loop++) {
        var employee = employees.childNodes[loop];
        var firstName = employee.getElementsByTagName("firstName")[0];
        var lastName = employee.getElementsByTagName("lastName")[0];
        var employeeId = employee.getElementsByTagName("id")[0];
        appendEmployee(firstName.childNodes[0].nodeValue,
                       lastName.childNodes[0].nodeValue, 
                       employeeId.childNodes[0].nodeValue);
    }
}

function clearTable() {
    if (names) {
        for (loop = names.childNodes.length -1; loop >= 0 ; loop--) {
            names.removeChild(names.childNodes[loop]);
        }
    }
}

function appendEmployee(firstName,lastName,employeeId) {
    var firstNameCell;
    var lastNameCell;
    if (isIE) {
        row = names.insertRow(names.rows.length);
        nameCell = row.insertCell(0);
    } else {
        row = document.createElement("tr");
        nameCell = document.createElement("td");
        row.appendChild(nameCell);
        names.appendChild(row);
    }
    row.setAttribute("border", "0");
    nameCell.setAttribute("onmouseout", "this.className='mouseOver';");
    nameCell.setAttribute("onmouseover", "this.className='mouseOut';");
    nameCell.setAttribute("bgcolor", "#FFFAFA");
    nameCell.setAttribute("border", "0");
    var linkElement = document.createElement("a");
    linkElement.setAttribute("style", "text-decoration: none "); 
    linkElement.setAttribute("href", "autocomplete?action=lookup&id=" + employeeId);
    var nameFontElement = document.createElement("font");
    nameFontElement.setAttribute("size", "+1");
    nameFontElement.setAttribute("color", "black");
    nameFontElement.appendChild(document.createTextNode(firstName + " " + lastName));
    linkElement.appendChild(nameFontElement);
    nameCell.appendChild(linkElement);
}