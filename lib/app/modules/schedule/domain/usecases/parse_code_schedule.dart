import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/line_entity.dart';

class ParseCodeScheduleUseCase {
  Future<Either<Failure, ScheduleEntity>> call(String rawCode) async {
    try {
      final code = rawCode.split('|');

      if (code.length < 14) return left(InvalidParams());

      final lines = <LineEntity>[];
      String driverName = '';

      // A partir do index 14 são linhas OU nome do motorista
      for (var i = 14; i < code.length; i++) {
        if (code[i].contains('*')) {
          final line = code[i].split('*');
          if (line.length < 7) continue; // evita erro por linha incompleta

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
        } else if (code[i].isNotEmpty) {
          driverName = code[i]; // qualquer coisa que não tenha * é o nome
        }
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
          driverName: driverName,
        ),
      );
    } on Exception {
      return left(InvalidParams());
    }
  }
}
