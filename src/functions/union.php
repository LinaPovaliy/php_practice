<?php

function union($first, ...$rest): array
{
    $mapWithUniqKeys = array_unique(array_merge($first, ...$rest));
    return [...$mapWithUniqKeys];
}

//examples

print_r(union([3])); // [3]
print_r("\n");

print_r(union([3, 2], [2, 2, 1])); // [3, 2, 1]
print_r("\n");

print_r(union(['a', 3, false], [true, false, 3], [false, 5, 8])); // ['a', 3, false, true, 5, 8] //????????????????
print_r("\n");