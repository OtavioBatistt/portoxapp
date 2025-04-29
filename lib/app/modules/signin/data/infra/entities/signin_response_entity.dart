import 'dart:convert';

import 'package:portox_app/app/commons/domain/plant_entity.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/responsibles_entity.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/supervisor_entity.dart';

class SignInResponseEntity {
  const SignInResponseEntity(
    this.email,
    this.token,
    this.expirationDate,
    this.name,
    this.profile,
    this.profileName,
    this.plants,
    this.supervisors,
    this.responsibles,
  );

  final String email;
  final String token;
  final String expirationDate;
  final String name;
  final String profile;
  final String profileName;
  final List<PlantEntity> plants;
  final List<SupervisorEntity> supervisors;
  final List<ResponsibleEntity> responsibles;

  Map<String, dynamic> toMap() => {
        'email': email,
        'token': token,
        'expirationDate': expirationDate,
        'name': name,
        'plants': plants,
        'profile': profile,
        'profileName': profileName,
      };

  static SignInResponseEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    final plantList = <PlantEntity>[];
    for (final Map<String, dynamic> plant in map['plants']) {
      plantList.add(PlantEntity.fromMap(plant)!);
    }
    final supervisorList = <SupervisorEntity>[];
    for (final Map<String, dynamic> supervisor in map['supervisors']) {
      supervisorList.add(SupervisorEntity.fromMap(supervisor)!);
    }
    final responsibleList = <ResponsibleEntity>[];
    for (final Map<String, dynamic> responsibles in map['responsibles']) {
      responsibleList.add(ResponsibleEntity.fromMap(responsibles)!);
    }

    return SignInResponseEntity(
      map['email'],
      map['token'],
      map['token_expiration'],
      map['name'],
      map['profile'],
      map['profile_name'],
      plantList,
      supervisorList,
      responsibleList,
    );
  }

  String toJson() => json.encode(toMap());

  static SignInResponseEntity? fromJson(String source) =>
      fromMap(jsonDecode(source));
}
