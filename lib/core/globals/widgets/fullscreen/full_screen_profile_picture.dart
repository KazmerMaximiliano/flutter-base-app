import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void viewInFullScreen(BuildContext context, String url, [String title = ""]) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => FullScreenProfilePicturePage(
        url: url,
        title: title,
      ),
    ),
  );
}

class FullScreenProfilePicturePage extends StatefulWidget {
  const FullScreenProfilePicturePage({
    Key? key,
    required this.url,
    this.title = "",
  }) : super(key: key);
  final String url;
  final String title;

  @override
  FullScreenProfilePicturePageState createState() => FullScreenProfilePicturePageState();
}

class FullScreenProfilePicturePageState extends State<FullScreenProfilePicturePage> {
  final _controller = TransformationController();

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _controller.dispose();
    super.dispose();
  }

  void _onStartHandler(ScaleStartDetails ssd) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(100),
        minScale: 0.8,
        maxScale: 4,
        transformationController: _controller,
        onInteractionStart: _onStartHandler,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTap: () {
              _controller.value = Matrix4.identity();
              setState(() {});
            },
            onDoubleTap: () => Navigator.pop(context),
            child: Center(
              // child: Image.network("${DotEnvSv().assetUrl}${widget.url}"),
              child: Image.network('https://placekitten.com/512/512'),
            ),
          ),
        ),
      ),
    );
  }
}
