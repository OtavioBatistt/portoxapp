import 'package:portox_app/app/commons/domain/checklist_answer_entity.dart';
import 'package:portox_app/app/commons/domain/checklist_seal_entity.dart';
import 'package:portox_app/app/commons/domain/checklist_signature_entity.dart';

class ChecklistEntity {
  const ChecklistEntity({
    required this.answers,
    required this.seals,
    required this.signatures,
    this.token = '',
    this.flowCode = '',
    this.createdAt = '',
    this.scheduleNumber = '',
    this.sync = false,
    this.accepted = false,
    this.tag,
    this.weight,
    this.compartment,
    this.supervisor,
  });

  final String token;
  final String flowCode;
  final String scheduleNumber;
  final String? tag;
  final bool sync;
  final bool accepted;
  final double? weight;
  final int? supervisor;
  final int? compartment;
  final String createdAt;
  final List<ChecklistAnswerEntity> answers;
  final List<ChecklistSealEntity> seals;
  final List<ChecklistSignatureEntity> signatures;

  Map<String, dynamic> toMap() => {
        'token': token,
        'flowCode': flowCode,
        'scheduleNumber': scheduleNumber,
        'sync': sync,
        'accepted': accepted,
        'compartment': compartment,
        'createdAt': createdAt,
        'tag': tag,
        'weight': weight,
        'supervisor': supervisor,
        'answers': answers.map((e) => e.toMap()).toList(),
        'seals': seals.map((e) => e.toMap()).toList(),
        'signatures': signatures.map((e) => e.toMap()).toList(),
      };
}
