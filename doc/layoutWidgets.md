# Layout Widgets

## [Padding class](https://docs.flutter.io/flutter/widgets/Padding-class.html)
1.一个`widget`根据给定的`padding`来内嵌它的`child`。<br>
2.当把布局约束传递给`child`后，`Padding`根据给定的`padding`来缩小约束，从而这个`child`在一个更小的`size`上布局。`Padding`根据它的`child`尺寸来改变自身尺寸，根据`padding`来放大自己，实际上是在`child`的周围创建空白区域。
```
Padding({Key key, @required EdgeInsetsGeometry padding, Widget child })
```

## [Center class](https://docs.flutter.io/flutter/widgets/Center-class.html)
这种`widget`会将它的`child`居中。
```
Center({Key key, double widthFactor, double heightFactor, Widget child })
```
##### Properties
* `heightFactor` -> `double` 如果不为`null`，设置`Center`的高度为`child`的高度与该值的乘积。
* `widthFactor` -> `double` 如果不为`null`，设置`Center`的宽度为`child`的宽度与该值的乘积。

## [Align class](https://docs.flutter.io/flutter/widgets/Align-class.html)
这种`widget`将它的`child`按照`alignment`值来对齐，并且可能基于它的子节点尺寸来改变自身尺寸。
```
Align({Key key, AlignmentGeometry alignment: Alignment.center, double widthFactor, double heightFactor, Widget child })
```

## [FittedBox class](https://docs.flutter.io/flutter/widgets/FittedBox-class.html)
根据`fit`属性的值来缩放和放置它的`child`。
```
FittedBox({Key key, BoxFit fit: BoxFit.contain, AlignmentGeometry alignment: Alignment.center, Widget child })
```

## [AspectRatio class](https://docs.flutter.io/flutter/widgets/AspectRatio-class.html)
这个`widget`会改变它的`child`的尺寸为一个具体的宽高比例。
```
AspectRatio({Key key, @required double aspectRatio, Widget child })
```

### [ConstrainedBox class](https://docs.flutter.io/flutter/widgets/ConstrainedBox-class.html)
为它的`child`添加一个强制执行的额外约束。
```
ConstrainedBox({Key key, @required BoxConstraints constraints, Widget child })
```

### [Baseline class](https://docs.flutter.io/flutter/widgets/Baseline-class.html)
这种`widget`根据它的`child`的底线来放置它的`child`。
```
Baseline({Key key, @required double baseline, @required TextBaseline baselineType, Widget child })
```

## [FractionallySizedBox class](https://docs.flutter.io/flutter/widgets/FractionallySizedBox-class.html)
这种`widget`根据总共可用空间的`fraction`来改变它的`child`的尺寸。
```
FractionallySizedBox({Key key, AlignmentGeometry alignment: Alignment.center, double widthFactor, double heightFactor, Widget child })
```

## [IntrinsicHeight class](https://docs.flutter.io/flutter/widgets/IntrinsicHeight-class.html)
这个`widget`会根据它的`child`的本身高度来改变高度。使用这个类会有相当的性能损耗，因为在最终布局阶段前它会添加一个推测布局。尽量避免使用这个类。最糟糕的情况，这个`widget`会导致树的深度为O(N²)的布局。
```
IntrinsicHeight({Key key, Widget child })
```

## [IntrinsicWidth class](https://docs.flutter.io/flutter/widgets/IntrinsicWidth-class.html)
这个`widget`会根据它的`child`的本身宽度来改变宽度。但和`IntrinsicHeight`一样可能会造成严重性能损耗。
```
IntrinsicWidth({Key key, double stepWidth, double stepHeight, Widget child })
```

## [LimitedBox class](https://docs.flutter.io/flutter/widgets/LimitedBox-class.html)
这个盒子只有在它没有约束时，才会限制自身尺寸。
```
LimitedBox({Key key, double maxWidth: double.infinity, double maxHeight: double.infinity, Widget child })
```

## [Offstage class](https://docs.flutter.io/flutter/widgets/Offstage-class.html)
这个`widget`如果在widget树中，就会把它的`child`布局出来，但不会绘制它的任何东西，不会使它的`child`可响应点击测试，也不会占用父节点的任何空间。属性`offstage`默认是`true`，表示`child`不可见。
```
Offstage({Key key, bool offstage: true, Widget child })
```

## [OverflowBox class](https://docs.flutter.io/flutter/widgets/OverflowBox-class.html)
这个`widget`会强制一个约束在它的`child`上，这个约束不同于它来自父节点的约束。这个`widget`也允许它的`child`溢出父节点显示区域。
```
OverflowBox({Key key, AlignmentGeometry alignment: Alignment.center, double minWidth, double maxWidth, double minHeight, double maxHeight, Widget child })
```

## [SizedBox class](https://docs.flutter.io/flutter/widgets/SizedBox-class.html)
如果给定了`child`，这个`widget`会强制它的`child`有一个具体的宽或者高。如果没有宽或者高，则这个`widget`会改变自身尺寸来匹配它`child`的尺寸。<br>
如果没有给定`child`，这个`widget`会根据给定的宽高来改变尺寸。
```
SizedBox({Key key, double width, double height, Widget child })
SizedBox.expand({Key key, Widget child })
SizedBox.fromSize({Key key, Widget child, Size size })
```