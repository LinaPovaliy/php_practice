<?php

function getGirlFriends(array $users)
{
    $girlFriends = [];

    foreach ($users as $user) {
        $friends = array_filter($user['friends'], function ($friend) {
            return $friend['gender'] === 'female';
        });

        $girlFriends = array_merge($girlFriends, $friends);
    }
    return $girlFriends;
}

// examples

$users = [
    ['name' => 'Tirion', 'friends' => [
        ['name' => 'Mira', 'gender' => 'female'],
        ['name' => 'Ramsey', 'gender' => 'male']
    ]],
    ['name' => 'Bronn', 'friends' => []],
    ['name' => 'Sam', 'friends' => [
        ['name' => 'Aria', 'gender' => 'female'],
        ['name' => 'Keit', 'gender' => 'female']
    ]],
    ['name' => 'Rob', 'friends' => [
        ['name' => 'Taywin', 'gender' => 'male']
    ]],
];

getGirlFriends($users);
# Array (
#     ['name' => 'Mira', 'gender' => 'female'],
#     ['name' => 'Aria', 'gender' => 'female'],
#     ['name' => 'Keit', 'gender' => 'female']
# )

$result = getGirlFriends($users);
print_r($result);
