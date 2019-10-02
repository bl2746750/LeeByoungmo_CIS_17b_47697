<!DOCTYPE html>
<html>
    <body>

        <?php
        echo readfile("webdictionary.txt");
        ?>


        <?php
        $myfile = fopen("webdictionary.txt", "r") or die("Unable to open file!");
        echo fread($myfile, filesize("webdictionary.txt"));
        fclose($myfile);
        ?>

        <?php
        $myfile = fopen("webdictionary.txt", "r") or die("Unable to open file!");
        echo fgets($myfile);
        fclose($myfile);
        ?>
        <?php
        $myfile = fopen("webdictionary.txt", "r") or die("Unable to open file!");
// Output one line until end-of-file
        while (!feof($myfile)) {
            echo fgets($myfile) . "<br>";
        }
        fclose($myfile);
        ?>

        <?php
        $myfile = fopen("webdictionary.txt", "r") or die("Unable to open file!");
// Output one character until end-of-file
        while (!feof($myfile)) {
            echo fgetc($myfile);
        }
        fclose($myfile);
        ?>

        <?php
        $myfile = fopen("newfile.txt", "w") or die("Unable to open file!");
        $txt = "John Doe\n";
        fwrite($myfile, $txt);
        $txt = "Jane Doe\n";
        fwrite($myfile, $txt);
        fclose($myfile);
        ?>

        <?php
        $myfile = fopen("newfile.txt", "w") or die("Unable to open file!");
        $txt = "Mickey Mouse\n";
        fwrite($myfile, $txt);
        $txt = "Minnie Mouse\n";
        fwrite($myfile, $txt);
        fclose($myfile);
        ?>
    </body>
</html>