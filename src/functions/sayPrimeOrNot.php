<?php

function isPrime($number)
{
    if ($number < 2) {
        return false;
    }

    for ($i = 2; $i <= $number / 2; $i++) {
        if ($number % $i === 0) {
            return false;
        }
    }
    return true;
}

function sayPrimeOrNot($number)
{
    $text = isPrime($number) ? 'yes' : 'no';
    print_r($text);
    print_r("\n");
}

// examples

sayPrimeOrNot(5); // yes
sayPrimeOrNot(4); // no
