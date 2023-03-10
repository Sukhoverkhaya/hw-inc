# Инструкция по использованию конструктора заключений "ECG-helper V.2"

## Интерфейс

Открыв приложение, пользователь видит три окна: ***"Меню выбора"***, ***"Выбор фраз"*** и ***"Заключение"***. 

### Меню выбора

 ***"Меню выбора"*** представляет собой заголовки вкладок, содержимое которых будет отображаться в соседнем окне. 
Переключение между этими вкладками будет происходить автоматически (при совершении выбора в одной - открывается следующая),
но при этом остаётся возможность переключать их вручную в произвольном порядке.

### Выбор фраз

Окно ***"Выбор фраз"*** включает в себя три кнопки: ***"Продолжить с новым ритмом"***, ***"Новое заключение"***, ***"Настройки"***; также здесь 
находятся все фразы, входящие во вкладку, открытую в ***"Меню выбора"***. 

Кнопка ***"Продолжить с новым ритмом"*** позволяет пользователю продолжить заполнение текущего заключения, но уже с новыми 
данными (все запрещающие комбинации сбрасываются; новые запрещающие комбинации не будут влиять на часть заключения, 
сформированную в предыдущем цикле). ***"Новое заключение"*** очищает уже написанное заключение и отменяет все существующие 
запреты, возникшие по ходу составления прошлого заключения. В меню ***"Настройки"*** можно выбрать цветовую тему.

Фразы при нажатии на них добавляются вниз заключения. Слева от каждого предложения 
находится маркер-подсказка, наведясь на который можно увидеть, какая фраза будет добавлена в заключение при нажатии соответствующей кнопки.
Также, как было сказано ранее, осуществляется автоматический переход из одного раздела в другой, но при этом есть возможность этого избежать: с зажатой клавишей `Ctrl` фразы будут добавляться в одну строку, без точки в конце, а также не будет происходить перехода в другой раздел. После отжатия `Ctrl` поставится точка и переключится раздел. В то же время, если есть необходимость быстро переключиться на одну из следующих вкладок, в том числе при зажатом `Ctrl`, не наводясь на неё курсором, можно использовать клик `правой кнопкой мыши` (перемещение на один раздел вниз за один клик) или `клавиши-стрелки` (перемещение на один раздел вверх или вниз, в зависимости от нажатой клавиши-стрелки, за одно нажатие). 

При выборе в ***"Меню"*** вкладки ***"Пользовательские фразы"*** откроется другое меню, включающее в себя поле для ввода новой фразы и кнопку
***"Сохранить фразу"***. 
При добавлении фразы она появится над ранее описанным полем, а слева от неё будет находиться кнопка ***"X"***, позволяющая удалить эту фразу. 
Если закрыть программу и открыть её вновь, все добавленные в прошлую сессию фразы останутся и будут доступны для выбора. 

### Заключение

В окне ***"Заключение"*** располагается три кнопки: ***"Очистить"***, ***"Сохранить в историю"*** и ***"Загрузить историю"*** - а также вкладки с текущим 
и сохранёнными в истории заключениями и поле с текстом для заключения (текущего или сохранённого). 
Кнопка ***"Очистить"*** очищает поле с текущим заключением, стирая текст, но оставляя все имеющиеся запреты. 
***"Сохранить в историю"*** сохраняет текущее заключение в файл с историей, а так же открывает его во вкладке рядом (создаёт 
новую, если вкладок меньше 10, либо встаёт на место самой старой из них). ***"Загрузить историю"*** читает ранее сохранённую 
историю из отведённого ей файла (если ранее историю ничего не сохранялось - ничего не произойдёт) и открывает её во 
вкладках рядом по правилам, описанным ранее.

Поле текущего заключения автоматически дополняется выбранными в предыдущем окне фразами, а также доступно к 
самостоятельному редактированию. Если же выбрано одно из сохранённых заключений, то из него можно только копировать 
текст - к редактированию оно не будет доступно.
Помимо всего прочего, при открытии вкладки из истории становится доступным заменить ей имя, введя его в поле в самом низу 
и нажав на кнопку "Сохранить новое имя вкладки".

## Правила работы с редактируемыми файлами ##

В текущей версии приложения используется три файла, доступных к редактированию пользователем: `phrase-src.yaml`, `param_list.yaml` и `NormTables.txt`.
Все описанные файлы содержатся в папке settings, находящейся в одной директории с испольняемым файлом приложения helper-gui.exe.

**Что может быть изменено/добавлено в GUI посредством редактирования описанных файлов:**
1. Разделы и фразы.
2. Текст фразы, отображаемый ва меню и в заключении при выборе из меню.
3. Запрещабщие комбинации и условия подсветки каждой фразы.
4. Параметры, вводимые вручную, а также интерфейс для их ввода, имя и тип данных.
5. Нормативные таблицы, формирующие запреты по комбинациям значений параметров.
6. Формулы расчета параметров.

Общие правила оформления файлов типа yaml можно прочитать по [ссылке](https://gist.github.com/sairus7/7690f55c492354e1f8108d896ff11ebe). Подробнее о редактировании каждого из перечисленных файлов будет написано ниже.

### Правила оформления файла с диагнозами и ограничениями `phrase-src.yaml` ###

**Зачем изменять файл:**
* Для добавления и/или удаления разделов и фраз.
* Для добавления новых запрещающих комбинаций и условий подсветки для фраз.
* Для изменения шаблонов.

Помимо общих правил оформления файлов формата yaml, которые можно прочесть по [ссылке](https://gist.github.com/sairus7/7690f55c492354e1f8108d896ff11ebe), для работы с файлом диагнозов и ограничений нужно знать следующие правила:

**1.  Компоненты раздела:**
- ***key*** -       ключ раздела, который используется в системе шаблонов.
- ***elements*** -  все фразы, входящие в текущий раздел.

**2.  Компоненты фразы:**
- ***name*** -      текст диагноза (фразы), который будет отображаться в гуи.
- ***phrase*** -    текст, который будет добавлен в заключение при выборе из меню фразы с именем ***name*** (может включать систему шаблонов, о которой можно прочесть [здесь](https://github.com/IncartDev/std-ecg-report/blob/main/README.md#%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0-%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD%D0%BE%D0%B2).
- ***self-ban*** -      запреты, действующие на текущий элемент (те, при актуальности которых фраза не будет отображаться в меню выбора). Множественные запреты указываются в квадратных скобках, например: self-ban: ["A", "B", "C"].
- ***imposed-ban*** -   запреты, формируемые при выборе элемента (те, которые станут актуальными при выборе данной фразой, и могут приниматься другими фразами в поле ***self-ban***). Поле может содержать только один (уникальный) ключ запрета.
- ***light***-          приоритет (подсветка или выбор по умолчанию), действующий на текущий элемент. Поле может сожержать только где-то ранее определённый ключ(и), всегда указанные в квадратных скобках, даже в случае с одним элементом.

> Обязательным для фразы является только поле ***name*** - остальные могут быть добавлены по мере необходимости.

### Система "Шаблонов"

Шаблон представляет собой некоторый текст, состоящий из обычных слов - `ритм`, ключей - `$keyX`, подстрок, находящихся в фигурных скобках -`{текст вложенного шаблона...}`. Таким образом, при выполнении определённых условий, описанных ниже, текст добавляемый в заключение не обязательно будет совпадать с именем выбранного элемента, а соответствовать его шаблону.


#### Символы $ и {}


$ означает, что в этом месте мы хотим обратиться к ключу, при этом `$key1` - обращение к ключу `key1`, а `$` - обращение к ключу текущей группы/фразы.  Ключи нужны для того, чтобы связывать категории между собой. Таким образом, эта конструкция позволяет объединять в одну фразу элементы, выбранные в разных разделах, поэтому у каждого раздела должен быть свой уникальный ключ. 

В конечном варианте фразы на место ключа подставится имя элемента, выбранного в группе, имеющей данный ключ. Если такой элемент не выбран - вместо
ключа ничего не подставляется, а он просто стирается. 

Исключением являются ключи, прописанные в фигурных скобках `{<...> $key1 <...>}` - такая конструкция будет подставлена в итоговую фразу ТОЛЬКО тогда, когда найдутся ВСЕ ключи, объявленные у неё внутри. В противном случае в итоговой фразе будет всё, за исключением содержимого этих скобок. Фигурные скобки можно вкладывать друг в друга - все правила продолжают работать так же. 


#### Приоритеты и пустые шаблоны


Если и у элемента, и у группы, включающей его, есть шаблоны, то будет использоваться шаблон элемента. Сами по себе шаблоны элементов и категорий работают идентично - разница лишь в приоритетах.

Если группа в текстовом документе записана следующим образом: 
```
- key1: Group1
  name1: Группа без шаблона
  elements:
  - {name: текст 1}
  - {name: текст 2, phrse: Это $}  
  - {name: текст 3}
```
, то будет считаться, что у этой группы отсутствует шаблон. То есть при выборе элемента из этой группы в конечной фразе будет находиться либо текст по шаблону этого элемента, либо имя самого элемента.

Если группа в текстовом документе имеет поле `phrase` и записана следующим образом: 
```
- key2: Group2
  name2: Группа с шаблоном 
  phrase: "Ваши выборы : { $Group1 } {, $Group2 }"
  - {name: текст 6}
  - {name: текст 7, phrase: { меня будет видно только вместе с $key1 } }
```
, то будет считаться, что у фразы есть шаблон, то есть при выборе любого элемента, у которого отсутствует собственный шаблон, будет выводиться содержимое поля phrase.

> Таким образом, если у фразы есть своё поле ***phrase***, то она игнорирует общий шаблон группы и выводится со своим шаблоном. Если же это поле у фразы отсутсвует, то она подчиняется общему шаблону группы.

> Частный случай: если нужно, чтобы только одна или несколько фраз группы не подчинялись общему шаблону, но при этом не имели своего, то есть выводились в том же виде, что указаны в меню выбора, в их поле **phrase** можно указать ***"$"***.

#### Пример работы шаблона:

Пусть есть следующий текст в исходном файле:
```
- key1: Group1
  name1: Группа без шаблона
  elements:
  - {name: текст 1}
  - {name: текст 2, phrse: Это $}  
  - {name: текст 3}
#
- key2: Group2
  name2: Группа с шаблоном 
  phrase: "Ваши выборы : { $Group1 } {, $Group2 }"
  - {name: текст 6}
  - {name: текст 7, phrase: { меня будет видно только вместе с $key1 } }
#
```

Тогда при последовательном выборе следующих элементов будет следующий результат:

Ввод  : `текст 1 + текст 3 + текст 5`
Вывод : 

```
текст 1
Вы выбрали текст 5
```

Ввод  : `текст 1 + текст 2 + текст 4 + текст 6` 
Вывод : 

```
текст 1
Это текст 2
Ваш выбор: текст 2, текст 4, текст 6
```

Ввод  : `текст 2 + текст 7` 
Вывод : 

```
Это текст 2
меня будет видно только вместе с текст 2
```

### Правила оформления файла с конфигурации `param_list.yaml` ###

**Файл определяет:**
* Вид раздела "Добавить параметры".
* Ключи, по которым можно можно обращаться к значениям параметров в системе шаблонов или нормативных таблицах.
* Типы вводимых параметров.
* Интерфейс ввода параметров.

**Зачем изменять файл:**
* Для добавления новых параметров, которые можно вводить вручную или рассчитывать с использованием формул из других введённых параметров.
* Для определения или изменения формата ввода параметров.
* Для изменения формул расчета параметров, для которых они используются.
* При добавлении новой нормотивной таблицы нужно определить оцениваемые в ней параметры, если они не были определены ранее, описав их в данном файле.

Перед работой можно при необходимости ознакомиться с общими правилами оформления файлов формата yaml, которые можно прочесть по [ссылке](https://gist.github.com/sairus7/7690f55c492354e1f8108d896ff11ebe).

Каждый блок в данном файле является описанием параметра и интерфейса для его ввода. Каждый такой элемент содержит поля, общие для всех элементов и описывающие сам параметр, и поля, описывающие ограниченный набор возможных интерфейсов ввода данного параметра.

**1. Поля, общие для всех элементов и описывающие сам параметр:**
- ***name*** -  ключ параметра, по которому к нему можно обращаться в системе шаблонов, использующейся в файле `phrase_src.yaml`, и в нормативных таблицах, содержащихся в файле `NormTables.txt`.
- ***text*** -  текст, содержащий осмысленное имя параметра, который будет отображаться в GUI рядом с элементом его ввода.
- ***units*** - один из поддерживаемых типов параметров.
- ***guiStyle*** - один из поддерживаемых вариантов интерфейса ввода параметров (описаны ниже, в пункте 2). *Важно учитывать, что не все типы параметров могут быть использованы с определённым вариантами интерфейса ввода, что также будет описано в следующем пункте. То есть, поддерживаются не любые комбинации значений полей ***units*** и ***guiStyle***.

**2. Поля, зависящие от выбранного элемента ввода (содержимого поля ***guiStyle***)**

- ***variable_text*** - поле перечисления элементов для выбора. Может быть добавлено только в элементы, содержащие ***guiStyle: "ComboBox"*** и ***guiStyle: "RadioButton"*** (элементы, подразумевающие выбор заведомо известных значений).
Поле заполяется значениями следующего формата: 
```
variable_text: [key1: "text1", key2: "text2", key3: "text3"]
```
Значения **text1**, **text2** и **text3** будут отображаться в гуи как варианты для выбора. Когда выбор будет сделан, элемент вернёт ключ, состоящий из содержимого поля name данного элемента и соответсвующего выбранному значению ключа (**key1**, **key2** или **key3**). Таким образом, прописав элемент вида:

```
- {name: Sex, text: "Пол:", guiStyle: "RadioButton",  units: "String", variable_text: [ Male: "Мужчина", 
                                                                                        Female: "Женщина"]}
```                                                                                                  
Мы получим в интерфейсе GUI радиокнопки с вариантами "Мужчина" и "Женщина". Выбрав "Мужчина", мы сформируем запрет `Sex.Male`, а выбрав "Женщина" - `Sex.Female`. Зпрет может быть использован в таком формате напрямую в файлах диагнозов и ограничений и/или отправлен в соответствующую нормативную таблицу (таблицы) для формирования запрета по комбинациям параметров.

- ***guiStyle: "InputInt"*** - элемент ввода числовго значения вручную. Поле ***units*** для этого элемента может содержать только значение Number.
```
Пример создания такого элемента: - {name: HR, text: "ЧСС:", guiStyle: "InputInt", units: "Number"}
```
- ***guiStyle: "ComboBox"*** - выпадающий список заранее заданных элементов для выбора. Такой элемент всегда должен содержать поле  ***variable_text*** с перечислением всех доступных для выбора значений.
Поле ***units*** для этого элемента может содержать только значение Number и String.
```
Пример создания такого элемента: 
- {name: Trans,   text: "Переходная зона:", guiStyle: "ComboBox", units: "String", variable_text: [ ..V1: "..V1", 
                                                                                                    V1: "V1", 
                                                                                                    V1-V2: "V1-V2", 
                                                                                                    V2: "V2", 
                                                                                                    V2-V3: "V2-V3", 
                                                                                                    V3: "V3", 
                                                                                                    V3-V4: "V3-V4", 
                                                                                                    V4: "V4", 
                                                                                                    V4-V5: "V4-V5", 
                                                                                                    V5: "V5", 
                                                                                                    V5-V6: "V5-V6", 
                                                                                                    V6..: ">V6"]}
```
- ***guiStyle: "RadioButton"*** - кнопки с заранее заданными вариантами для выбора. Такой элемент всегда должен содержать поле  ***variable_text*** с перечислением всех доступных для выбора значений.
Поле ***units*** для этого элемента может содержать только значение Number и String.
```
Пример создания такого элемента: 
- {name: Sex,     text: "Пол:", guiStyle: "RadioButton", units: "String", variable_text: [  Male: "Мужчина", 
                                                                                            Female: "Женщина"]}
```
- ***guiStyle: "CalcResult"*** - недоступное для редактирования поля для отображения результата расчета параметра по указанной формуле. Поле ***units*** для этого элемента может содержать только значение Number.
Поле ***formula*** допустимо только для этого элемента и содержит формулу для расчета данногог параметра.
```
Пример создания такого элемента: 
- {name: pcRRdiv, text: "% RR мин.: ", guiStyle: "CalcResult", units: "Number", formula: ((RRmax - RRmin) / RRmean)*100}
```
**Правила заполнения поля ***formula***:**
* Формула может содержать только операторы +, -, /, *, ^ и скобки () (извлечение квадратного корня аналогично возведению в степень 0.5, поэтому может быть записано как 4 ^ 0.5 или 4 ^ (1/2)).
* Формула может содержать ключи других параметров, которые должны быть использованы в расчётах (ключ параметра лежит в поле ***name*** его элемента). Важно, чтобы используемый в формуле ключ отсылал к существующему (описанному ВЫШЕ в том же документе) параметру, а содержимое поля ***units*** элемента по данному ключу содержало строго Number или Age (т.к. в формуле могут быть использованы только числа).
* Десятичная форма записи числа допустима только через точку, например: 15.2
* Формула должна быть уравновешенной, то есть содержать раное количество открывающих и закрывающих скобок и значения (или выражения, вычисления которых дают значения) по обе стороны от математических операторов

### Правила оформления файла с нормативными таблицами `NormTables.txt` ###

Данный файл содержит все нормативные таблицы, формирующие запреты по полученной комбинации значений. Таблицы имеют вид:

```
QTc                                 key2 - это ключ параметра 2, значения поторого содержатся во всех ячейках таблицы, кроме первого столбца (и имён столбцов)
Sex: Female                         key0: value - это ключ параметра 0 и его значение
Age;	Short;	Norm;	Long            key1; запрет1; запрет2; запрет3 - это имена столбцов. Имя первого столбца - всегда ключ параметра, значения которого содержатся в этом столбце, остальное - запреты, возвращаемые попаданием в данный столбец
..18y;  ..320;  ..440;  ..                                                                                                                                             
..; ..340;  ..460;  ..
```

- Группирующий параметр `key0: value` необязательный (может не быть указан в таблице), остальные - обязательны.
- Все ключи **key**, используемые в талицах, должны быть прописаны в файле **param_list.yaml**. Они должны соответствовать содержимому поля name используемых в таблице параметров.
- Все значения будут интерпретированы в тип данных, указаный (в файле **param_list.yaml**) по ключу, которому они соответсвую в таблице.
Например, файл **param_list.yaml** содержит следующие записи:
```
- {name: Sex, text: "Пол:", guiStyle: "RadioButton",  units: "String", variable_text: [   Male: "Мужчина", 
                                                                                          Female: "Женщина"]}
- {name: QTc, text: "Корригированный QT: ", guiStyle: "CalcResult", units: "Number", formula: QT / HR ^ 0.5}
- {name: Age, text: "Дата рождения: ", guiStyle: "Calendar", units: "Age"}
```
**Обращаем внимание на содержимое полей Name и соответствующее им содержимое полей units.**

В указанной в качестве примера нормотивной таблице по ключу ***Sex***: указано значение ***Female*** - согласно информации из **param_list**, оно будет интерпретировано как текст.
По ключу ***Age*** указаны значения в формкте `"..18; .."`, которые будут интерпретированы как ***Age***, потому что такой формат соответсвует параметру ***Age*** согласно **param_list**.
По ключу ***Qtc*** указаны значения в формате `"..320; ..440; .."`, которые будут интерпретированы как ***Number***, потому что такой формат соответствует параметру ***Qtc*** согласно **param_list**.

>  Формат, в который будут интерпретированы значения, важно знать и учитывать, потому что от него напрямую зависит способ анализа таблицы - подробнее об этом рассказывает раздел "О поддерживаемых типах данных".

Таким образом, если в первый столбец таблицы, в котором указаны значения по ключу ***Age***, были бы записаны любые символы, кроме цифр, d/m/y и .., мы получали бы ошибку, так как такие значения не могут быть интерпретированы в возраст. То же актуально и для остальных значений в таблице, которые, будучи связанными с ключом ***QTc***, должны интерпретироваться в тип ***Number***, в который не получится перевести буквы и/или другие символы, кроме цифр, d/m/y и .. .
В то же время, если бы в поле ***Sex***, интерпретируемое в ***String***, было бы записано значение вида "3d..18y", вместо диапазона возраста мы получили бы просто строку "3d..18y", которая не дала бы ошибку, но не совпала бы ни с "Male" ни с "Female" - следовательно, таблица никогда не была бы использована.

________
![image](https://user-images.githubusercontent.com/90982979/224304099-ddb99789-a6eb-42bf-bca5-7e98c71ff6e8.png)

**Поиск по таблице происходит по следующему алгоритму:**
- Если в **param_list** есть параметр с ключом, совпадающим с ***key2*** - данна таблица выбирается для оценки.
- Проверка группирующих параметров: по ключам ***key0*** берётся введённое значение и сравнивается с указанным в таблице. Если хотя бы один группирующий параметр не совпадает с введённым (или не попадает в диапазон) - таблица не используется.
- Если таблица выбрана по имени и группирующим параметрам, начинается поиск по значениям первого столбца: по ключу ***key1*** берётся значение из введённых, и в соответсвии с типом данных, привязанным к ключу, производится поиск строки, в которую
"пападает" введённое значение.
- После выбора строки, поиск по остальным стобцам в ней производится по значению введённого параметра, взятому по ключу ***key2***, по правилам, описанным в предыдущем пункте.
- Имя столбца, в котором найдено соответсвие - ключ запрета.
- Таблица возвращает запрет в формате `ИмяТаблицы.ИмяСтолбца`. Например, для таблицы выше, это могут быть запреты `QTc.Short`, `QTc.Norm`, `QTc.Long`.

## Примеры наиболее вероятных сценариев использования ## 
