<?php

function average(...$numbers)
{
    if (empty($numbers)) {
        return null;
    }

    print_r(array_sum($numbers) / count($numbers));
    print_r("\n");
}

//examples

average(0); // 0
average(0, 10); // 5
average(-3, 4, 2, 10); // 3.25
average(); // null