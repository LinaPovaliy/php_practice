<?php

function countUniqChars($str)
{
    $uniqChars = [];

    for ($i = 0; $i < strlen($str); $i++) {
        $char = $str[$i];

        $uniqChars[$char] = true;
    }
    print_r(count($uniqChars)."\n");
}

// examples
$text1 = 'yyab';
countUniqChars($text1); // 3

$text2 = 'You know nothing Jon Snow';
countUniqChars($text2); // 13

$text3 = '';
countUniqChars($text3); // 0