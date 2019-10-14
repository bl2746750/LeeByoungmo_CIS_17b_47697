/*
 * Modified from https://www.w3schools.com/js/js_cookies.asp
 * Dr. Mark E. Lehr
 * 
 */

function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
  var expires = "expires="+d.toUTCString();
//  document.write("<br>~~~~~~~~~~~~~~"+cvalue+"<br>");
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
    var c = ca[i];
    
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
//      document.write("<br>~~~~~~~~~~~~~~"+c+"<br>");
    }
    if (c.indexOf(name) == 0) {
//        document.write("<br>======"+c.substring((name.length,c.length))+"<br>");
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

function checkCookie(cname) {
    var value = getCookie(cname);
    if (value != "") {
        alert("Cookie Name = " + name + "Value = " + value);
    } else {
        value = prompt("Please enter your cookie :"+cname+" Value", "");
        if (value != "" && value != null) {
            setCookie(cname, value, 365);
        }
    }
}