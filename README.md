# Инструкция по использованию конструктора заключений "ECG-helper V.2"

**Содержание:**
* [Интерфейс](#Интерфейс)
  * [Меню выбора](#Меню_выбора)
  * [Выбор фраз](#Выбор_фраз)
  * [Заключение](#Заключение)
* [Правила работы с редактируемыми файлами](#Правила_работы_с_редактируемыми_файлами)
  * [Правила оформления файла с диагнозами и ограничениями phrase-src.yaml](#phrase-src.yaml)
  * [Правила оформления файла с конфигурации param_list.yaml](#param_list.yaml)
  * [Правила оформления файла с нормативными таблицами NormTables.txt](#NormTables.txt)
* [Примеры наиболее частых сценариев использования редактируемых файлов](#Сценарии)
  * [Фраза отобразилась, когда не должна была](#Error1)
  * [Фраза не отобразилась, когда должна была](#Error2)
  * [Фраза подсветилась, когда не должна была](#Error3)
  * [Фраза не подсветилась, когда должна была](#Error4)
  * [Нужно добавить новый раздел и/или новую фразу](#Error5)
  * [Нужно изменить имя параметра](#Error6)
  * [Результат расчёта по формуле неверен / нужно изменить формулу расчёта параметра](#Error7)
  * [Нужно изменить порядок расположения параметров в разделе их ввода](#Error8)
  * [Нужно добавить новый параметр для ввода](#Error9)
  * [Нужно удалить параметр для ввода](#Error10)
  * [Нужно добавить новую нормативную таблицу](#Error11)
  * [Нужно удалить нормативную таблицу](#Error12)
__________________________________________________________________________________________________________________
<a name="Интерфейс"></a> 
## Интерфейс

Открыв приложение, пользователь видит три окна: ***"Меню выбора"***, ***"Выбор фраз"*** и ***"Заключение"***. 

<a name="Меню_выбора"></a>
### Меню выбора 

 ***"Меню выбора"*** представляет собой заголовки вкладок, содержимое которых будет отображаться в соседнем окне. 
Переключение между этими вкладками будет происходить автоматически (при совершении выбора в одной - открывается следующая),
но при этом остаётся возможность переключать их вручную в произвольном порядке. 

<a name="Выбор_фраз"></a>
### Выбор фраз

Окно ***"Выбор фраз"*** включает в себя три кнопки: ***"Новый ритм"***, ***"Заново"***, ***"Настройки"***; также здесь 
находятся все фразы, входящие во вкладку, открытую в ***"Меню выбора"***. 

Кнопка ***"Новый ритм"*** позволяет пользователю продолжить заполнение текущего заключения, но уже с новыми 
данными (все запрещающие комбинации сбрасываются; новые запрещающие комбинации не будут влиять на часть заключения, 
сформированную в предыдущем цикле). ***"Заново"*** очищает уже написанное заключение и отменяет все существующие 
запреты, возникшие по ходу составления прошлого заключения. В меню ***"Настройки"*** можно выбрать цветовую тему.

Фразы при нажатии на них добавляются вниз заключения. Слева от каждого предложения 
находится маркер-подсказка, наведясь на который можно увидеть, какая фраза будет добавлена в заключение при нажатии соответствующей кнопки.
Также, как было сказано ранее, осуществляется автоматический переход из одного раздела в другой, но при этом есть возможность этого избежать: с зажатой клавишей `Ctrl` фразы будут добавляться в одну строку, без точки в конце, а также не будет происходить перехода в другой раздел. После отжатия `Ctrl` поставится точка и переключится раздел. В то же время, если есть необходимость быстро переключиться на одну из следующих вкладок, в том числе при зажатом `Ctrl`, не наводясь на неё курсором, можно использовать клик `правой кнопкой мыши` (перемещение на один раздел вниз за один клик) или `клавиши-стрелки` (перемещение на один раздел вверх или вниз, в зависимости от нажатой клавиши-стрелки, за одно нажатие). 

При выборе в ***"Меню"*** вкладки ***"Пользовательские фразы"*** откроется другое меню, включающее в себя поле для ввода новой фразы и кнопку
***"Сохранить фразу"***. 
При добавлении фразы она появится над ранее описанным полем, а слева от неё будет находиться кнопка ***"X"***, позволяющая удалить эту фразу. 
Если закрыть программу и открыть её вновь, все добавленные в прошлую сессию фразы останутся и будут доступны для выбора. 

<a name="Заключение"></a>
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
__________________________________________________________________________________________________________________
<a name="Правила_работы_с_редактируемыми_файлами"></a>
## Правила работы с редактируемыми файлами ##

В текущей версии приложения используется три файла, доступных к редактированию пользователем: `phrase-src.yaml`, `param_list.yaml` и `NormTables.txt`.
Все описанные файлы содержатся в папке settings, находящейся в одной директории с исполняемым файлом приложения helper-gui.exe.

**Что может быть изменено/добавлено в GUI посредством редактирования описанных файлов:**
1. Разделы и фразы.
2. Текст фразы, отображаемый в меню и в заключении при выборе из меню.
3. Запрещающие комбинации и условия подсветки каждой фразы.
4. Параметры, вводимые вручную, а также интерфейс для их ввода, имя и тип данных.
5. Нормативные таблицы, формирующие запреты по комбинациям значений параметров.
6. Формулы расчета параметров.

Общие правила оформления файлов типа yaml можно прочитать по [ссылке](https://gist.github.com/sairus7/7690f55c492354e1f8108d896ff11ebe). Подробнее о редактировании каждого из перечисленных файлов будет написано ниже.
__________________________________________________________________________________________________________________
<a name="phrase-src.yaml"></a>
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
- ***name*** -      текст диагноза (фразы), который будет отображаться в приложении.
- ***phrase*** -    текст, который будет добавлен в заключение при выборе из меню фразы с именем ***name*** (может включать систему шаблонов, о которой можно прочесть [здесь](#phrase-src.yaml).
- ***self-ban*** -      запреты, действующие на текущий элемент (те, при актуальности которых фраза не будет отображаться в меню выбора). Множественные запреты указываются в квадратных скобках, например: self-ban: ["A", "B", "C"].
- ***imposed-ban*** -   запреты, формируемые при выборе элемента (те, которые станут актуальными при выборе данной фразой, и могут приниматься другими фразами в поле ***self-ban***). Поле может содержать только один (уникальный) ключ запрета.
- ***light***-          приоритет (подсветка или выбор по умолчанию), действующий на текущий элемент. Поле может содержать только где-то ранее определённый ключ(и), всегда указанные в квадратных скобках, даже в случае с одним элементом.

> Обязательным для фразы является только поле ***name*** - остальные могут быть добавлены по мере необходимости.
__________________________________________________________________________________________________________________
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
  - {name: текст 2, phrase: Это $}  
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

> Таким образом, если у фразы есть своё поле ***phrase***, то она игнорирует общий шаблон группы и выводится со своим шаблоном. Если же это поле у фразы отсутствует, то она подчиняется общему шаблону группы.

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
__________________________________________________________________________________________________________________
<a name="param_list.yaml"></a>
### Правила оформления файла с конфигурации `param_list.yaml` ###

**Файл определяет:**
* Вид раздела "Ввод параметров".
* Ключи, по которым можно можно обращаться к значениям параметров в системе шаблонов или нормативных таблицах.
* Типы вводимых параметров.
* Интерфейс ввода параметров.

**Зачем изменять файл:**
* Для добавления новых параметров, которые можно вводить вручную или рассчитывать с использованием формул из других введённых параметров.
* Для определения или изменения формата ввода параметров.
* Для изменения формул расчета параметров, для которых они используются.
* При добавлении новой нормативной таблицы нужно определить оцениваемые в ней параметры, если они не были определены ранее, описав их в данном файле.

Перед работой можно при необходимости ознакомиться с общими правилами оформления файлов формата yaml, которые можно прочесть по [ссылке](https://gist.github.com/sairus7/7690f55c492354e1f8108d896ff11ebe).

Каждый блок в данном файле является описанием параметра и интерфейса для его ввода. Каждый такой элемент содержит поля, общие для всех элементов и описывающие сам параметр, и поля, описывающие ограниченный набор возможных интерфейсов ввода данного параметра.

**1. Поля, общие для всех элементов и описывающие сам параметр:**
- ***name*** -  ключ параметра, по которому к нему можно обращаться в системе шаблонов, использующейся в файле `phrase_src.yaml`, и в нормативных таблицах, содержащихся в файле `NormTables.txt`.
- ***text*** -  текст, содержащий осмысленное имя параметра, который будет отображаться в GUI рядом с элементом его ввода.
- ***units*** - один из поддерживаемых типов параметров.
- ***guiStyle*** - один из поддерживаемых вариантов интерфейса ввода параметров (описаны ниже, в пункте 2). *Важно учитывать, что не все типы параметров могут быть использованы с определённым вариантами интерфейса ввода, что также будет описано в следующем пункте. То есть, поддерживаются не любые комбинации значений полей ***units*** и ***guiStyle***.

**2. Поля, зависящие от выбранного элемента ввода (содержимого поля ***guiStyle***)**

- ***variable_text*** - поле перечисления элементов для выбора. Может быть добавлено только в элементы, содержащие ***guiStyle: "ComboBox"*** и ***guiStyle: "RadioButton"*** (элементы, подразумевающие выбор заведомо известных значений).
Поле заполняется значениями следующего формата: 
```
variable_text: [key1: "text1", key2: "text2", key3: "text3"]
```
Значения **text1**, **text2** и **text3** будут отображаться в приложении как варианты для выбора. Когда выбор будет сделан, элемент вернёт ключ, состоящий из содержимого поля name данного элемента и соответствующего выбранному значению ключа (**key1**, **key2** или **key3**). Таким образом, прописав элемент вида:

```
- {name: Sex, text: "Пол:", guiStyle: "RadioButton",  units: "String", variable_text: [ Male: "Мужчина", 
                                                                                        Female: "Женщина"]}
```                                                                                                  
Мы получим в интерфейсе GUI радиокнопки с вариантами "Мужчина" и "Женщина". Выбрав "Мужчина", мы сформируем запрет `Sex.Male`, а выбрав "Женщина" - `Sex.Female`. Запрет может быть использован в таком формате напрямую в файлах диагнозов и ограничений и/или отправлен в соответствующую нормативную таблицу (таблицы) для формирования запрета по комбинациям параметров.

- ***guiStyle: "InputInt"*** - элемент ввода числового значения вручную. Поле ***units*** для этого элемента может содержать только значение Number. Пример создания такого элемента:
```
- name: HR 
  text: "ЧСС:" 
  guiStyle: "InputInt" 
  units: "Number"
```
- ***guiStyle: "ComboBox"*** - выпадающий список заранее заданных элементов для выбора. Такой элемент всегда должен содержать поле  ***variable_text*** с перечислением всех доступных для выбора значений.
Поле ***units*** для этого элемента может содержать только значение Number и String.
```
Пример создания такого элемента: 
- name: Trans   
  text: "Переходная зона:" 
  guiStyle: "ComboBox" 
  units: "String" 
  variable_text: [ ..V1: "..V1", 
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
                     V6..: ">V6"]
```
- ***guiStyle: "RadioButton"*** - кнопки с заранее заданными вариантами для выбора. Такой элемент всегда должен содержать поле  ***variable_text*** с перечислением всех доступных для выбора значений.
Поле ***units*** для этого элемента может содержать только значение Number и String.
```
Пример создания такого элемента: 
- name: Sex     
  text: "Пол:" 
  guiStyle: "RadioButton" 
  units: "String" 
  variable_text: [  Male: "Мужчина", 
                    Female: "Женщина"]
```
- ***guiStyle: "CalcResult"*** - недоступное для редактирования поля для отображения результата расчета параметра по указанной формуле. Поле ***units*** для этого элемента может содержать только значение Number.
Поле ***formula*** допустимо только для этого элемента и содержит формулу для расчета данного параметра. Пример создания такого элемента:
``` 
- name: pcRRdiv 
  text: "% RR мин.: " 
  guiStyle: "CalcResult" 
  units: "Number" 
  formula: ((RRmax - RRmin) / RRmean)*100
```
**Правила заполнения поля ***formula***:**
* Формула может содержать только операторы +, -, /, *, ^ и скобки () (извлечение квадратного корня аналогично возведению в степень 0.5, поэтому может быть записано как 4 ^ 0.5 или 4 ^ (1/2)).
* Формула может содержать ключи других параметров, которые должны быть использованы в расчётах (ключ параметра лежит в поле ***name*** его элемента). Важно, чтобы используемый в формуле ключ отсылал к существующему (описанному ВЫШЕ в том же документе) параметру, а содержимое поля ***units*** элемента по данному ключу содержало строго Number или Age (т.к. в формуле могут быть использованы только числа).
* Десятичная форма записи числа допустима только через точку, например: 15.2
* Формула должна быть уравновешенной, то есть содержать равное количество открывающих и закрывающих скобок и значения (или выражения, вычисления которых дают значения) по обе стороны от математических операторов
__________________________________________________________________________________________________________________
<a name="NormTables.txt"></a>
### Правила оформления файла с нормативными таблицами `NormTables.txt` ###

Данный файл содержит все нормативные таблицы, формирующие запреты по полученной комбинации значений. Таблицы имеют вид:

```
QTc                                 key2 - это ключ параметра 2, значения которого содержатся во всех ячейках таблицы, кроме первого столбца (и имён столбцов)
Sex: Female                         key0: value - это ключ параметра 0 и его значение
Age;	Short;	Norm;	Long            key1; запрет1; запрет2; запрет3 - это имена столбцов. Имя первого столбца - всегда ключ параметра, значения которого содержатся в этом столбце, остальное - запреты, возвращаемые попаданием в данный столбец
..18y;  ..320;  ..440;  ..                                                                                                                                             
..; ..340;  ..460;  ..
```

- Группирующий параметр `key0: value` необязательный (может не быть указан в таблице), остальные - обязательны.
- Все ключи **key**, используемые в таблицах, должны быть прописаны в файле **param_list.yaml**. Они должны соответствовать содержимому поля name используемых в таблице параметров.
- Все значения будут интерпретированы в тип данных, указанный (в файле **param_list.yaml**) по ключу, которому они соответствуют в таблице.
Например, файл **param_list.yaml** содержит следующие записи:
```
- name: Sex 
  text: "Пол:" 
  guiStyle: "RadioButton"  
  units: "String" 
  variable_text: [ Male: "Мужчина", 
                   Female: "Женщина"]

- name: QTc 
  text: "Корригированный QT: " 
  guiStyle: "CalcResult" 
  units: "Number" 
  formula: QT / HR ^ 0.5

- name: Age 
  text: "Дата рождения: " 
  guiStyle: "Calendar" 
  units: "Age"
```
**Обращаем внимание на содержимое полей Name и соответствующее им содержимое полей units.**

В указанной в качестве примера нормативной таблице по ключу ***Sex***: указано значение ***Female*** - согласно информации из **param_list**, оно будет интерпретировано как текст.
По ключу ***Age*** указаны значения в формате `"..18; .."`, которые будут интерпретированы как ***Age***, потому что такой формат соответствует параметру ***Age*** согласно **param_list**.
По ключу ***QTc*** указаны значения в формате `"..320; ..440; .."`, которые будут интерпретированы как ***Number***, потому что такой формат соответствует параметру ***QTc*** согласно **param_list**.

>  Формат, в который будут интерпретированы значения, важно знать и учитывать, потому что от него напрямую зависит способ анализа таблицы - подробнее об этом рассказывает раздел "О поддерживаемых типах данных".

Таким образом, если в первый столбец таблицы, в котором указаны значения по ключу ***Age***, были бы записаны любые символы, кроме цифр, d/m/y и .., мы получали бы ошибку, так как такие значения не могут быть интерпретированы в возраст. То же актуально и для остальных значений в таблице, которые, будучи связанными с ключом ***QTc***, должны интерпретироваться в тип ***Number***, в который не получится перевести буквы и/или другие символы, кроме цифр, d/m/y и .. .
В то же время, если бы в поле ***Sex***, интерпретируемое в ***String***, было бы записано значение вида "3d..18y", вместо диапазона возраста мы получили бы просто строку "3d..18y", которая не дала бы ошибку, но не совпала бы ни с "Male" ни с "Female" - следовательно, таблица никогда не была бы использована.

________
![image](https://user-images.githubusercontent.com/90982979/224304099-ddb99789-a6eb-42bf-bca5-7e98c71ff6e8.png)

**Поиск по таблице происходит по следующему алгоритму:**
- Если в **param_list** есть параметр с ключом, совпадающим с ***key2*** - данная таблица выбирается для оценки.
- Проверка группирующих параметров: по ключам ***key0*** берётся введённое значение и сравнивается с указанным в таблице. Если хотя бы один группирующий параметр не совпадает с введённым (или не попадает в диапазон) - таблица не используется.
- Если таблица выбрана по имени и группирующим параметрам, начинается поиск по значениям первого столбца: по ключу ***key1*** берётся значение из введённых, и в соответствии с типом данных, привязанным к ключу, производится поиск строки, в которую
"попадает" введённое значение.
- После выбора строки, поиск по остальным столбцам в ней производится по значению введённого параметра, взятому по ключу ***key2***, по правилам, описанным в предыдущем пункте.
- Имя столбца, в котором найдено соответствие - ключ запрета.
- Таблица возвращает запрет в формате `ИмяТаблицы.ИмяСтолбца`. Например, для таблицы выше, это могут быть запреты `QTc.Short`, `QTc.Norm`, `QTc.Long`.
__________________________________________________________________________________________________________________
<a name="Сценарии"></a>
## Примеры наиболее частых сценариев использования редактируемых файлов ## 
Для упрощения работы с редактируемыми текстовыми файлами `phrase-src.yaml`, `param_list.yaml` и `NormTables.txt` в данном разделе приведены проблемы, наиболее часто возникающие и доступные к решению путём редактирования этих файлов, и пошаговые алгоритмы действий.

<a name="Error1"></a>
### Фраза отобразилась, когда не должна была

Для работы понадобится знание об устройстве файлов [`phrase-src.yaml`](#phrase-src.yaml) и [`NormTables.txt`](#NormTables.txt).

Единственный способ скрывать фразу из меню выбора при каких-то условиях - добавить в поле ***self-bans*** этой фразы ключи, активирующиеся в этих условиях. Таким образом, если фраза отображается, когда не должна, нужно либо изменить содержимое её поля ***self-bans***, либо изменить условия активации ключей, содержащихся в этом поле.

Ключи активируются тремя путями, от которых зависит порядок действий для решения проблемы. Для определения алгоритма действий нужно выбрать, при каком условии фраза должна скрыться:

**I. Фраза должны скрыться, если до неё была выбрана определённая фраза:**
1. Открываем файл `phrase-src.yaml`.
2. Находим фразу (можно использовать сочетание клавиш `Ctrl + F` для быстрого поиска), при выборе которой редактируемая фраза должна скрыться.
3. Проверяем поле ***imposed-ban***: если оно отсутствует, добавляем его и заполняем УНИКАЛЬНЫМ значением, которое нигде ранее не использовалось, например: `imposed-ban: S`. Теперь содержимое этого поля - запрет, активируемый выборов этой фразы. Если же поле уже есть, запоминаем указанное там значение.
4. Возвращаемся к редактируемой фразе: чтобы она скрывалась, имя запрета, полученное на шаге 2, должно быть прописано в её поле ***self-bans***, например: `self-bans: [A, B, C]` должно измениться на `self-bans: [A, B, C, S]`.

**II. Фраза должна скрыться, если в разделе ввода параметров с помощью радиокнопки или комбо-бокса (выпадающего меню) был выбран один из представленных для выбора вариантов:**
1. Открываем файл `param_list.yaml` и ищем описание параметра, результат выбора которого должен повлиять на сокрытие фразы (параметр можно найти по содержимому поля ***text***, которое совпадает с именем параметра в самом приложении).
** !В поле ***guiStyle*** должно находиться строго значение *RadioButton* или *ComboBox* иначе всё нижеописанное недействительно.**
2. В поле ***variable_text*** видим записи формата `ключ: "текст"`, где `текст` - отображаемый в приложении вариант выбора, а `ключ` - значение, которое возвращает элемент при выборе этого варианта.
3. По `текст` находим вариант выбора, при котором редактируемая фраза должна скрыться, и берём соответствующий ей `ключ`. После чего берём содержимое поля `name` всего элемента и формируем ключ вида `Ключ_параметра.Ключ_элемента_выбора`.
    
Например, мы имеем в `param_list.yaml` запись вида:
```
# пол
- name: Sex     
text: "Пол:"
guiStyle: "RadioButton"  
units: "String" 
variable_text: [
                Male: "Мужчина", 
                Female: "Женщина"
                ]

```
И хотим, чтобы редактируемая фраза не отображалась, когда выбран вариант "Женщина". Тогда мы берём содержимое поля ***name*** - `Sex` - и ключ нужного варианта выбора - `Female`. 
Получаем ключ `Sex.Female` - его и будем использовать далее.
4. Открываем файл `phrase-src.yaml`.
5. Находим фразу, которую хотим скрыть, и добавляем в поле ***self-ban*** этой фразы ключ, сформированный на шаге 3 (например, **Sex.Female**).

**III. Фраза должна скрыться при попадании значения введённого параметра в определённую ячейку нормативной таблицы:**
Подробно об устройстве нормативных таблиц написано [здесь](#NormTables.txt).
1. Открываем параллельно файлы `param_list.yaml` и `NormTables.txt`.
2. Находим в `param_list.yaml` описание нужного параметра (содержимое поля ***text*** соответствует его имени в приложении).
3. Берём содержимое поля **name** - это **ключ** параметра.
4. Переходи в файл `NormTables.txt` и ищем таблицу с именем, идентичным ключу, найденному на шаге 3 (имя таблицы - значение в первой строке после разделителя #).
5. Берём имя первого столбца и ищем его среди полей **name** записей файла `param_list.yaml`, чтобы понять, какой второй параметр для поиска по таблице используется (таким же образом можно проверить все группирующие параметры).
6. По принципу "морского боя" ищем,  в какой столбец таблицы попадём при условиях (определённых значениях введённых параметров), в которых хотим скрывать определённую фразу. Запоминаем имя этого столбца.
7. Берём имя таблицы (см. шаг 4) и имя столбца (см. шаг 6) и формируем ключ формата `Имя_таблицы.Имя_столбца` - это ключ, который вернёт таблица при вводе таких значений параметров, по которым производился поиск в пункте 6.

Например:
Мы хотим, чтобы определённая фраза скрывалась при вводе (или получению по формуле) ЧСС > 120 для людей старше 18 лет.
* В файле `param_list.yaml` нужно найти ключи параметров **ЧСС** и **Возраст** - находим две записи:
```
# возраст
# Параметр всегда имеет ключ Age и рассчитывается как разница между датой исследования и датой рождения.

# ЧСС
- name: HR
text: "\nЧСС: " 
guiStyle: "CalcResult" 
units: "Number" 
formula: 60 * 1000 / RRmean
```
Таким образом, исследуемый параметр - ЧСС - имеет ключ `HR` (таким же будет имя нормативной таблицы для него), а второй параметр для поиска по таблице - возраст - имеет ключ `Age` (таким же будет название первого столбца нормативной таблицы).

* Переходим в файл `NormTables.txt` и ищем таблицу с именем `HR` - находим запись:
```
(Таблица сокращена для примера)

#
HR
Age;	Bradi;	Norm;	Tachi
..2y;	..110;	..140;	..
..4y;	..90;	..110;	..
..7y;	..80;	..105;	..
..11y;	..75;	..95;	..
..15y;	..70;	..90;	..
..17y;	..65;	..80;	..
..;	    ..60;	..100;	..
```

- Производим поиск строки по первому столбцу - возрасту: старше 18 лет попадает в диапазон, указанный в последней строке первого столбца - последующий поиск производится исключительно по ней.
- Производится поиск по всем столбцам строки (кроме первого), найденной на предыдущем шаге: значение ЧСС больше 120 попадает в диапазон, указанный в столбце с именем `Tachi` - запоминаем это значение.
- Из имени таблицы и имени столбца, найденном на предыдущем шаге, формируем ключ `HR.Tachi` - только в таком виде он будет использован далее.

8. Открываем файл `phrase-src.yaml`.
9. Находим фразу (можно использовать сочетание клавиш `Ctrl + F` для быстрого поиска), которую нужно скрыть.
10. Указывыаем в поле **self-ban** этой фразы ключ, сформированный по нормативной таблице на шаге 7 (например, `HR.Tachi`), чтобы запретить её отображение в условиях активации данного ключа.

<a name="Error2"></a>
### Фраза не отобразилась, когда должна была

Единственный способ скрывать фразу из меню выбора при каких-то условиях - добавить в поле ***self-bans*** этой фразы ключи, активирующиеся в этих условиях. Таким образом, если фраза не отображается, когда должна, нужно проверить содержимое поля ***self-bans*** этой фразы, и удалить из неё лишние ключи или исправить условия их формирования.

О том, как проверить каждый ключ, подробно описано [здесь](#Error1).

<a name="Error3"></a>
### Фраза подсветилась, когда не должна была

За подсветку фразы отвечает содержимое поля ***light*** этой фразы: при активации любого из указанных там ключей, фраза будет подсвечена (если до этого не будет скрыта). Таким образом, чтобы фраза не подсвечивалась в определённых условиях, нужно удалить из поля ***light*** ключи, активирующиеся в этих условиях, либо поменять условия активации этих ключей.

О том, как проверить каждый ключ, подробно описано [здесь](#Error1).

<a name="Error4"></a>
### Фраза не подсветилась, когда должна была

За подсветку фразы отвечает содержимое поля ***light*** этой фразы: при активации любого из указанных там ключей, фраза будет подсвечена (если до этого не будет скрыта). Таким образом, чтобы фраза подсвечивалась в определённых условиях, нужно добавить ***light*** ключи, активирующиеся в этих условиях, либо поменять условия активации этих ключей.

О том, как проверить каждый ключ, подробно описано [здесь](#Error1).

<a name="Error5"></a>
### Нужно добавить новый раздел и/или новую фразу

Добавление фраз и их разделов производится в файле `phrase-src.yaml` по всем описанным для него [правилам](#phrase-src). Чтобы указать нужные ключи для сокрытия/подсветки новой фразы, можно изучить принципы их формирования [здесь](#Error1).

<a name="Error6"></a>
### Нужно изменить имя параметра в разделе ввода параметров

Для работы понадобится знание об устройстве файла [`param_list.yaml`](#param_list.yaml).

1. Открываем файл `param_list.yaml` и ищем параметр, имя которого хотим изменить (поиск производится по содержимому поля ***text***).
2. Заменяем содержимое поля ***text*** на то, которое хотим видеть в приложении.

<a name="Error7"></a>
### Результат расчёта по формуле неверен / нужно изменить формулу расчёта параметра

Для работы понадобится знание об устройстве файла [`param_list.yaml`](#param_list.yaml).

1. Открываем файл `param_list.yaml` и ищем параметр, формулу для которого хотим изменить (поиск производится по содержимому поля ***text***).
**Очевидно, что это должен быть параметр, содержащий исключительно `guiStyle: "CalcResult"` и поле `formula`, с котором и указана формула.
2. Редактируем поле ***formula*** в соответствии с [правилами](#param_list.yaml).

<a name="Error8"></a>
### Нужно изменить порядок расположения параметров в разделе их ввода

Для работы понадобится знание об устройстве файла [`param_list.yaml`](#param_list.yaml).

Параметры отображаются в приложении в том порядке, в котором они указаны в `param_list.yaml`. Поэтому, чтобы изменить их порядок в приложении, досточно изменить его в файле.
`Но есть критически важное правило:` если в какой-то формуле используются ключи других параметров, то эти ключи должны быть определены ДО формулы. За выполнением этого условия крайне важно следить при изменении порядка расположения параметров.

<a name="Error9"></a>
### Нужно добавить новый параметр для ввода

Добавление фраз и их разделов производится в файле `param_list.yaml` по всем описанным для него [правилам](param_list.yaml).
`Если новый параметр рассчитывается по формуле, важно помнить правило:` если в какой-то формуле используются ключи других параметров, то эти ключи должны быть определены ДО формулы. За выполнением этого условия крайне важно следить при изменении порядка расположения параметров.

<a name="Error10"></a>
### Нужно удалить параметр для ввода

Удаление параметра производится удалением его описания из файла `param_list.yaml`.
`Но важно учитывать, что те нормативные таблицы из **NormTables.txt**, в которых используется ключ удалённого параметра, перестанут использоваться.`

<a name="Error11"></a>
### Нужно добавить новую нормативную таблицу

Добавление таблицы производится в файле `NormTables.txt` по всем определённым для него [правилам](#NormTables.txt).
`Важно помнить, что все ключи, которые используются в новой таблице (её имя, имена группирующих параметров и первого столбца) в обязательном порядке должны быть определены в файле param_list.yaml (стоять в поле ***name*** нужных элементов), иначе таблица не будет использоваться`.

**Таким образом, алгоритм добавления новой таблицы:**
1. Открыть файл `param_list.yaml`.
2. Взять ключи (содержимое поля **name**) всех параметров, которые будут использованы в таблице. Если нужные параметры ещё не были определены - сделать новые записи для них в `param_list.yaml` по всем [правилам оформления файла конфигурации](#param_list.yaml).
3. Открыть файл `NormTables.txt` и с использованием ключей, полученных на шаге 1, построить новую таблицу по всем [правилам оформления нормативных таблиц](#NormTables.txt).

<a name="Error12"></a>
### Нужно удалить нормативную таблицу

Любая нормативная таблица строится для оценки какого-то из вводимых (или рассчитываемых по введённым) параметров. Чтобы прекратить оценку параметра по нормативной таблице (если параметр более не будет использоваться или для него не нужна нормативная таблица), запись о таблице нужно удалить из файла `NormTables.txt`:
1. В файле `param_list.yaml` по содержимому поля ***text*** ищем параметр, таблицу для которого нужно удалить.
2. Берём содержимое поля ***name*** этого параметра.
3. В файле `NormTables.txt` ищем таблицу с соответствующим именем и стираем её `(между оставшимися таблицами должен остаться разделитель - #)`
