# [Container class](https://docs.flutter.io/flutter/widgets/Container-class.html)
一个`Container`首先通过`padding`围绕`child`,并且申请额外的`constraints`来填充padded区域。`Container`将会被由`margin`描述的额外空白区域围绕。<br>
在绘制过程中，`Container`首先申请提供的`transform`，然后绘制`decoration`来填充padded区域。<br>

## Layout behavior
1.如果`widget`没有`child`、`height`、`width`和`constraints`，并且父节点提供了无边界的`constraints`，那么`Container`会尽可能地缩小`size`。<br>
2.如果`widget`没有`child`和`alignment`，但被提供了`width`、`height`或`constraints`，那么`Container`会根据这些约束组合和父节点提供的约束来缩小`size`。<br>
3.如果`widget`没有`child`、`height`、`width`、`constraints`和`alignment`，但父节点提供了有边界的`constraints`，那么`Container`会扩大来适应这个父节点提供的`constraints`。<br>
4.如果`widget`有`alignment`,并且父节点提供无边界的`constraints`，那么`Container`会围绕子节点来改变`size`。<br>
5.如果`widget`有`alignment`,并且父节点提供有边界的`constraints`，那么`Container`会扩大来适应父节点的`constraints`，然后使它的`child`的位置与`alignment`保持一致。<br>
6.剩下情况，`widget`有`child`，但没有`child`、`height`、`width`、`constraints`和`alignment`，`Container`把来自父节点的`constraints`传递给`child`，然后适配`child`来改变自己`size`。<br>
7.`margin`和`padding`属性也能影响布局。`decoration`能绝对增加`padding`。

## Constructors
```
Container({Key key, AlignmentGeometry alignment, EdgeInsetsGeometry padding, Color color,Decoration decoration, Decoration foregroundDecoration, double width, double height, BoxConstraints constraints, EdgeInsetsGeometry margin, Matrix4 transform, Widget child })
```
## Properties
* `alignment` -> `AlignmentGeometry` 设置`Container`中的子节点对齐方式。<br>
* `child` -> `Widget` 设置`Container`容纳的子节点。<br>
* `constraints` -> `BoxConstraints` 对子节点的额外约束。<br>
* `decoration` -> `Decoration` 这种装饰会绘制在`child`的里面。<br>
* `forgroundDecoration` -> `Decoration` 这种装饰会绘制在`child`的外面。<br>
* `margin` -> `EdgeInsetsGeometry` 空白区域会围绕在`decoration`和`child`周围。<br>
* `padding` -> `EdgeInsetsGeometry` 空白区域会刻画在`decoration`内部；如果`child`有内容，会被放置在`padding`内。<br>
* `transform` -> `Matrix` 在绘制`container`之前进行矩阵转换。<br>