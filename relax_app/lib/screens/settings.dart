import 'package:app_relaxante/notification_service.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:provider/provider.dart';

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
        appBar: AppBar(
          centerTitle: false,
          title: CustomAppBar('Settings')
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: ListView(
            children: [
              _SettingSwitch('Light mode'),
              _SettingOption('Notification test', onTap: () => service.showNotification(0, 'Test', 'Notification'),),
              _SettingOption('Rate app in stores', onTap: () => null,),
              _SettingOption('Suggest features', onTap: () => null,),
              _SettingOption('Share Liminal', onTap: () => null,),
            ],
          ),
        ));
  }
}

class _SettingOption extends StatelessWidget {
  final String titleOption;
  final Function onTap;

  _SettingOption(this.titleOption, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      onTap: () => onTap(),
      title: Center(
        child: Text(
          titleOption,
          style: TextStyle(
            fontSize: 18,
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<ThemeNotifier>(
      builder:(context, notifier, child){
        return SwitchListTile(
          activeTrackColor: lightBlue,
          inactiveThumbColor: offWhite,
          activeColor: Colors.grey[400],
          title: Text(
            widget.titleOption,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          value: notifier.lightTheme,
          onChanged: (bool value) {
            notifier.toggleTheme();
          },
        );
      },
    );
  }
}
