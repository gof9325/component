import 'package:flutter/material.dart';
import 'package:route_summary_timeline/step_model.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({
    super.key,
    required this.step,
    required this.ratio,
    required this.color,
    required this.icon,
  });

  final StepModel step;
  final int ratio;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            step.line ?? '',
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: step.startEnd == StartEnd.start
                      ? const BorderRadius.horizontal(
                          left: Radius.circular(10),
                        )
                      : step.startEnd == StartEnd.end
                          ? const BorderRadius.horizontal(
                              right: Radius.circular(10),
                            )
                          : null,
                ),
                height: 10,
              ),
              Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '${step.timeMinutes}분',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
