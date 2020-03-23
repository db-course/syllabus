# Курс Базы данных
### весенний семестр 2020 года, СПбГУАП, кафедра 44

<!-- [Требования к допуску и порядок аттестации](https://github.com/db-course/syllabus/blob/master/exam/exam.md)

Списки вопросов:
* [Быстрого этапа](https://github.com/db-course/syllabus/blob/master/exam/theory.md)
* [Основного этапа](https://github.com/db-course/syllabus/blob/master/exam/theory.md)
* [Практического этапа](https://github.com/db-course/syllabus/blob/master/exam/practice.md) -->

## Содержание теоретического курса

* [Введение в реляционные базы данных](https://aksenov.in/guap/db/lectures/doku.php?id=lectures:lecture1)
* [Реляционная алгебра](https://aksenov.in/guap/db/lectures/doku.php?id=lectures:lecture2)
* [Теория нормализации](https://aksenov.in/guap/db/lectures/doku.php?id=lectures:lecture3)
* [SQL](https://aksenov.in/guap/db/lectures/doku.php?id=lectures:lecture4)
* [Обработка транзакций](https://aksenov.in/guap/db/lectures/doku.php?id=lectures:lecture5)

-----

## Содержание лабораторного курса

Лабораторный курс по дисциплине включает 6 лабораторных работ.

__Важно__

Для лабораторных работ 3-5 предусмотрена сдача в онлайн-формате на сайте GitHub. Инструкции [здесь](https://github.com/db-course/syllabus/blob/master/git.md).

1. [Инфологическое моделирование предметной области](https://github.com/db-course/syllabus/blob/master/labworks/labwork1.md)
1. [Создание базы данных в СУБД Microsoft Access](https://github.com/db-course/syllabus/blob/master/labworks/labwork2.md)
1. [Создание базы данных в СУБД SQLite](https://github.com/db-course/syllabus/blob/master/labworks/labwork3.md) ([репозиторий](https://github.com/db-course/labwork3))
1. [Создание представлений на основании запросов на выборку в СУБД SQLite. Запросы на модификацию и удаление данных в СУБД SQLite](https://github.com/db-course/syllabus/blob/master/labworks/labwork4.md) ([репозиторий](https://github.com/db-course/labwork4))
1. [Создание триггеров в СУБД SQLite](https://github.com/db-course/syllabus/blob/master/labworks/labwork5.md) ([репозиторий](https://github.com/db-course/labwork5))
1. [Управление транзакциями в СУБД MySQL](https://github.com/db-course/syllabus/blob/master/labworks/labwork6.md)

-----

## Содержание практического курса

Практический курс по дисциплине включает 4 контрольных работы.

1. [Реляционная алгебра](https://github.com/db-course/syllabus/blob/master/tests/test1.md) ([репозиторий](https://github.com/db-course/rel_algebra))
1. [Теория нормализации](https://github.com/db-course/syllabus/blob/master/tests/test2.md)
1. [SQL](https://github.com/db-course/syllabus/blob/master/tests/test3.md)
1. [Индексы](https://github.com/db-course/syllabus/blob/master/tests/test4.md)

-----

## Примерный график изучения дисциплины

|     Период    |       Материал лекций       |   Выполняемая ЛР  |      Выполняемая КР     |
|:-------------:|:---------------------------:|:-----------------:|:-----------------------:|
| конец февраля | реляционная модель, алгебра | 1 (моделирование) |                         |
| начало марта  | теория нормализации         |                   | 1 (реляционная алгебра) |
| конец марта   | SQL DML                     | 2 (Access)        | 2 (теория нормализации) |
| начало апреля | SQL SELECT                  | 3 (SQL DML)       |                         |
| конец апреля  | SQL триггеры                | 4 (SQL SELECT)    | 3 (SQL)                 |
| начало мая    | индексы                     | 5 (SQL триггеры)  |                         |
| конец мая     | транзакции                  | 6 (транзакции)    | 4 (индексы)             |
