<?php

function getSuperSeriesWinner($scores)
{
    $winCounterCanada = 0;
    $winCounterUssr = 0;
    for ($i = 0; $i < (count($scores)); $i ++) {
        $game = $scores[$i];
        $score = $game[0] <=> $game[1];
        if ($score === 1) {
            $winCounterCanada += 1;
        }
        if ($score === -1) {
            $winCounterUssr += 1;
        }
    }
    if ($winCounterUssr > $winCounterCanada) {
        return ('ussr');
    }
    elseif ($winCounterCanada > $winCounterUssr) {
        return ('canada');
    }
    else {
        return null;
    }
}

// examples
$scores = [
    [3, 7], // Первая игра
    [4, 1], // Вторая игра
    [4, 4],
    [3, 5],
    [4, 5],
    [3, 2],
    [4, 3],
    [6, 5],
];

print_r(getSuperSeriesWinner($scores)); // 'canada'