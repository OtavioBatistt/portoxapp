import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/line_entity.dart';

const firstLineIndex = 14;

class ParseCodeScheduleUseCase {
  Future<Either<Failure, ScheduleEntity>> call(String rawCode) async {
    try {
      if (!_isValidCode(rawCode)) {
        return left(InvalidParams());
      }
      final code = rawCode.split('|');

      final lines = <LineEntity>[];
      for (var index = firstLineIndex; index < code.length - 1; index++) {
        final line = code[index].split('*');
        lines.add(
          LineEntity(
            lineNumber: line[0],
            compartment: int.parse(line[1]),
            itemId: int.parse(line[2]),
            itemCode: line[3],
            itemDescription: line[4],
            quantity: double.parse(line[5].replaceAll(',', '.')).round(),
            uom: line[6],
            warehouse: line.length > 7 ? line[7] : '',
          ),
        );
      }

      return right(
        ScheduleEntity(
          scheduleNumber: code[0],
          id: code[1],
          window: DateTime.parse(code[2]),
          plantCode: code[3],
          operationType: code[4],
          carrierDoc: code[5],
          truckPlate: code[6],
          trailerPlate: code[7],
          driverDoc: code[8],
          location: code[9],
          locationGroup: code[10],
          windowType: code[11],
          marketType: code[12],
          capacityWeight: int.parse(code[13]),
          lines: lines,
        ),
      );
    } on Exception {
      return left(InvalidParams());
    }
  }

  bool _isValidCode(String code) {
    if (code.isEmpty) {
      return false;
    }

    final data = code.split('|');
    if (data.isEmpty || data.length < firstLineIndex) {
      return false;
    }

    return true;
  }
}
