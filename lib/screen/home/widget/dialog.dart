import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback onOpenUrl;
  CustomDialog({required this.onOpenUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/logob.png',
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Machen Sie einen Vorbereitungskurs bei AC Nautik',
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16,0,16,16),
                  child: GestureDetector(
                    onTap: onOpenUrl,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: const Center(
                        child: Text("Zum Angebot von AC Nautik", style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: (){Navigator.of(context).pop();},
              child: Image.asset(
                'assets/images/closec.png',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
