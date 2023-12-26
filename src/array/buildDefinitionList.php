<?php

function buildDefinitionList($definitions)
{
    $definition = [];

    foreach ($definitions as $term) {
        $definition[] = "<dt>{$term[0]}</dt>";
        $definition[] = "<dd>{$term[1]}</dd>";
    }
    $innerValue = implode('', $definition);
    $result = "<dl>{$innerValue}</dl>";
    print_r($result);
}

// examples
$definitions = [
    ['Блямба', 'Выпуклость, утолщения на поверхности чего-либо'],
    ['Бобр', 'Животное из отряда грызунов'],
];

buildDefinitionList($definitions);
// => '<dl><dt>Блямба</dt><dd>Выпуклость, утолщение на поверхности чего-либо</dd><dt>Бобр</dt><dd>Животное из отряда грызунов</dd></dl>';