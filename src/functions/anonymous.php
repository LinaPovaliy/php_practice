<?php

function run(string $text)
{
    $last = function (string $text) {
        if (empty($text)) {
            return null;
        }
        return $text[-1];
    };

    if ($text === "0") {
        return "0";
    }

    return $last($text);
}

// examples

echo run('');     // null
echo run('0');    // 0
echo run('210');  // 0
echo run('pow');  // w
echo run('kids'); // s

