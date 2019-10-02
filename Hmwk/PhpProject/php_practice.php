<!DOCTYPE html>
<html>
    <body>

        <?php
        ECHO "Hello World!<br>";
        echo "Hello World!<br>";
        EcHo "Hello World!<br>";
        ?> 

        <?php
        $txt = "Hello world!";
        $x = 5;
        $y = 10.5;

        echo $txt;
        echo "<br>";
        echo $x;
        echo "<br>";
        echo $y;
        ?>

        <?php
        $txt = "W3Schools.com";
        echo "I love $txt!";
        ?>

        <?php
        $x = 5;
        $y = 4;
        echo $x + $y;
        ?>

        <?php
        $x = 5; // global scope

        function myTest1() {
            // using x inside this function will generate an error
            echo "<p>Variable x inside function is: $x</p>";
        }

        myTest1();

        echo "<p>Variable x outside function is: $x</p>";
        ?>
        <?php

        function myTest2() {
            $x = 5; // local scope
            echo "<p>Variable x inside function is: $x</p>";
        }

        myTest2();

// using x outside the function will generate an error
        echo "<p>Variable x outside function is: $x</p>";
        ?>

        <?php
        $x = 5;
        $y = 10;

        function myTest3() {
            global $x, $y;
            $y = $x + $y;
        }

        myTest3();  // run function
        echo $y; // output the new value for variable $y
        ?>
        <?php
        $x = 5;
        $y = 10;

        function myTest4() {
            $GLOBALS['y'] = $GLOBALS['x'] + $GLOBALS['y'];
        }

        myTest4();
        echo $y;
        ?>


        <?php

        function myTest5() {
            static $x = 0;
            echo $x;
            $x++;
        }

        myTest5();
        echo "<br>";
        myTest5();
        echo "<br>";
        myTest5();
        ?> 

        <?php
        echo "<h2>PHP is Fun!</h2>";
        echo "Hello world!<br>";
        echo "I'm about to learn PHP!<br>";
        echo "This ", "string ", "was ", "made ", "with multiple parameters.";
        ?> 

        <?php
        $txt1 = "Learn PHP";
        $txt2 = "W3Schools.com";
        $x = 5;
        $y = 4;

        echo "<h2>" . $txt1 . "</h2>";
        echo "Study PHP at " . $txt2 . "<br>";
        echo $x + $y;
        ?>
        <?php
        print "<h2>PHP is Fun!</h2>";
        print "Hello world!<br>";
        print "I'm about to learn PHP!";
        ?> 
        <?php
        $x = "Hello world!";
        $y = 'Hello world!';

        echo $x;
        echo "<br>";
        echo $y;
        ?>

        <?php
        $x = 5985;
        var_dump($x);
        ?>  

        <?php
        $x = 10.365;
        var_dump($x);
        ?> 

        <?php
        $cars = array("Volvo", "BMW", "Toyota");
        var_dump($cars);
        ?>  

        <?php

        class Car {

            function Car() {
                $this->model = "VW";
            }

        }

// create an object
        $herbie = new Car();

// show object properties
        echo $herbie->model;
        ?>

        <?php
        $x = "Hello world!";
        $x = null;
        var_dump($x);
        ?>

        <?php
        echo strlen("Hello world!");
        ?> 

        <?php
        echo str_word_count("Hello world!");
        ?>

        <?php
        echo strrev("Hello world!");
        ?>

        <?php
        echo strpos("Hello world!", "world");
        ?>

        <?php
        echo str_replace("world", "Dolly", "Hello world!");
        ?> 

        <?php
// Check if the type of a variable is integer   
        $x = 5985;
        var_dump(is_int($x));

        echo "<br>";

// Check again... 
        $x = 59.85;
        var_dump(is_int($x));
        ?>  

        <?php
// Check if the type of a variable is float 
        $x = 10.365;
        var_dump(is_float($x));
        ?> 

        <?php
// Check if a numeric value is finite or infinite 
        $x = 1.9e411;
        var_dump($x);
        ?>

        <?php
// Invalid calculation will return a NaN value
        $x = acos(8);
        var_dump($x);
        ?> 

        <?php
// Check if the variable is numeric   
        $x = 5985;
        var_dump(is_numeric($x));

        echo "<br>";

        $x = "5985";
        var_dump(is_numeric($x));

        echo "<br>";

        $x = "59.85" + 100;
        var_dump(is_numeric($x));

        echo "<br>";

        $x = "Hello";
        var_dump(is_numeric($x));
        ?>  


        <?php
// Cast float to int 
        $x = 23465.768;
        $int_cast = (int) $x;
        echo $int_cast;

        echo "<br>";

// Cast string to int
        $x = "23465.768";
        $int_cast = (int) $x;
        echo $int_cast;
        ?>  


        <?php
// case-sensitive constant name
        define("GREETING", "Welcome to W3Schools.com!");
        echo GREETING;
        ?> 


        <?php
// case-insensitive constant name
        define("GREETING", "Welcome to W3Schools.com!", true);
        echo greeting;
        ?> 


        <?php
        define("cars", [
            "Alfa Romeo",
            "BMW",
            "Toyota"
        ]);
        echo cars[0];
        ?> 


        <?php
        define("GREETING", "Welcome to W3Schools.com!");

        function myTest6() {
            echo GREETING;
        }

        myTest6();
        ?> 

        <?php
        $t = date("H");

        if ($t < "20") {
            echo "Have a good day!";
        }
        ?>


        <?php
        $t = date("H");

        if ($t < "20") {
            echo "Have a good day!";
        } else {
            echo "Have a good night!";
        }
        ?>


        <?php
        $t = date("H");
        echo "<p>The hour (of the server) is " . $t;
        echo ", and will give the following message:</p>";

        if ($t < "10") {
            echo "Have a good morning!";
        } elseif ($t < "20") {
            echo "Have a good day!";
        } else {
            echo "Have a good night!";
        }
        ?>


        $favcolor = "red";

        switch ($favcolor) {
        case "red":
        echo "Your favorite color is red!";
        break;
        case "blue":
        echo "Your favorite color is blue!";
        break;
        case "green":
        echo "Your favorite color is green!";
        break;
        default:
        echo "Your favorite color is neither red, blue, nor green!";
        }
        ?>

        <?php
        $x = 1;

        while ($x <= 5) {
            echo "The number is: $x <br>";
            $x++;
        }
        ?>  


        <?php
        $x = 1;

        do {
            echo "The number is: $x <br>";
            $x++;
        } while ($x <= 5);
        ?>


        <?php
        $x = 6;

        do {
            echo "The number is: $x <br>";
            $x++;
        } while ($x <= 5);
        ?>


        <?php
        for ($x = 0; $x <= 10; $x++) {
            echo "The number is: $x <br>";
        }
        ?> 


        <?php
        $colors = array("red", "green", "blue", "yellow");

        foreach ($colors as $value) {
            echo "$value <br>";
        }
        ?>  


        <?php

        function writeMsg() {
            echo "Hello world!";
        }

        writeMsg();
        ?>


        <?php

        function familyName($fname) {
            echo "$fname Refsnes.<br>";
        }

        familyName("Jani");
        familyName("Hege");
        familyName("Stale");
        familyName("Kai Jim");
        familyName("Borge");
        ?>

        <?php

        function familyName1($fname, $year) {
            echo "$fname Refsnes. Born in $year <br>";
        }

        familyName1("Hege", "1975");
        familyName1("Stale", "1978");
        familyName1("Kai Jim", "1983");
        ?>


        <?php

        function addNumbers(int $a, int $b) {
            return $a + $b;
        }

        echo addNumbers(5, "5 days");
// since strict is NOT enabled "5 days" is changed to int(5), and it will return 10
        ?>

       
        <?php

        function setHeight(int $minheight = 50) {
            echo "The height is : $minheight <br>";
        }

        setHeight(350);
        setHeight();
        setHeight(135);
        setHeight(80);
        ?>


        <?php

        function sum(int $x, int $y) {
            $z = $x + $y;
            return $z;
        }

        echo "5 + 10 = " . sum(5, 10) . "<br>";
        echo "7 + 13 = " . sum(7, 13) . "<br>";
        echo "2 + 4 = " . sum(2, 4);
        ?>


        

        

        <?php
        $cars = array("Volvo", "BMW", "Toyota");
        echo "I like " . $cars[0] . ", " . $cars[1] . " and " . $cars[2] . ".";
        ?>

        <?php
        $cars = array("Volvo", "BMW", "Toyota");
        echo "I like " . $cars[0] . ", " . $cars[1] . " and " . $cars[2] . ".";
        ?>

        <?php
        $cars = array("Volvo", "BMW", "Toyota");
        echo count($cars);
        ?>

        <?php
        $cars = array("Volvo", "BMW", "Toyota");
        $arrlength = count($cars);

        for ($x = 0; $x < $arrlength; $x++) {
            echo $cars[$x];
            echo "<br>";
        }
        ?>

        <?php
        $age = array("Peter" => "35", "Ben" => "37", "Joe" => "43");
        echo "Peter is " . $age['Peter'] . " years old.";
        ?>

        <?php
        $age = array("Peter" => "35", "Ben" => "37", "Joe" => "43");

        foreach ($age as $x => $x_value) {
            echo "Key=" . $x . ", Value=" . $x_value;
            echo "<br>";
        }
        ?>

        <?php
        $cars = array("Volvo", "BMW", "Toyota");
        sort($cars);

        $clength = count($cars);
        for ($x = 0; $x < $clength; $x++) {
            echo $cars[$x];
            echo "<br>";
        }
        ?>

        <?php
        $numbers = array(4, 6, 2, 22, 11);
        sort($numbers);

        $arrlength = count($numbers);
        for ($x = 0; $x < $arrlength; $x++) {
            echo $numbers[$x];
            echo "<br>";
        }
        ?>

        <?php
        $cars = array("Volvo", "BMW", "Toyota");
        rsort($cars);

        $clength = count($cars);
        for ($x = 0; $x < $clength; $x++) {
            echo $cars[$x];
            echo "<br>";
        }
        ?>

        <?php
        $numbers = array(4, 6, 2, 22, 11);
        rsort($numbers);

        $arrlength = count($numbers);
        for ($x = 0; $x < $arrlength; $x++) {
            echo $numbers[$x];
            echo "<br>";
        }
        ?>

        <?php
        $age = array("Peter" => "35", "Ben" => "37", "Joe" => "43");
        asort($age);

        foreach ($age as $x => $x_value) {
            echo "Key=" . $x . ", Value=" . $x_value;
            echo "<br>";
        }
        ?>

        <?php
        $age = array("Peter" => "35", "Ben" => "37", "Joe" => "43");
        arsort($age);

        foreach ($age as $x => $x_value) {
            echo "Key=" . $x . ", Value=" . $x_value;
            echo "<br>";
        }
        ?>

        <?php
        $age = array("Peter" => "35", "Ben" => "37", "Joe" => "43");
        krsort($age);

        foreach ($age as $x => $x_value) {
            echo "Key=" . $x . ", Value=" . $x_value;
            echo "<br>";
        }
        ?>

        <?php
        $x = 75;
        $y = 25;

        function addition() {
            $GLOBALS['z'] = $GLOBALS['x'] + $GLOBALS['y'];
        }
        ?>


    </body>
</html>
