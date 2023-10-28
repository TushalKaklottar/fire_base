import '../export_app.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);  // Adjust the curve position
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);  // Adjust the curve shape
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
