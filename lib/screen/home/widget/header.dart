import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: const Color(0xFF19598A),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 100,
              child: AspectRatio(
                aspectRatio: 1.0, // Adjust the aspect ratio as needed
                child: Image.asset(
                  'assets/images/logow.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              String? encodeQueryParameters(Map<String, String> params) {
                return params.entries
                    .map((MapEntry<String, String> e) =>
                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    .join('&');
              }

              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'support@kuestenpatent-kroatien.at',
                query: encodeQueryParameters(<String, String>{
                  'subject': 'Email subject!',
                }),
              );
              launchUrl(emailLaunchUri);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Image.asset(
                      'assets/images/email.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      const String phoneNumber = "+436763074163";

                      final Uri phoneLaunchUri =
                          Uri(scheme: 'tel', path: phoneNumber);
                      final PermissionStatus status =
                          await Permission.phone.request();
                      if (status.isGranted) {
                        if (await canLaunch(phoneLaunchUri.toString())) {
                          await launch(phoneLaunchUri.toString());
                        }
                      } else {
                        // Handle the case where the device can't make phone calls.
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content:
                                  Text("Your device cannot make phone calls."),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Image.asset(
                        'assets/images/callicon.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
