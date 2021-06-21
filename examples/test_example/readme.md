# Cкелет теста

## Назначение

Структура теста позволяет запустить несколько тестов подряд и получить итоговый лог файл с результатом выполнения всех тестов.
Структура позволяет выполнять тесты на сайте EDA Playground
Используется симулятор Mentor Questa 2020.1

## Описание

Верхним уровенем тестирования является файл testbecnh.sv с компонентом tb(); Он имеет параметр test_id; В зависимости от этого параметра запускаются раздинчые тесты.

Массив test_name содержит имена тестов, они будут отображаться в итоговом лог файле

После завершения теста должен быть выполнен tast test_name, в который передаётся номер теста, названия теста и результат теста, эти данные будут записаны в файл global.txt

Возможно два режима выполнения:
1. Запуск одиночного теста.
2. Запуск группы тестов

Запуск одиночного теста производится обычным образом. Должен быть снят выбор с поля "Use run.bash"; В поле  "Run option" надо добавить параметр -g test_id=<номер теста>. Выбранный тест будет запущен.

Запуск группового теста производится через файл run.bash; Необходимо поставить выбор на поле "Use run.bash" и скорректировать файл run.bash

Файл run.bash
    vlib work 
    vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  
    echo "" > global.txt
    vsim -f questa.tops  -batch -do "vsim -voptargs=+acc=npr ; run -all; exit" -voptargs=+acc=npr -g test_id=1
    vsim -f questa.tops  -batch -do "vsim -voptargs=+acc=npr ; run -all; exit" -voptargs=+acc=npr -g test_id=2
    vsim -f questa.tops  -batch -do "vsim -voptargs=+acc=npr ; run -all; exit" -voptargs=+acc=npr -g test_id=3
    cat global.txt

Строки которые начинаются с vsim запускают сеанс моделирования с заданным номером теста. Необходимо задать требуемые номера тестов.

## Настройка 

На сайт EDA надо добавить файл run.bash 

Установить симулятор Mentor Questa 2020.1

## Пример результата выполнения группы тестов

test_id=1     test_name:          test_1         TEST_PASSED
test_id=2     test_name:          test_2         TEST_FAILED *******
test_id=3     test_name:          test_3         TEST_FAILED *******

