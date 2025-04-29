class SupervisorEntity {
  const SupervisorEntity(
    this.userId,
    this.username,
    this.description,
    this.password,
  );
  final int userId;
  final String username;
  final String description;
  final String password;

  static SupervisorEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return SupervisorEntity(
      map['user_id'],
      map['user_name'],
      map['description'],
      map['password'],
    );
  }
}
