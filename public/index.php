<?php
require_once __DIR__ . '/../src/Calculator.php';

$calc = new Calculator();
$result = $calc->add(2, 3);
?>

<!DOCTYPE html>
<html>

<head>
    <title>Calculadora PHP</title>
</head>

<body>
    <h1>Calculadora PHP con Docker y Jenkins</h1>
    <p>2 + 6 = <strong><?= $result ?></strong></p>
</body>

</html>
