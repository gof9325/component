import 'package:flutter/material.dart';
import 'package:route_summary_timeline/step_widget.dart';
import 'package:route_summary_timeline/step_model.dart';

class Timeline extends StatelessWidget {
  const Timeline({
    super.key,
    this.stepList = const [
      StepModel(timeMinutes: 10, method: Method.walk, startEnd: StartEnd.start),
      StepModel(timeMinutes: 10, method: Method.bus, line: '100'),
      StepModel(timeMinutes: 10, method: Method.subway, line: '1'),
      StepModel(
          timeMinutes: 10,
          method: Method.subway,
          line: '2',
          startEnd: StartEnd.end),
    ],
  });

  final List<StepModel> stepList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              for (final step in stepList)
                StepWidget(
                  step: step,
                  ratio: stepList.length,
                  color: step.method == Method.walk
                      ? Colors.grey
                      : step.method == Method.bus
                          ? Colors.blue
                          : Colors.green,
                  icon: step.method == Method.walk
                      ? Icons.directions_walk_rounded
                      : step.method == Method.bus
                          ? Icons.directions_bus_rounded
                          : Icons.subway_rounded,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
