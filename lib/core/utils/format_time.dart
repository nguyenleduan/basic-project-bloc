import 'package:intl/intl.dart';

class FormatDate {
  final f = DateFormat('dd/MM/yyyy');
  final fm = DateFormat('yyyy-MM-dd');
  final fs = DateFormat('yyyy-MM-ddTHH:mm:ss');

  FormatDate._();

  static final FormatDate _instance = FormatDate._();

  static FormatDate get instance => _instance;

  String? dateTimeToStringDDMMYYYY(DateTime? date) {
    try {
      return f.format(date!);
    } catch (_) {}
    return null;
  }

  String? stringDDMMYYYtoYYYYMMDD(String dates) {
    try {
      DateTime date = stringToDateDDMMYYYY(dates)!;
      return '${date.year}-${date.month}-${date.day}';
    } catch (_) {
      return null;
    }
  }

  bool checkDate(DateTime date1, DateTime date2) {
    if (date1.month == date2.month
        && date1.year == date2.year
        && date1.day == date2.day) {
      return true;
    }
    return false;
  }

  DateTime stringToDateTimeYYYYMMDDSD(String string) {
    try{
      DateTime parseDate = DateFormat("yyyy-MM-dd").parse(string);
      return parseDate;
    }catch(e){
      return DateTime.now();
    }
  }

  String? stringToStringDDMMYYYYHHMM(String date) {
    try {
      DateTime dateTime = stringToDateTimeYYYYMMDDSD(date);
      String datetime =
          '${stringToStringDDMMYYYY(date)}, ${dateTime.hour < 10 ? "0${dateTime
          .hour}" : '${dateTime.hour}'}:${dateTime.minute < 10 ? "0${dateTime
          .minute}" : '${dateTime.minute}'}';
      return datetime;
    } catch (_) {}
    return "";
  }

  String? stringToStringDDMMYYYYAPI(String date) {
    try {
      DateTime dateTime = stringToDateTimeYYYYMMDDSD(date);
      return stringToStringDDMMYYYY(date);
    } catch (_) {}
    return "";
  }
  String? stringToStringDDMMYYYYHHMMUTC(String date) {
    try {
      DateTime dateTime = dateToDateUTC(DateFormat("yyyy-MM-ddTHH:mm:ss").parse(date));
      String datetime =
          '${stringToStringDDMMYYYY(date)}, ${dateTime.hour < 10 ? "0${dateTime
          .hour}" : '${dateTime.hour}'}:${dateTime.minute < 10 ? "0${dateTime
          .minute}" : '${dateTime.minute}'}';
      return datetime;
    } catch (_) {}
    return "";
  }

  String? stringToStringDDMMYYYYUTC(String date) {
    try {
      DateTime dateTime = dateToDateUTC(stringToDateTimeYYYYMMDDSD(date));
      String datetime =
          '${stringToStringDDMMYYYY(date)}';
      return datetime;
    } catch (_) {}
    return "";
  }

  String? stringToStringDDMMYYYYHHMM2(String date) {
    try {
      DateTime dateTime = stringToDateTimeYYYYMMDDSD(date);
      String datetime =
          '${stringToStringDDMMYYYY(date)} ${dateTime.hour < 10 ? "0${dateTime
          .hour}" : '${dateTime.hour}'}:${dateTime.minute < 10 ? "0${dateTime
          .minute}" : '${dateTime.minute}'}';
      return datetime;
    } catch (_) {}
    return "";
  }

  DateTime stringToDateTimeYYYYMMDD(String string) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(
        string!);
    return DateTime.parse(parseDate.toLocal().toString());
  }

  DateTime stringToDateTimeYYYYMMDDS(String string) {
    try{
      DateTime parseDate = DateFormat("yyyy-MM-dd").parse(string!);
      return DateTime.parse(parseDate.toLocal().toString());
    }catch(e){
      return DateTime.now();
    }
  }

  DateTime? stringDateYYYYMMDD(String date) {
    try {
      return fm.parse(date);
    } catch (_) {}
    return null;
  }

  String? dateTimeToStringYYYYMMDD(DateTime date) {
    try{
      String format = fm.format(date);
      return format;
    }catch(e){
      return 'Error';
    }
  }

  String? dateTimeToStringYYYYMMDDHHSS(DateTime date) {
    try {
      String? dateS = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(DateTime.now()) ;
      return dateS;
    } catch (e) {
      return fs.format(DateTime.now());
    }
  }

  String dateTimeToStringDDMM(DateTime date) {
    return DateFormat('d/M').format(date);
  }


  String stringToStringDDMMYYYY(String date) {
    try {
      String dates = "${dateTimeToStringDDMMYYYY(stringToDateDDMMYYYY(date)!)}";
      return dates;
    } catch (_) {}
    return date;
  }

  String stringToStringDDMM(String date) {
    try {
      return "${dateTimeToStringDDMM(stringToDateDDMMYYYY(date)!)}";
    } catch (_) {}
    return date;
  }

  String? formatDateTimeUTC({String? date}) {
    try {
      DateTime dateBegin = DateTime.parse(date!);
      var dateTime =
      DateFormat("yyyy-MM-dd HH:mm").parse(dateBegin.toString(), true);
      var dateLocal = dateTime.toLocal();
      return DateFormat('HH:mm MM/dd/yyyy').format(dateLocal).toString();
    } catch (_) {}
    return date;
  }

  DateTime dateToDateUTC(DateTime date) {
    try {
      DateTime dateBegin = date;
      var dateTime =
      DateFormat("yyyy-MM-dd HH:mm").parse(dateBegin.toString(), true);
      return dateTime.toLocal();
    } catch (_) {}
    return DateTime.now();
  }

  String? formatHHMMtoHHMM({String? dateFrom, String? dateTo}) {
    try {
      DateTime dateBegin = DateTime.parse(dateFrom!);
      DateTime dateEnd = DateTime.parse(dateTo!);
      String strFrom = "${dateBegin.hour}:${dateBegin.minute}";
      String strTo = "${dateEnd.hour}:${dateEnd.minute}";
      return "$strFrom - $strTo";
    } catch (_) {
      return "$dateFrom - $dateFrom";
    }
  }

  String getFormattedDate(String? date) {
    try {
      var localDate = DateTime.parse(date!).toLocal();
      var inputFormat = DateFormat('yyyy-MM-dd');
      var inputDate = inputFormat.parse(localDate.toString());
      var outputFormat = DateFormat('dd/MM/yyyy');
      var outputDate = outputFormat.format(inputDate);
      return outputDate.toString();
    } catch (_) {
      return date ?? "";
    }
  }

  bool isDate(String input, String format) {
    try {
      final DateTime d = DateFormat(format).parseStrict(input);
      //print(d);
      return true;
    } catch (e) {
      //print(e);
      return false;
    }
  }

  DateTime? stringToDateDDMMYYYY(String date) {
    try {
      try {
        // dd/MM/yyyy
        return DateFormat("dd/MM/yyyy").parse(date);
      } catch (_) {}
      // dd-MM-yyyy-MM
      return DateFormat("dd/MM/yyyy").parse(getFormattedDate(date));
    } catch (_) {

    }
    return null;
  }

  DateTime? stringToDateDDMM(String date) {
    try {
      try {
        // dd/MM/yyyy
        return DateFormat("yyyy-MM-dd").parse(date);
      } catch (_) {}
      // dd-MM-yyyy-MM
      return DateFormat("yyyy-MM-dd").parse(getFormattedDate(date));
    } catch (_) {

    }
    return DateFormat("dd/MM/yyyy").parse(date);
  }

  bool isDateTime(String date) {
    try {
      print(f.parse(date));
      return true;
    } catch (_) {}
    return false;
  }

  bool isBeforeDate({String? dateBegin, String? dateData}) {
    try {
      return stringToDateDDMMYYYY(dateBegin!)!.isBefore(
          stringToDateDDMMYYYY(dateData!)!);
    } catch (e) {
      print("Error - isBeforeDate : $e");
    }
    return false;
  }

  bool isAfterDate({String? dateBegin, String? dateData}) {
    try {
      final a = stringToDateDDMMYYYY(dateBegin!);
      final b = stringToDateDDMMYYYY(dateData!);
      return stringToDateDDMMYYYY(dateBegin!)!.isAfter(
          stringToDateDDMMYYYY(dateData!)!);
    } catch (e) {
      print("Error - isAfterDate : $e");
    }
    return false;
  }

  bool isCheckMidDate({String? dateBegin, String? dateEnd, String? dateData}) {
    try {
      return stringToDateDDMMYYYY(dateBegin!)!
          .isAfter(stringToDateDDMMYYYY(dateData!)!) &&
          stringToDateDDMMYYYY(dateEnd!)!
              .isBefore(stringToDateDDMMYYYY(dateData!)!);
    } catch (e) {
      print("Error - isCheckMidDate : $e");
    }
    return false;
  }
}
