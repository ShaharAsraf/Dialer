import 'package:flutter/material.dart';
import 'package:shlomi_project/constants.dart';

class HomePageButton {
  HomePageButton({this.bgColor, this.title, this.imageSource, this.onPressed});

  Color bgColor;
  String title;
  String imageSource;
  Function onPressed;

  Container getButton() {
    return Container(
      constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: bgColor,
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: kButtonText,
                ),
                Image(
                  image: AssetImage(imageSource),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: mainGrey,
          ),

          Text(
            'Back',
            style: kSecondaryText,
          ), // You can
        ],
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {@required double strokeWidth,
      @required double radius,
      @required Gradient gradient})
      : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

class BorderGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final Color backround;
  final double width;
  final double height;
  final Function onPressed;

  const BorderGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.backround,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            color: backround,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: onPressed,
                child: Center(
                  child: child,
                )),
          ),
        ),
      ),
    );
  }
}
