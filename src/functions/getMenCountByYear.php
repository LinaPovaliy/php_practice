<?php

function getMenCountByYear(array $users)
{
    $men = array_filter($users, fn($user) => $user['gender'] === 'male');

    $years = array_map(fn($user) => date('Y', strtotime($user['birthday'])), $men);

    return array_reduce($years, function ($menCountByYear, $year) {
        $menCountByYear[$year] = ($menCountByYear[$year] ?? 0) + 1;

        return $menCountByYear;
    }, []);
}

$users = [
    ['name' => 'Bronn', 'gender' => 'male', 'birthday' => '1973-03-23'],
    ['name' => 'Reigar', 'gender' => 'male', 'birthday' => '1973-11-03'],
    ['name' => 'Eiegon',  'gender' => 'male', 'birthday' => '1963-11-03'],
    ['name' => 'Sansa', 'gender' => 'female', 'birthday' => '2012-11-03'],
    ['name' => 'Jon', 'gender' => 'male', 'birthday' => '1980-11-03'],
    ['name' => 'Robb','gender' => 'male', 'birthday' => '1980-05-14'],
    ['name' => 'Tisha', 'gender' => 'female', 'birthday' => '2012-11-03'],
    ['name' => 'Rick', 'gender' => 'male', 'birthday' => '2012-11-03'],
    ['name' => 'Joffrey', 'gender' => 'male', 'birthday' => '1999-11-03'],
    ['name' => 'Edd', 'gender' => 'male', 'birthday' => '1973-11-03']
];

getMenCountByYear($users);
// Вывод:
// Array (
//     [1973] => 3
//     [1963] => 1
//     [1980] => 2
//     [2012] => 1
//     [1999] => 1
// )

$result = getMenCountByYear($users);
print_r($result);
