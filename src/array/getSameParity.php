<?php

function getSameParity($numbers)
{
    if (empty($numbers)) {
        return null;
    }

    $firstNumber = $numbers[0] % 2 === 0;
    $result = [];

    foreach ($numbers as $item) {
        if (($item % 2 === 0) === $firstNumber) {
            $result[] = $item;
        }
    }

    print_r($result);
    print_r("\n");
}

// examples
getSameParity([]);        // []
getSameParity([1, 2, 3]); // [1, 3]
getSameParity([1, 2, 8]); // [1]
getSameParity([2, 2, 8]); // [2, 2, 8]
