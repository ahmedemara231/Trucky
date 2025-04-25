class ContactUsBody {
  String name;
  String phoneNumber;
  String title;
  String message;

  ContactUsBody({
    this.name = '',
    this.phoneNumber = '',
    this.title = '',
    this.message = ''
  });

  Map<String, dynamic> toJson() => {
    'type' : 'contact',
    'name': name,
    'phone': phoneNumber,
    'title': title,
    'message': message
  };
}
