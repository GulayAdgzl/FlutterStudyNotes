/*
import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({Key? key}) : super(key: key);

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // showAboutDialog(context: context, applicationName: 'G', children: [Text('ssss')]);
        final response = await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              /*return Dialog(
                child: Text('data'),
              );*/
              //return AboutDialog()
              //return UpdateDiaolog(context: context);
              //_UpdateDiaolg();
            });
        inspect(response);
      }),
    );
  }
}

class _UpdateDiaolg extends StatelessWidget {
  const _UpdateDiaolg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('versiomn'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text('Update'),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('close')),
      ],
    );
  }
}
/*
class UpdateDiaolog extends AlertDialog {
  const UpdateDiaolog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text('versiomn'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Update'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('close')),
          ],
        );
}
*/
class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);
  final String _url = 'https://picsum.photos/200';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        //zoom yapıyo
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ),
    );
  }
}
*/