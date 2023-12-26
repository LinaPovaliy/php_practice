<?php

function without(array $items, ...$values)
{
    $filtered = array_filter($items, fn($item) => !in_array($item, $values, true));

    return array_values($filtered);
}

// examples

$result1 = without([3, 4, 10, 4, 'true'], 4); // [3, 10, 'true']
print_r($result1);

$result2 = without(['3', 2], 0, 5, 11); // ['3', 2]
print_r($result2);

