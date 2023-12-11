import 'package:flutter/material.dart';
import 'package:screen_capture_event/screen_capture_event.dart';

class screen_capture extends StatefulWidget {
  const screen_capture({super.key});

  @override
  State<screen_capture> createState() => _screen_captureState();
}

class _screen_captureState extends State<screen_capture> {
  ScreenCaptureEvent screenCaptureEvent = ScreenCaptureEvent();
  String text = "DO ScreenShot or ScreenRecord";
  bool preventScreenshot = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screenCaptureEvent.addScreenRecordListener((recorded) {
      setState(() {
        text = recorded ? "Start Recording" : "Stop Recording";
      });
    });

    screenCaptureEvent.addScreenShotListener((filePath) {
      setState(() {
        text = "ScreenShot Stored : $filePath";
      });
    });
    screenCaptureEvent.watch();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    screenCaptureEvent.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Capture"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor),
            onPressed: () {
              setState(() {
                preventScreenshot = !preventScreenshot;
              });
              screenCaptureEvent.preventAndroidScreenShot(preventScreenshot);
            },
            child: Text(
              preventScreenshot
                  ? "Allow Screenshot (ANDROID)"
                  : "Prevent Screenshot (ANDROID)",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor),
            onPressed: () {
              screenCaptureEvent.isRecording().then((value) {
                setState(() {
                  if (value) {
                    text = "You're Still Recording";
                  } else {
                    text = "You're not recording";
                  }
                });
              });
            },
            child: const Text(
              "Check Record Status",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
