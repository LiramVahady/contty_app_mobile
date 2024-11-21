class RegisterRequest {
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String email;

  // Constructor
  RegisterRequest({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  // Factory constructor to create an instance from JSON
  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      username: json['username'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }

  // Method to convert the instance into a Map (for sending as a request body)
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
