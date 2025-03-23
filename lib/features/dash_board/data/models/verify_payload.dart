class VerifyPayload{
  final String email;
  final String code;
  final String location;

  VerifyPayload({required this.email, required this.code, required this.location});



  Map<String, dynamic> toMap() {
    return {'email': this.email, 'otp': this.code, 'location': this.location};
  }

  factory VerifyPayload.fromMap(Map<String, dynamic> map) {
    return VerifyPayload(
      email: map['email'] as String,
      code: map['otp'] as String,
      location: map['location'] as String,
    );
  }
}