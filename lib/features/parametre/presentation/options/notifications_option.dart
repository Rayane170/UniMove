import 'package:flutter/material.dart';

class NotificationsOption extends StatelessWidget {
  const NotificationsOption({super.key});

  @override
  Widget build(BuildContext context) {
    bool notifOn = true;
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: SwitchListTile(
        title: const Text("Activer les notifications"),
        value: notifOn,
        onChanged: (val) {},
      ),
    );
  }
}