<?php

function checkIfBalanced($mathExpression)
{
    $stack = [];

    for ($i = 0; $i < strlen($mathExpression); $i++) {
        $char = $mathExpression[$i];

        if ($char === '(') {
            array_push($stack, $char);
        }
        elseif ($char === ')') {
            if (empty($stack) || array_pop($stack) != '(') {
                return false;
            }
        }
    }
    return empty($stack);
}

//examples

checkIfBalanced('(5 + 6) * (7 + 8)/(4 + 3)'); // true
print_r(checkIfBalanced('(5 + 6) * (7 + 8)/(4 + 3)') ? 'true' : 'false');
print_r("\n");

checkIfBalanced('(4 + 3))'); // false
print_r(checkIfBalanced('(4 + 3))') ? 'true' : 'false');
print_r("\n");