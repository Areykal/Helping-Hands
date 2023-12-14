import 'package:flutter/material.dart';

/// Flutter code sample for [showTimePicker].


class ShowTimePickerApp extends StatefulWidget {
  const ShowTimePickerApp({super.key});

  @override
  State<ShowTimePickerApp> createState() => _ShowTimePickerAppState();
}

class _ShowTimePickerAppState extends State<ShowTimePickerApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TimePickerOptions(),
    );
  }
}

class TimePickerOptions extends StatefulWidget {
  const TimePickerOptions({super.key});

  @override
  State<TimePickerOptions> createState() => _TimePickerOptionsState();
}

class _TimePickerOptionsState extends State<TimePickerOptions> {
  TimeOfDay? selectedTime;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  TextDirection textDirection = TextDirection.ltr;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Event's Time")),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                child: const Text('Open time picker'),
                onPressed: () async {
                  final TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: selectedTime ?? TimeOfDay.now(),
                    initialEntryMode: entryMode,
                    orientation: orientation,
                    builder: (BuildContext context, Widget? child) {
                      // We just wrap these environmental changes around the
                      // child in this builder so that we can apply the
                      // options selected above. In regular usage, this is
                      // rarely necessary, because the default values are
                      // usually used as-is.
                      return Theme(
                        data: Theme.of(context).copyWith(
                          materialTapTargetSize: tapTargetSize,
                        ),
                        child: Directionality(
                          textDirection: textDirection,
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              alwaysUse24HourFormat: false,
                            ),
                            child: child!,
                          ),
                        ),
                      );
                    },
                  );
                  setState(() {
                    selectedTime = time;
                  });
                },
              ),
            ),
            if (selectedTime != null)
              Text('Selected time: ${selectedTime!.format(context)}'),
          ],
        ),
      ),
    );
  }
}
