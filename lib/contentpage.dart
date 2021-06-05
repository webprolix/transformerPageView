import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  const ContentPage({Key key, this.imageUrl, this.title}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TransformationController _controller = TransformationController();
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          InteractiveViewer(
            maxScale: 5.0,
            minScale: 1.0,
            transformationController: _controller,
            onInteractionEnd: (details) {
              _controller.value = Matrix4.identity();
            },
            child: Image(
              image: NetworkImage(widget.imageUrl),
              fit: BoxFit.cover,
              loadingBuilder: (con, widget, chunks) {
                if (chunks == null) {
                  return widget;
                }
                return const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
              top: 25,
              left: 10,
              child: Text(
                widget.title,
                style: const TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    )
                  ],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
