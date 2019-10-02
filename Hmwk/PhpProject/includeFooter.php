<!DOCTYPE html>
<html>
    <body>

        <h1>Welcome to my home page!</h1>
        <p>Some text.</p>
        <p>Some more text.</p>
        <?php include 'footer.php'; ?>

        <div class="menu">
            <?php include 'menu.php'; ?>
        </div>

        <h1>Welcome to my home page!</h1>
        <p>Some text.</p>
        <p>Some more text.</p>

        <h1>Welcome to my home page!</h1>
        <?php
        include 'vars.php';
        echo "I have a $color $car.";
        ?>

        <h1>Welcome to my home page!</h1>
        <?php
        include 'noFileExists.php';
        echo "I have a $color $car.";
        ?>

    </body>
</html>