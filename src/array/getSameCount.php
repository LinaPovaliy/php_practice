<?php

function getSameCount($array1, $array2)
{
    $count = 0;
    $uniq1 = array_unique($array1);
    $uniq2 = array_unique($array2);

    foreach ($uniq1 as $item1) {
        foreach ($uniq2 as $item2) {
            if ($item1 === $item2) {
                $count += 1;
            }
        }
    }
    print_r("{$count}\n");
}

// examples

getSameCount([], []); // 0
getSameCount([4, 4], [4, 4]); // 1
getSameCount([1, 10, 3], [10, 100, 35, 1]); // 2
getSameCount([1, 3, 2, 2], [3, 1, 1, 2]); // 3