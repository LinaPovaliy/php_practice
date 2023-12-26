<?php

function getIntersectionOfSortedArray($array1, $array2)
{
    $i = 0;
    $j = 0;
    $result = [];

    while ($i < count($array1) && $j < count($array2)) {
        if ($array1[$i] === $array2[$j]) {
            $result[] = $array1[$i];
            $i++;
            $j++;
        }
        elseif ($array1[$i] < $array2[$j]) {
            $i++;
        }
        else {
            $j++;
        }
    }
    print_r($result);
    print_r("\n");
}

// examples

getIntersectionOfSortedArray([10, 11, 24], [10, 13, 14, 18, 24, 30]); // [10, 24]

getIntersectionOfSortedArray([10, 11, 24], [-2, 3, 4]); // []

getIntersectionOfSortedArray([], [2]); // []
