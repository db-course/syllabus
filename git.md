[Назад к главной странице курса](https://github.com/db-course/syllabus)

# Инструкция по использованию git для сдачи лабораторных работ

Для лабораторных работ предусмотрена онлайн-сдача на GitHub. Для этого нужно проделать ряд шагов, описанных ниже. Следует отметить, что данная инструкция не может претендовать не только на полноту описания возможностей git, но даже на полноценное введение, поскольку не описывает и 10% его самых базовых функций. Для более глубокого понимания сути и принципов работы с git обратитесь к ссылкам в конце данной инструкции.

Схема работы с системой git для сдачи лабораторных работ в графическом виде приведена на следующем рисунке.

![Workflow](https://github.com/db-course/syllabus/blob/master/img/workflow.png)

Далее в этой инструкции детально описаны шаги, необходимые для выполнения и сдачи лабораторных работ. В процессе чтения инструкции можно возвращаться к вышеприведенному рисунку для более наглядного восприятия.

## Настройка рабочей среды

Необходимо создать аккаунт на GitHub, если у вас его еще нет.

Далее следует установить клиент системы управления версиями git для вашей ОС. Он будет необходим для взаимодействия с сервером GitHub, а именно создания локальных репозиториев и отправки лабораторных работ на сервер.

_Для чего используется в реальной жизни_: git — распределенная система управления версиями. Используется для совместной работы с текстовой информацией. Позволяет хранить несколько версий документов и при необходимости переключаться между ними. Также имеется возможность создания параллельных версий документов с собственной историей изменений, их объединение и множество других возможностей совместной разработки.

Git может использоваться как для локального управления исходным кодом (то есть на том же компьютере, на котором этот исходный код создается), так и для хостинга исходного кода на сервере. Существует много публично доступных сервисов, предоставляющих услуги хостинга проектов под управлением системы git. Самым популярным среди таких сервисов является GitHub.

В принципе, для git существует множество клиентов, но в данном курсе крайне рекомендуется пользоваться официальным клиентом, скачиваемым с сайта https://git-scm.com/downloads В составе установки содержится клиент командной строки Git Bash, использующий систему команд терминала GNU/Linux. Дальнейшие инструкции ориентированы на Git Bash. Все настройки в процессе установки можно принять по умолчанию.

После установки требуется настроить клиент. Для этого из консоли Git Bash требуется выполнить команды задания имени пользователя и адреса электронной почты.

```bash
git config --global user.name "ваше имя"
```
`ваше имя` - имя, которым будут подписаны ваши изменения. Рекомендуется использовать имя пользователя GitHub:

```bash
git config --global user.name "ivanov"
```
Также необходимо выполнить следующую команду:

```bash
git config --global user.email "ваш@email"
```
`ваш@email` - адрес электронной почты. Для этой цели можно использовать адрес электронной почты, предоставляемый GitHub и имеющий вид `ivanov@users.noreply.github.com`, где `ivanov` -- ваше имя пользователя.

Эти настройки сохраняются глобально (для всех репозиториев на вашем компьютере), в дальнейшем при необходимости они могут быть изменены. Можно узнать текущее значение параметра имени пользователя и адреса электронной почты, выполнив команды

```bash
git config --global user.name
git config --global user.email
```

## Регистрация в организации

Для того чтобы выполнять лабораторные работы, нужно быть членом организации `db-course` на GitHub. Для этого необходимо после регистрации на GitHub подать заявку на вступление, которую принимает преподаватель. Чтобы это сделать, необходимо открыть issue (проблему) в репозитории [db-course/students](https://github.com/db-course/students). Как это сделать, указано в описании репозитория.

Когда вы станете членом организации `db-course`, вам станут доступен один, а позднее несколько приватных (невидимых для пользователей, не являющихся членами) репозиториев, каждый из которых относится к какой-либо из лабораторных работ, для которых предусмотрена сдача на GitHub. Можно приступать к выполнению лабораторных работ.

![Private repo](https://github.com/db-course/syllabus/blob/master/img/privat_repo.png)

## Тренировка работы с git и GitHub

Для тренировки работы с git и GitHub предназначена 0ЛР (тренировочная ЛР). Она является обязательной, но ее не требуется защищать и по ней не нужно оформлять отчет. Первоначально члену организации доступен репозиторий только этой лабораторной работы (`db-course/lab0-группа`), а после ее выполнения становятся доступны остальные репозитории.

Чтобы выполнить тренировочную лабораторную работу, необходимо проделать те же действия, которые предусмотрены для обычных лабораторных работ: форк, клонирование, создание коммитов, отправка изменений, создание пулл-реквеста (см. следующие разделы инструкции). Требования к содержимому коммитов и порядку выполнения тренировочной лабораторной работы указаны в описании ее репозитория (`db-course/lab0-группа`).

## Подготовка к выполнению лабораторной работы

Необходимо форкнуть (fork) приватный репозиторий, относящийся к лабораторной работе, которую вы хотите сдать. Для этого необходимо зайти в репозиторий, соответствующий работе (например, `db-course/lab3-4241`, если вы учитесь в группе 4241 и сдаете ЛР3), и нажать кнопку "Fork".

![Fork](https://github.com/db-course/syllabus/blob/master/img/fork.png)

В открывшемся окне нужно убедиться, что в поле Owner (Владелец) указан ваш аккаунт на GitHub, все остальные настройки можно оставить по умолчанию, после чего нажать кнопку Create fork. 

![Preforking](https://github.com/db-course/syllabus/blob/master/img/preforking.png)

Через несколько секунд на сервере GitHub будет создана ваша копия репозитория проекта.

Вы будете иметь права на внесение изменений в форк репозитория, что позволит загрузить на GitHub выполненную лабораторную работу.

_Для чего используется в реальной жизни_: форк репозитория проекта — создание копии проекта на сервере. Это может преследовать разные цели:

* Внесение собственного вклада в развитие чужого проекта. Для этого можно вносить соответствующие улучшения в свою копию проекта, а впоследствии путем создания пулл-реквеста (запроса на включение) предложить принять их в исходный проект его хозяину.

* Создание собственного проекта на базе существующего.

После создания форка на сервере GitHub нужно клонировать его на свой собственный компьютер. Для этого в командной строке перейдите к каталогу, в котором планируете выполнять лабораторные работы (например `D:\db\lr`), и выполните команду

```bash
git clone https://github.com/ваше_имя/имя_репозитория_с_лр
```

Например, если студент группы 4241 с именем пользователя `ivanov` собирается клонировать репозиторий с ЛР3, для того чтобы сдать ее, необходимо выполнить команду

```bash
git clone https://github.com/ivanov/lab3-4241
```

Поскольку это приватный репозиторий, клиент запросит авторизацию, чтобы проверить, обладаете ли вы правами на чтение из него. В случае успешной авторизации репозиторий будет склонирован.

Будет создан локальный каталог (в данном случае `lab3-4241`), содержащий файл `README.md` (текстовый файл с описанием репозитория в формате markdown) и, другие файлы, если это предусмотрено лабораторной работой. Можно приступать к выполнению лабораторной работы.

## Выполнение лабораторной работы

В описании конкретной лабораторной работы указано, какие именно файлы должны присутствовать в репозитории на момент сдачи. От этого зависит, необходимо ли создавать файлы собственноручно (ЛР0, ЛР2) или изменять уже существующие в репозитории файлы (ЛР3, ЛР4, ЛР5). В ЛР1 коммиты в репозитории создает стороннее приложение.

Работу с файлами необходимо осуществлять в локальном клоне вашего репозитория (кроме ЛР1). Эта локальная копия также представляет собой репозиторий, который связан с исходным ссылкой `origin` (источник). Все изменения, которые вы вносите в файлы, следует сначала фиксировать в локальном репозитории, а затем направлять в репозиторий-источник (ваш форк, находящийся на сервере GitHub).

Рассмотрим в упрощенном виде типичную последовательность действий разработчика при работе с системой контроля версий git.

Разработчик создает в репозитории проект, и начинает вносить изменения в его файлы исходного кода. Достигнув определенной стадии разработки (например, реализована часть функционала, проект находится в работоспособном состоянии), разработчик может захотеть зафиксировать состояние проекта в локальном репозитории. Для этого сначала необходимо все файлы, подлежащие фиксации, поместить в индекс (stage) - промежуточный список файлов, который затем будет зафиксирован в качестве текущего состояния. Необходимо выполнить команду

```bash
git add имя_файла
```

Она добавит в индекс указанный в качестве параметра файл. Проверить состояние индекса можно командой

```bash
git status
```

Если изменения в файлы с момента предыдущей фиксации не вносились, вывод команды `git status` будет пустым. Если есть неиндексированные изменения (были изменены отслеживаемые файлы, уже добавленные в индекс файлы или добавлены новые файлы), то соответствующие файлы будут отмечены красным цветом. После внесения командой `git add` состояния файла в индекс соответствующий файл будет отображен зеленым цветом как готовый к фиксации.

Часто возникает необходимость добавить в индекс сразу несколько файлов (и затем зафиксировать их состояние). Этого можно достичь указав несколько параметров в команде `git add`:

```bash
git add имя_файла_1 имя_файла_2 имя_файла_3
```

Также есть возможность добавить в индекс сразу все измененные файлы в рабочем каталоге репозитория командой

```bash
git add .
```

Пользоваться этой командой нужно с осторожностью и пониманием того, какие именно файлы попадут в последующую фиксацию (это можно узнать с помощью `git status`), чтобы не загромождать фиксацию лишними по смыслу изменениями.

Фиксация состояния файла (коммит, commit) выполняется командой

```bash
git commit -m "комментарий к коммиту"
```

Здесь `"комментарий к коммиту"` - ваше сообщение, описывающее, смысл данной фиксации. Например, так:

```bash
git commit -m "Добавлены операторы удаления таблиц"
```

Выполнение команды `git status` после фиксации сообщит о том, что индекс пуст (незафиксированные изменения отсутствуют).

_Для чего используется в реальной жизни_: коммит (фиксация) — снимок состояния проекта в конкретный момент времени (этим термином также обозначается действие по созданию такого снимка), также может быть рассмотрен как список изменений, внесенный разработчиком в предыдущее состояние проекта. Цель системы контроля версий — обеспечение доступа пользователей к состоянию проекта в любой момент времени. Список коммитов представляет собой историю изменений конкретной ветки проекта. Можно получить к нему доступ командой `git log`. При публикации на сервер публикуются не только сами файлы, но и все их версии со связанными с ними изменениями. Например, список изменений репозитория с описанием этого курса можно посмотреть здесь: https://github.com/db-course/syllabus/commits/master

Например, типичный сценарий выполнения лабораторной работы с использованием git может выглядеть следующим образом:

```bash
git status
# нет изменений
```

_...редактирование файлов..._

```bash
git status
# есть неиндексированные изменения, выделены красным цветом
git add измененный_файл_1 измененный_файл_2
git status
# все изменения индексированы, выделены зеленым цветом
git commit -m "Добавлены операторы создания таблиц"
```

_...обнаружена ошибка, редактирование файлов..._

```bash
git status
# есть неиндексированные изменения, выделены красным цветом
git add измененный_файл
git status
# все изменения индексированы, выделены зеленым цветом
git commit -m "Исправлена ошибка создания таблицы Студент"
```

_...редактирование файлов..._

```bash
git status
# есть неиндексированные изменения, выделены красным цветом
git add измененный_файл_1 измененный_файл_2
git status
# все изменения индексированы, выделены зеленым цветом
git commit -m "Таблицы Группа и Студент заполнены данными"
```

## Сдача лабораторной работы

Для сдачи работы необходимо опубликовать историю фиксаций (коммитов) из локального репозитория на сервер, в созданный вами репозиторий-форк. Напомним, на него указывает ссылка `origin`.

Для публикации истории служит команда `git push`:

```bash
git push origin master
```

В ней указывается, в какой репозиторий происходит публикация (`origin` — репозиторий-источник, который был клонирован) и какой ветви (`master` — основная ветвь, созданная в учебных репозиториях по умолчанию). У проекта может быть несколько ветвей, но ветвление не используется при сдаче лабораторных работ и здесь не рассмотрено.

При публикации у вас могут быть затребованы учетные данные сайта GitHub, чтобы проверить, обладаете ли вы достаточными правами.

Публикация коммитов на сервер может быть не окончательной, вы можете продолжать работать над файлами, фиксировать изменения и публиковать их столько, сколько будет необходимо.

Чтобы сдать работу, необходимо отослать историю ваших изменений в центральный репозиторий этой работы в организации `db-course`. Там их увидит и оценит преподаватель.

Выполнить команду `git push` вы не сможете, т.к. не обладаете правами на запись в центральный репозиторий данной работы. Вместо этого вы можете отправить запрос на включение изменений (пулл-реквест, pull request), и преподаватель получит уведомление о нем.

_Для чего используется в реальной жизни_: пулл-реквест (иногда называемый также мердж-реквест, merge request) — основной способ вклада в проекты с открытым исходным кодом лицами, не являющимися членами проекта, но имеющими желание помочь. Помимо того, пулл-реквесты могут использоваться внутри команды разработчиков проекта для обсуждения внесения изменений из одних ветвей проекта в другие.

Для создания пулл-реквеста необходимо зайти на страницу своего репозитория-форка, нажать на ссылку "Contribute" ("Внести вклад"), а затем - на кнопку "Open pull request".

![Pull request 1](https://github.com/db-course/syllabus/blob/master/img/pullrequest1.png)

На появившейся странице в нижней части будут отображены изменения, которые вы внесли в файлы репозитория. В верхней части вам будет предложено написать заголовок и комментарий к своему пулл-реквесту. В заголовке напишите свой номер варианта и фамилию (например, "4 Иванов"). Комментарий можно оставить пустым. Убедитесь, что в поле "base repository" указан адрес центрального репозитория, который вы форкали (например, `db-course/lab1-4241`), а в поле head repository — адрес вашего форка. Кнопка "Create pull request" создаст пулл-реквест, и он будет ждать рассмотрения преподавателем.

![Pull request 2](https://github.com/db-course/syllabus/blob/master/img/pullrequest2.png)

В дальнейшем открытый пулл-реквест (и пулл-реквесты других людей для этой лабораторной работы) можно найти на странице центрального репозитория на вкладке "Pull requests". Все свои пулл-реквесты удобно смотреть с помощью кнопки "Pull requests" в верхней правой части страницы.

![My PRs](https://github.com/db-course/syllabus/blob/master/img/my_prs.png)

Если после создания пулл-реквеста были обнаружены недочеты в работе и необходимо их устранить, можно сделать это путем создания коммитов в локальном репозитории и их опубликования в репозиторий-форк. Все эти коммиты появятся в открытом пулл-реквесте и будут доступны для рассмотрения преподавателем. Закрывать открытые пулл-реквесты, а также удалять свои репозитории-форки нельзя.

Преподаватель сможет оставлять комментарии к вашему пулл-реквесту (например, для уточнения или указания на ошибки).

![Conversation](https://github.com/db-course/syllabus/blob/master/img/conversation.png)

Вы можете также отвечать на комментарии.

Преподаватель может комментировать отдельные строчки вашей работы.

![Code review](https://github.com/db-course/syllabus/blob/master/img/code_review.png)

Вы также можете отвечать на эти комментарии.

![Answer](https://github.com/db-course/syllabus/blob/master/img/answer.png)

В случае успешной сдачи преподаватель отмечает это в пулл-реквесте и закрывает его.

<!-- ## Получение индивидуального задания

В некоторых лабораторных работах (ЛР4, ЛР5) предусмотрено наличие задания, выдаваемого преподавателем студенту индивидуально. В этом случае необходимо:

* создать пулл-реквест с исходными данными, указанными в описании работы (инструкции приведены выше);
* дождаться, пока преподаватель увидит ваш пулл-реквест и сделает коммит в ваш репозиторий на GitHub, содержащий ваше задание;
* извлечь данные из своего репозитория на GitHub в свой локальный репозиторий и слить их с уже имеющимися в нем данными;
* продолжать выполнение лабораторной работы.

Для извлечения данных из удаленного репозитория (`origin`) в локальный служит команда

```bash
git pull
```

Она также производит операцию слияния локальных и удаленных коммитов, если это необходимо. Удаленный репозиторий при этом остается без изменений.
 -->
## Если что-то пошло не так...

В этом подразделе описаны некоторые ситуации, которые могут произойти по ошибке пользователя и привести к затруднению выполнения работы и могут быть исправлены с использованием системы git.

__Неприятность 1__. Испорчены файлы в рабочей директории. Например, нечаянно удалены файлы / стерто содержимое / на клавиатуру легла кошка, заполнила файл бессмыслицей и сохранила изменения.

_Решение_. Можно откатиться к последнему коммиту (фиксации), которая была сделана в локальном репозитории командой

```bash
git reset --hard
```

Не выполняйте эту команду от нечего делать, она сотрет все ваши изменения с момента последней фиксации.

Если вы не фиксируете изменения постепенно, командой будет выполнен откат на начальное состояние репозитория.

__Неприятность 2__. Вы зафиксировали в локальный репозиторий испорченное состояние работы. Например, вы сделали фиксацию без текстового описания и стыдитесь этого / вы сделали и зафиксировали изменения, а потом осознали, что их не следовало делать, так как это не ваш вариант лабораторной / кошка в дополнение к предыдущему выполнила команды `git add` и `git commit` / вы по ошибке вместо файла с кодом записали в репозиторий фотографию своей кошки.

_Решение_. Необходимо "переписать историю", то есть сместить указатель HEAD на предыдущий коммит, а также отменить все незафиксированные изменения в репозиторий. Для этого можно выполнить команду:

```bash
git reset --hard HEAD~1
```

Эта команда еще страшнее, чем предыдущая, поскольку она удаляет не только все незафиксированные изменения, но и данные последней фиксации. Не следует выполнять ее от скуки.

__Неприятность 3__. Вы зафиксировали в локальный репозиторий неполное изменение. Например, вы забыли дописать команду создания одной из таблиц или отформатировать код.

_Решение_. Можно временно сместить указатель HEAD, доделать локальные изменения, а затем вернуть его обратно, сохранив предыдущее описание коммита. Для этого можно выполнить команды:

```bash
git reset --soft HEAD~1
```

_...необходимые изменения..._

```bash
git commit -a -C ORIG_HEAD
```

Последняя команда восстанавливает исходное состояние указателя HEAD, сохраняя описание коммита.

__Неприятность 4__. Вы зафиксировали "плохой" коммит (см. неприятности 2 и 3) и опубликовали его (выполнили push в свой репозиторий на сайте).

_Решение_. Не стоит использовать два предыдущих варианта "переписывания истории" командой `git reset`, поскольку репозиторий на сайте доступен не только вам, и другие пользователи теоретически могут использовать коммиты, от которых вы хотите избавиться. Это может привести к осложнениям для них. В случае, если вам нужно исправить ошибки в опубликованных коммитах, вы должны создать новые коммиты, содержащие исправления, и опубликовать их. Следующие команды создают новый коммит, отменяющий изменения предыдущего, и публикуют его:

```bash
git revert HEAD
git push origin master
# на этом этапе вы опубликовали отмену ранее опубликованных изменений
```

_...если нужно что-то доделать, то необходимые изменения..._

```bash
git add имя_файла_1 имя_файла_2
git commit -m "Доработка"
git push origin master
```

Неправильный коммит сохранится в истории, но будет исправлен следующими.

__Неприятность 5__. Вы зафиксировали "плохой" коммит (см. неприятности 2 и 3), опубликовали его (выполнили `git push` в свой репозиторий на сайте) и создали пулл-реквест, попытавшись сдать работу преподавателю.

_Решение_. Использовать `git reset`, также как и в предыдущем случае, нельзя, поскольку изменения были опубликованы. Хорошая новость в том, что для того чтобы поменять содержимое пулл-реквкста, нужно просто опубликовать исправленный коммит и, если необходимо, дополнения. Решение полностью совпадает с предыдущим.

### Материалы на русском языке для самостоятельного углубленного изучения

* https://githowto.com/ru
* https://git-scm.com/book/ru/v2/
* http://www-cs-students.stanford.edu/~blynn/gitmagic/intl/ru/
* https://tproger.ru/translations/most-common-git-screwupsquestions-and-solutions/

[Назад к главной странице курса](https://github.com/db-course/syllabus)