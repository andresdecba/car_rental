import 'package:car_rental/calendar_page/calendar_widgets/utils.dart';
import 'package:car_rental/singleton.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarSelectionRange extends StatefulWidget {
  @override
  _CalendarSelectionRangeState createState() => _CalendarSelectionRangeState();
}

class _CalendarSelectionRangeState extends State<CalendarSelectionRange> {

  final _servicio = new ServicioSingleton();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  DateTime _rangeStart;
  DateTime _rangeEnd  ;
  Duration _difference;

  @override
  Widget build(BuildContext context) {

    return TableCalendar(
      
        locale: 'es_ES',
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        //calendarFormat: _calendarFormat,
        rangeSelectionMode: _rangeSelectionMode,

        onDaySelected: (selectedDay, focusedDay) {

          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              _rangeStart = null; // Important to clean those
              _rangeEnd = null;
              _rangeSelectionMode = RangeSelectionMode.toggledOff;

            });
          }
        },

        onRangeSelected: (start, end, focusedDay) {

          setState(() {
            _selectedDay = null;
            _focusedDay = focusedDay;
            _servicio.diaINICIO.value = start;
            _servicio.diaFIN.value = end;  
            _rangeStart = start;
            _rangeEnd = end;  
            _rangeSelectionMode = RangeSelectionMode.toggledOn;
          });

            if (end != null && start != null) {
              _difference = end.difference(start);  
              _servicio.diasTOTALES = _difference.inDays + 1.toInt();
            } else return;

            print('inicio $_rangeStart');
            print('fin $_rangeEnd');
            print('total dias ${_servicio.diasTOTALES}');
        },
        
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },

        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },

    );
  }
}