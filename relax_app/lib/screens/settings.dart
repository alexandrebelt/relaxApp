import 'package:app_relaxante/notification_service.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;


class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final LocalNotificationService service =  LocalNotificationService();

  @override
  void initState(){
    service.initialize();
    super.initState();

    tz.initializeTimeZones();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: CustomAppBar('Settings'),
        body: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: ListView(
            children: [
              TextButton(
                child: Text('Notificação'),
                onPressed: () => service.showNotification(0, 'vai', 'caga'),
              ),
              _SettingSwitch('Light mode'),
              _SettingOption('Rate app in stores'),
              _SettingOption('Suggest features'),
              _SettingOption('Share Liminal'),
            ],
          ),
        ));
  }
}

class _SettingOption extends StatelessWidget {
  final String titleOption;

  _SettingOption(this.titleOption);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Center(
        child: Text(
          titleOption,
          style: TextStyle(
            color: iconPrimary,
          ),
        ),
      ),
    );
  }
}

class _SettingSwitch extends StatefulWidget {
  final String titleOption;

  _SettingSwitch(this.titleOption);

  @override
  State<_SettingSwitch> createState() => _SettingSwitchState();
}

class _SettingSwitchState extends State<_SettingSwitch> {
  bool _light = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SwitchListTile(
      activeTrackColor: iconPrimary,
      inactiveThumbColor: mainDark,
      activeColor: Colors.grey[400],
      title: Text(
        widget.titleOption,
        style: TextStyle(
          fontSize: 18,
          color: iconPrimary,
        ),
      ),
      value: _light,
      onChanged: (bool value) {
        setState(() {
          _light = value;
        });
      },
    );
  }
}
