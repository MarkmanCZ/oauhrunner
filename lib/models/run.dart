class Run {
  final String title;
  final String start;
  final String finish;
  final DateTime date;

  Run(
    this.title,
    this.start,
    this.finish,
    this.date
  );

  Run.fromJson(Map<String, dynamic> json) 
    : title = json['title'] as String,
      start = json['start'] as String,
      finish = json['finish'] as String,
      date = DateTime.parse(json['date']);

  Map<String, dynamic> toJson() => {
    'title': title,
    'start': start,
    'finish': finish,
    'date': date
  };
}