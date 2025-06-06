[Назад к главной странице курса](https://github.com/db-course/syllabus)

## 1. Инфологическое моделирование предметной области

### Цель работы

Освоение методов инфологического моделирования при проектировании схемы данных для реляционной базы данных.

### Теоретические сведения

**Инфологическое моделирование** — способ разработки структуры базы данных, который опирается на семантику (смысл) данных. Входными данными является словесное описание предметной области, полученное от экспертов, выходными — формализованная модель, как правило, представленная в виде ER-диаграммы.

#### Общие понятия и принципы инфологического моделирования [1]

**ER-диаграмма** (Entity-Relationship diagram, диаграмма Сущность-Связь) описывает предметную область как набор сущностей, семантически связанных между собой.

Следует различать понятия "сущность" и "экземпляр сущности". 

**Сущность** — набор однотипных объектов или фактов, о которых требуется хранить какую-либо информацию. Иными словами, сущность — все, что можно представить списком.

Сущности желательно именовать существительными единственного числа.

Примеры: 
"Товар" — множество всех товаров;
"Клиент" — множество всех клиентов;
"Покупка" — множество всех фактов покупки тем или иным покупателем того или иного товара.

**Экземпляр сущности** — один объект (факт) набора, один элемент списка.

Сущность определяет набор **атрибутов** — свойств, значения которых требуется хранить для каждого экземпляра.

Важнейшая черта атрибутов сущности — атомарность.

**Атомарность данных** (atomicity) — неделимость. Атомарные данные не представляют собой множества значений или списка значений. Атомарность данных — неоднозначная характеристика, и должна определяться с точки зрения семантики данных и предполагаемых методов работы с ними. [2] Так, атрибут "Габариты" сущности "Товар" может быть классифицирован как атомарный, если при работе с моделью будет иметь смысл использовать габариты товара только в совокупности (например, выводить на экран в спецификации), и не придется рассматривать ширину, глубину и высоту товара по отдельности (например, искать товар с шириной не более 1,5 метров). В противном случае атрибут "Габариты" будет неатомарным и требовать пересмотра модели.

Рассмотрим способы борьбы с неатомарностью.

*   Атрибут может быть разбит на несколько атрибутов (в случае если атрибут представляет собой набор разных по смыслу значений). Пример:

Исходная сущность:

![](https://github.com/db-course/syllabus/blob/master/img/stud1.png)

| Nзач |          ФИО         |
|:----:|:--------------------:|
|  123 | Иванов Иван Иванович |

Преобразованная сущность:

![](https://github.com/db-course/syllabus/blob/master/img/stud2.png)

| Nзач | Фамилия | Имя  | Отчество |
|:----:|:-------:|------|----------|
|  123 |  Иванов | Иван | Иванович |

*   Атрибут может быть преобразован в атомарный путем пересмотра того, что будет экземпляром сущности (в случае если атрибут представляет собой список однотипных по смыслу значений, о которых не требуется хранить дополнительных сведений, и значение атрибута индивидуально у каждого экземпляра). Пример: 

Исходная сущность:

![](https://github.com/db-course/syllabus/blob/master/img/sotr1.png)

| Фамилия |              Телефоны              |
|:-------:|:----------------------------------:|
|  Иванов | +7 (812) 1234567, +7 (812) 7654321 |

Преобразованная сущность:

![](https://github.com/db-course/syllabus/blob/master/img/sotr2.png)

| Фамилия |      Телефон     |
|:-------:|:----------------:|
|  Иванов | +7 (812) 1234567 |
|  Иванов | +7 (812) 7654321 |

В данном примере экземпляром сущности был человек, а атрибутами — его фамилия и номера телефонов. После преобразования экземпляром сущности стал факт того, что человек имеет тот или иной номер телефона, а атрибутами факта — фамилия человека и номер телефона.

*   Атрибут может быть вынесен в отдельную сущность (в случае если атрибут представляет собой список одинаковых по смыслу значений, о которых требуется хранить дополнительные сведения, или значение атрибута может повторяться у нескольких экземпляров). Пример:

Исходная сущность:

![](https://github.com/db-course/syllabus/blob/master/img/film1.png)

|    Фильм    |                  Актерский состав                  |
|:-----------:|:--------------------------------------------------:|
| Смысл жизни | Иванов (род. 1979-02-21), Петров (род. 1988-07-13) |

Преобразованные сущности:

![](https://github.com/db-course/syllabus/blob/master/img/film2.png)

|    Фильм    |
|:-----------:|
| Смысл жизни |

| Фамилия актера | Дата рождения |
|:--------------:|:-------------:|
|     Иванов     |   1979-02-21  |
|     Петров     |   1988-07-13  |

В последнем случае вновь сформированная сущность будет связана с исходной.

**Связи** между сущностями проводятся в том случае, если экземпляры сущностей связаны друг с другом семантически. Экземпляры связей также несут информацию и устанавливают ассоциации между конкретными экземплярами сущностей. Сущность может быть связана сама с собой, в случае если между собой ассоциированы ее отдельные экземпляры.

Связи различаются по **кратности** (мощности): "один-к-одному", "один-ко-многим", "многие-ко-многим".

Тип связи определяется по отдельности на обоих ее концах. Чтобы определить тип связи на одном из концов, необходимо зафиксировать одиночный экземпляр одной из связанных сущностей и оценить, сколько экземпляров второй сущности с ним может быть логически связано: только один или несколько. Затем аналогичные действия производятся для другого конца связи.

Примеры:

Сущность "Сеанс" связана с сущностью "Билет" связью "один-ко-многим" (на один сеанс продается много билетов; один билет действителен только на один сеанс).
Сущность "Группа" связана с сущностью "Студент" связью "один-ко-многим", которая обозначает, что студент учится в группе (в группе учится много студентов, студент может учиться только в одной группе).
Сущность "Группа" связана с сущностью "Студент" связью "один-к-одному", которая обозначает, что студент является старостой группы (у группы только один староста, студент может быть старостой только одной группы).

![](https://github.com/db-course/syllabus/blob/master/img/rel1.png)

Сущность "Водитель" связана с сущностью "Автобус" связью "многие-ко-многим" (один водитель может водить несколько автобусов, один автобус может управляться несколькими водителями).

![](https://github.com/db-course/syllabus/blob/master/img/rel2.png)

Бывают ситуации, когда между сущностями есть несколько связей. Например, между сущностями "Группа" и "Студент", как показано в примерах выше.

В большинстве случаев, когда между сущностями существует единственная связь кратности "один-к-одному", данные сущности могут быть отождествлены с точки зрения данных и слиты в одну. Например, сущности "Товар" и "Товар на складе" могут быть отождествлены в том случае, если склад единственен, и одному товару соответствует ровно один факт его наличия на этом складе.

Для каждой сущности должен быть определен ключ.

**Ключ сущности** — минимальный набор атрибутов и связей, комбинация значений которых гарантированно уникальна для всех экземпляров данной сущности (иными словами, гарантированно различается у любых двух ее экземпляров). Ключ может быть естественным (т.е. быть продиктованным семантикой предметной области) или суррогатным (т.е. введенным в модель только из-за необходимости наличия ключа при неудобстве использования или неинтуитивности естественного ключа).

В лабораторной работе в академических целях предпочтение необходимо отдавать естественным ключам.

В случае, если ключ составляет одиночный атрибут, его значение не может повториться ни у одного экземпляра сущности. В случае, если ключ состоит из нескольких атрибутов, по отдельности значение каждого из них может совпадать у двух экземпляров, а требование уникальности накладывается на комбинацию их значений.

Нередки случаи, когда частью естественного ключа для сущности является связь (такая связь называется **ключевой**). Это значит, что два экземпляра данной сущности при совпадении значений остальных частей ключа будут гарантированно связаны с различными экземплярами второй сущности.

Пример:

Ключ сущности "Этап проекта" будет составным: (атрибут "Номер этапа", связь с сущностью "Проект"). Так, номера этапов, ассоциированных с одним и тем же проектом, будут гарантированно различными, а если у двух этапов номера совпадают, то они гарантированно относятся к различным проектам.

#### Переход к реляционной модели

Предварительно ознакомиться: [материалы лекции по реляционной модели данных](https://guap.aksenov.in/db/lectures/doku.php?id=lectures:lecture1).

После составления ER-модели необходимо, руководствуясь нижеприведенным алгоритмом, перейти к реляционной модели той же самой предметной области. В дальнейшем в СУБД используется именно она.

Реляционная модель является менее абстрактной и уточняет некоторые детали, такие как домены для атрибутов, специфические для СУБД названия отношений и атрибутов, ограничения целостности и др.

Алгоритм перехода от ER-модели к реляционной модели

1. Каждой сущности ставится в соответствие отношение. Атрибуты сущности становятся атрибутами отношения. Если атрибут был ключевым, он становится частью потенциального ключа отношения.
1. Для каждой связи "один-ко-многим" ключевые атрибуты со стороны "один" копируются на сторону "многие". Если связь была ключевой (и только в этом случае), скопированные атрибуты становятся частью ключа.
1. Для каждой связи "многие-ко-многим" создается промежуточное отношение, в которое копируются ключевые атрибуты связанных сущностей. Все они образуют составной ключ. Полученное отношение (т.н. отношение пересечения) связывается с исходными связями "многие-к-одному".

### Порядок выполнения

Примечание: основной репозиторий для выполнения лабораторной работы: ``db-course/lab1-группа`` (в названии репозитория должен быть ваш номер группы)

1. Ознакомиться с неформализованным словесным описанием предметной области, при необходимости уточнив детали у преподавателя.
1. Разработать ER-модель в соответствии с индивидуальным вариантом задания.
1. Осуществить переход к реляционной модели.
1. Оформить отчет по проделанной работе.

### Содержание отчета

1. Титульный лист.
1. Цель работы.
1. Индивидуальный вариант задания.
1. Разработанная ER-модель.
1. Синтезированная реляционная схема.
1. Выводы.

### Вспомогательные материалы

1. [Элементы модели "сущность-связь"](http://citforum.ru/database/dblearn/dblearn08.shtml)
1. [Атомарность данных](https://basegroup.ru/community/glossary/atomic-data)

### Вопросы к защите

*   В чем отличия инфологической и даталогической моделей?
*   Что является экземпляром сущности X?
*   Объясните семантику (смысл) связи между сущностями X и Y.
*   Объясните кратность (вид) связи между сущностями X и Y.
*   Что такое ключ в ER-модели?
*   Что такое ключевая связь?
*   Объясните выбор ключа для сущности X.
*   Что такое потенциальный ключ в реляционной модели?
*   В чем отличие первичного ключа от потенциального ключа?
*   В чем отличие двух потенциальных ключей a и b от составного потенциального ключа (a, b)?
*   Что такое внешний ключ в реляционной модели?
*   В чем отличие двух внешних ключей a и b от составного внешнего ключа (a, b)?

[Назад к главной странице курса](https://github.com/db-course/syllabus)
