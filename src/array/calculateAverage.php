<?php

function calculateAverage($temperatures)
{
    if (empty($temperatures)) {
        return null;
    }

    $sum = 0;
    foreach ($temperatures as $item) {
        $sum += $item;
    }

    $average = $sum / count($temperatures);
    print_r($average);
    print_r("\n");
}

// examples
$temperatures = [37.5, 34, 39.3, 40, 38.7, 41.5];
calculateAverage($temperatures); // 38.5

$temperatures = [];
calculateAverage($temperatures); // 0


