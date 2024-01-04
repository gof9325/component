enum Method {
  walk,
  bus,
  subway,
}

enum StartEnd {
  start,
  end,
}

class StepModel {
  const StepModel({
    required this.timeMinutes,
    required this.method,
    this.line,
    this.startEnd,
  });
  final int timeMinutes;
  final Method method;
  final String? line;
  final StartEnd? startEnd;
}
