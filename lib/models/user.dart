class UserFields {
  static final String id = 'id';
  static final String name = 'name';
  static final String email = 'email';
  static final String isBegginer = 'isBegginer';

  static List<String> getFields() =>
    [id, name, email, isBegginer];
}

class User{
  final int? id;
  final String name;
  final String email;
  final bool isBegginer;

  const User({
    this.id, 
    required this.name, 
    required this.email, 
    required this.isBegginer
    }
  );

  User copy({
    int? id,
    String? name,
    String? email,
    bool? isBegginer,
  }) => User(id: id ?? this.id, name: name ?? this.name, email: email ?? this.email, isBegginer: isBegginer ?? this.isBegginer);

  Map<String, dynamic> toJson() => {
    UserFields.id: id,
    UserFields.name: name,
    UserFields.email: email,
    UserFields.isBegginer: isBegginer,
  };
}