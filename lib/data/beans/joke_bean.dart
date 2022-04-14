class JokeBean {
  JokeBean({
    this.id,
    this.type,
    this.setup,
    this.punchline,
  });

  JokeBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    setup = json['setup'];
    punchline = json['punchline'];
  }

  int? id;
  String? type;
  String? setup;
  String? punchline;
}
