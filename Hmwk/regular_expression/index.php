<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->


<html>
    <head>
        <meta charset="UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <title></title>

    </head>
    <body>
        <h2>regex tester</h2>
        <p>Select Regular Expression! </p>

        <form >
            <select id="regex_list" onchange="regex_input(event)">
                <option value="1. Username">Username</option>
                <option value="2. Password">Password</option>
                <option value="3. Hexadecimal Color Code">Hexadecimal Color Code</option>
                <option value="4. Email">Email</option>
                <option value="5. Image File Extension">Image File Extension</option>
                <option value="6. IP Address">IP Address</option>
                <option value="7(1). Time Format(12H)">Time Format(12H)</option>
                <option value="7(2). Time Format(24H)">Time Format(24H)</option>
                <option value="8. Date">Date</option>
                <option value="9. HTML">HTML</option>
                <option value="10(1). HTML A tag">HTML A tag</option>
                <option value="10(2). Extract HTML link">Extract HTML link</option>
            </select>
        </form>
        


        <FORM ID="demoMatch" NAME="demoMatch" METHOD=POST ACTION="javascript:void(0)">
            <P>Regexp: <INPUT id="regex_input" TYPE=TEXT NAME="regex" VALUE="^[a-z0-9_-]{3,15}$" SIZE=50></P>
            <P>Subject string: <INPUT TYPE=TEXT NAME="subject" 
                                      VALUE="This is a test of the JavaScript RegExp object" SIZE=50></P>
            <P><INPUT TYPE=SUBMIT VALUE="Test Match" ONCLICK="demoMatchClick()">
                <INPUT TYPE=SUBMIT VALUE="Show Match" ONCLICK="demoShowMatchClick()"></P>

            <P>Replacement text: <INPUT TYPE=TEXT NAME="replacement" VALUE="replaced" SIZE=50></P>
            <P>Result: <INPUT TYPE=TEXT NAME="result" 
                              VALUE="click the button to see the result" SIZE=50></P>
            <P><INPUT TYPE=SUBMIT VALUE="Replace" ONCLICK="demoReplaceClick()"></P>
        </FORM>
    </body>
</html>

<SCRIPT LANGUAGE="JavaScript">
    
    function regex_input(e){
        
        var x = document.getElementById("regex_list").selectedIndex;
        var y =['^[a-z0-9_-]{3,15}$',
            '((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})',
            '#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$',
            '^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$',
            '([^\s]+(\.(?i)(jpg|png|gif|bmp))$)',
            '^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])$',
            '(1[012]|[1-9]):[0-5][0-9](\\s)?(?i)(am|pm)',
            '([01]?[0-9]|2[0-3]):[0-5][0-9]',
            '(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/((19|20)\\d\\d)',
            "<(\"[^\"]*\"|'[^']*'|[^'\">])*>",
            '(?i)<a([^>]+)>(.+?)</a>',
            "\\s*(?i)href\\s*=\\s*(\"([^\"]*\")|'[^']*'|([^'\">\\s]+))"
            
        ]
        
        document.getElementById(id="regex_input").value = y[x];
    }
    function demoMatchClick() {
        var re = new RegExp(document.demoMatch.regex.value);
        if (document.demoMatch.subject.value.match(re)) {
            alert("Successful match");
        } else {
            alert("No match");
        }
    }
    function demoShowMatchClick() {
        var re = new RegExp(document.demoMatch.regex.value);
        var m = re.exec(document.demoMatch.subject.value);
        if (m == null) {
            alert("No match");
        } else {
            var s = "Match at position " + m.index + ":\n";
            for (i = 0; i < m.length; i++) {
                s = s + m[i] + "\n";
            }
            alert(s);
        }
    }
    function demoReplaceClick() {
        var re = new RegExp(document.demoMatch.regex.value, "g");
        document.demoMatch.result.value =
                document.demoMatch.subject.value.replace(re,
                        document.demoMatch.replacement.value);
    }
// -->
</SCRIPT>

