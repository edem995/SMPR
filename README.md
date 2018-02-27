# Метрические алгоритмы классификации

Метрический алгоритм классификации с обучающей выборкой ![](https://github.com/edem995/SMPR/blob/master/img/Img_Metric_1.PNG?raw=true) относит объект ***u*** к тому классу ***y ? Y*** , для которого суммарный вес ближайших обучающих объектов ![](https://github.com/edem995/SMPR/blob/master/img/Img_Metric_2.PNG?raw=true) максимален:
![](https://github.com/edem995/SMPR/blob/master/img/Img_Metric_3.png?raw=true)
где весовая функция ![](https://github.com/edem995/SMPR/blob/master/imgs/Img_Metric_4.PNG?raw=true) оценивает степень важности ***i***-го соседа для классификации объекта ***u*** . Функция ![](https://github.com/edem995/SMPR/blob/master/img/Img_Metric_2.PNG?raw=true) — называется оценкой близости объекта *u* к классу ***y***.

## Алгоритм k ближайших соседей
**Алгоритм k ближайших соседей** относит объект ***u*** к тому классу, элементов которого больше среди ***k*** ближайших соседей ***x***

К примеру, при ***k*** = 1, наш алгоритм будет выглядеть следующим образом:

![](https://github.com/edem995/SMPR/blob/master/img/1NN.png?raw=true)

А при ***k*** = 100 так:

![](https://github.com/edem995/SMPR/blob/master/img/100NN.png?raw=true)

**Вопрос: Как выбирать k?**
**Ответ:** На практике оптимальное k подбирается по критерию скользящего контроля LOO.

Проверим по критерию скользящего контроля алгоритм kNN для выборки Ирисов Фишера, найдем оптимальный k. Проверять будем на всех 150 объктах и начнем ***k*** от 1 до 10.
Результат видим на графике, оценка LOO достигает минимума, при ***k = 6*** и равна 0.3333333 (96% правильных ответов).
![](https://github.com/edem995/SMPR/blob/master/img/LOO_kNN_1-10.png?raw=true)
![](https://github.com/edem995/SMPR/blob/master/img/LOO_kNN_1-150.png?raw=true)

### Пример 1: 
*На основе обучающей выборки Ирисы Фишера (в качестве признаков берем длину и ширину чашелистика), с помощью алгоритма kNN проклассифицировать объект(ы) с координатами **x** и **y**.*

Выборка имеет вид:
![](https://github.com/edem995/SMPR/blob/master/img/iris.png?raw=true)

- В качестве объектов для классификации сгенерируем 50 точек, значения по ***x*** которых могут лежать в диапазоне от 1 од 7, а по ***y*** от 0 до 2.5.
- В качестве метрики возьмем Евклидово пространсвто.
- В качестве параметра k возьмем оптимальное равное 6.

Результат работы:
![](https://github.com/edem995/SMPR/blob/master/img/6NN_random_points.png?raw=true)

Также рассмотрим вариант, когда мы определяем для каждой точки её класс и обозначаем их, что можно увидеть ниже:

![](https://github.com/edem995/SMPR/blob/master/img/6NN_all.png?raw=true)

## Алгоритм k взвешенных ближайших соседей

Очень часто оценка весов в методе ближайших соседей оказывается некорректной, из-за того, у классифицируемого объкта одинаковое количество соседей, принадлежащих разным классам. В этом случае применяется алгоритм k взвешенных ближайших соседей. Отличие от kNN, только в том, что функция весов ![](https://github.com/edem995/SMPR/blob/master/imgs/Img_Metric_4.PNG?raw=true) домнажается на ![](https://github.com/edem995/SMPR/blob/master/imgs/Img_Metric_10.PNG?raw=true) и алгоритм классификации принимает вид: 
![](https://github.com/edem995/SMPR/blob/master/img/Img_Metric_11.PNG?raw=true)

![](https://github.com/edem995/SMPR/blob/master/imgs/Img_Metric_10.PNG?raw=true) — строго убывающая последовательность вещественных весов, задающая вклад ***i***-го соседа при классификации объекта ***u***.

Примеры весов:
- ![](https://github.com/edem995/SMPR/blob/master/img/Img_Metric_12.PNG?raw=true)
- ![](https://github.com/edem995/SMPR/blob/master/img/Img_Metric_13.PNG?raw=true) — геометрическая прогрессия со
знаменателем ***q ? (0, 1)***, который можно подбирать по критерию LOO.

Применим LOO для подбора ***q*** как параметра kwNN на обучающей выборке "Ирисы фишера", ***k=6***.
Результат видим на графике, оценка LOO достигает минимума, при ***k = 6 && q = 1.0*** и равна 0.3333333 (96% правильных ответов).

![](https://github.com/edem995/SMPR/blob/master/img/LOO_kWNN.png?raw=true)

![](https://github.com/edem995/SMPR/blob/master/img/kWNN.png?raw=true)
