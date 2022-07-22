import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joya/common/utils/navigation.dart';
import 'package:joya/pages/plant/cubit/sensor_detail_page.dart';

class AlertSensors extends StatelessWidget {
  final Function resetSensors;

  const AlertSensors({Key? key, required this.resetSensors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onPress() async {
      await this.resetSensors(context);
      Navigator.pop(context, 'Cancel');
    }

    return Center(
      child: TextButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('reset vos donnés '),
            content: const Text('attention vos donnés seront perdu'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async => {onPress()},
                child: const Text('oui'),
              ),
            ],
          ),
        ),
        child: const Text('reset de vos donnés'),
      ),
    );
  }
}
