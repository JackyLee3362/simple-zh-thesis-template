#import "/style.typ": subpar-grid
= 预备知识

== 图形示例

=== 图形中放表格

#figure(
  caption: [普通表格],
  kind: table, // 可以注释
  table(
    columns: 3,
    table.header([a], [b], [c]),
    [d], [e], [f],
    [g], [h], [i],
  ),
) <table-normal>

引用普通表格@table-normal，
或者这样写#ref(<table-normal>)

#figure(
  caption: [三线表],
  // kind: table, // 可以注释
  table(
    columns: 3,
    stroke: none,
    align: center,
    table.hline(),
    table.header([a], [b], [c]),
    table.hline(stroke: 0.5pt),
    [d], [e], [f],
    [g], [h], [i],
    table.hline(),
  ),
) <table-demo>

引用三线表 @table-demo

=== 图形：三线表 + 合并单元格

#figure(
  caption: [合并单元格],
  table(
    columns: 3,
    stroke: none,
    align: center,
    table.hline(),
    table.header(table.cell(colspan: 2)[a], [c]),
    table.hline(stroke: 0.5pt),
    table.cell(colspan: 2)[10], [f],
    [g], [h], [i],
    table.hline(),
  ),
)


== 图形中放入图片

星穹铁道，启动！
#figure(
  caption: [崩坏星穹铁道],
  kind: image,
  image("/image/崩坏星穹铁道.png", width: 80%),
)

关于子图
需要首先引入 `grid`，并重命名为 `subfigre`，
就可以使用了。

```typst
#import "/lib.typ": subpar.grid as subfigure
```

== 子图的不同排列方式

排列方式1

#subpar-grid(
  caption: [这是一张超图],
  figure(
    caption: [我是第一个子图a],
    rect(stroke: 1pt, height: 4em, fill: rgb("eeeeee")),
  ),
  figure(
    caption: [我是第二个子图b],
    rect(stroke: 1pt, height: 4em, fill: rgb("eeeeee")),
  ),
)

排列方式2

#subpar-grid(
  caption: [这是一张超图],
  kind: image,
  columns: (1fr, 1fr),
  figure(
    caption: [我是第一个子图a],
    rect(stroke: 1pt, height: 4em, fill: rgb("eeeeee")),
  ),
  figure(
    caption: [我是第二个子图b],
    rect(stroke: 1pt, height: 4em, fill: rgb("eeeeee")),
  ),
)

如何引用子图和超图

#subpar-grid(
  caption: [这是一张超图],
  columns: (1fr, 1fr),
  kind: image,
  figure(
    caption: [我是第一个子图a],
    rect(stroke: 1pt, height: 4em, fill: rgb("eeeeee")),
  ),
  <sub-figure-1>,
  figure(
    caption: [我是第二个子图b],
    rect(stroke: 1pt, height: 4em, fill: rgb("eeeeee")),
  ),
  <sub-figure-2>,
  label: <super-figure>,
)

引用超图 @super-figure 的写法，
引用子图 @sub-figure-1 和 @sub-figure-2 的写法。


== 伪算法样式

== 代码样式

```python
print("hello")

```

== 数学公式

欧拉公式 $e ^ (i pi)  + 1 = 0$ 由数学中最重要的五个数组成 ... ...

常见的激活函数如@eqt-activation 所示

$
  & "ReLU" (x) &= &max lr((0 , x))\
  & "Sigmoid" (x) & = &frac(e^x, 1 plus e^x)\
  & "Tanh" (x) & = &frac(e^x - e^(minus x), e^x plus e^(minus x))\
  & "Softmax" (x) & = &frac(e^(x_i), sum_i e^(x_i))
$ <eqt-activation>

常见的损失函数有

$
  & "MSE平方损失函数" L(Y | f(X)) &= &sum_N (Y-f(X))^2 \
  & "对数损失函数" L(Y, "Pr"(Y|X)) &= &- log "Pr"(Y|X) \
  & "01损失函数" L(Y, f(X)) &= &cases(1 "if " Y != f (X), 0 "if " Y = f (X)) \
  & "Hinge 损失函数" L(y, f(X)) &=& max(0, 1 - y f(x))
$ 

#pagebreak()
