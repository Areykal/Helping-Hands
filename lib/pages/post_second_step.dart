import 'package:flutter/material.dart';

class PostPageSecond extends StatefulWidget {
  const PostPageSecond({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<PostPageSecond> createState() => _PostPageSecondState();
}

class _PostPageSecondState extends State<PostPageSecond> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime(2023));
  late final RestorableRouteFuture<DateTime> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime>(
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
    onComplete: _selectDate,
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2023),
          lastDate: DateTime(2024),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(
        () {
          _selectedDate.value = newSelectedDate;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}"),
            ),
          );
        },
      );
    }
  }

  TimeOfDay? selectedTime;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  TextDirection textDirection = TextDirection.ltr;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Date and Time")),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _restorableDatePickerRouteFuture.present(),
              child: const Text('Open Date Picker'),
            ),
            ElevatedButton(
              onPressed: () => showTimePicker(
                context: context,
                initialTime: selectedTime ?? TimeOfDay.now(),
                builder: (BuildContext context, Widget? child) {
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
              ),
              child: const Text("Open Time Picker"),
            ),
            // SnackBar(
            //   content: Text("Selected Time: $selectedTime"),
            // ),
          ],
        ),
      ),
    );
  }
}

// class ShowTimePickerApp extends StatefulWidget {
//   const ShowTimePickerApp({super.key});

//   @override
//   State<ShowTimePickerApp> createState() => _ShowTimePickerAppState();
// }

// class _ShowTimePickerAppState extends State<ShowTimePickerApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: TimePickerOptions(),
//     );
//   }
// }

// class TimePickerOptions extends StatefulWidget {
//   const TimePickerOptions({super.key});

//   @override
//   State<TimePickerOptions> createState() => _TimePickerOptionsState();
// }

// class _TimePickerOptionsState extends State<TimePickerOptions> {
//   TimeOfDay? selectedTime;
//   TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
//   Orientation? orientation;
//   TextDirection textDirection = TextDirection.ltr;
//   MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Event's Time")),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: const Text('Open time picker'),
//               onPressed: () async {
//                 final TimeOfDay? time = await showTimePicker(
//                   context: context,
//                   initialTime: selectedTime ?? TimeOfDay.now(),
//                   initialEntryMode: entryMode,
//                   orientation: orientation,
//                   builder: (BuildContext context, Widget? child) {
//                     return Theme(
//                       data: Theme.of(context).copyWith(
//                         materialTapTargetSize: tapTargetSize,
//                       ),
//                       child: Directionality(
//                         textDirection: textDirection,
//                         child: MediaQuery(
//                           data: MediaQuery.of(context).copyWith(
//                             alwaysUse24HourFormat: false,
//                           ),
//                           child: child!,
//                         ),
//                       ),
//                     );
//                   },
//                 );
//                 setState(() {
//                   selectedTime = time;
//                 });
//               },
//             ),
//             if (selectedTime != null)
//               Text('Selected time: ${selectedTime!.format(context)}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
