import 'package:flutter/material.dart';
import 'password_form_field.dart';

class WifiDialog extends StatefulWidget {
  final String wifiName;
  final Function(String ssid, String password) onSubmit;

  WifiDialog({Key key, this.wifiName, this.onSubmit}) : super(key: key);

  @override
  _WifiDialogState createState() => _WifiDialogState();
}

class _WifiDialogState extends State<WifiDialog> {
  String ssid = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    ssid = widget.wifiName;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 5,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)), //this right here
      child: Container(
        height: 320,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Password for WiFi',
                    style: Theme.of(context).textTheme.bodyText2),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                    onSaved: (text) {
                      ssid = text;
                    },
                    initialValue: widget.wifiName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            )))),
                SizedBox(
                  height: 10.0,
                ),
                PasswordFormField(
                  initialValue: password,
                  onSaved: (text) {
                    password = text;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: MaterialButton(
                      child: Text('Provision'),
                      color: Colors.redAccent,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          if (widget.onSubmit != null) {
                            widget.onSubmit(ssid, password);
                          }
                          Navigator.of(context).pop();
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
