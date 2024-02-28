class Run {
  final int? id;
  final String title;
  final String start;
  final String finish;
  final DateTime date;

  Run(
    this.id,
    this.title,
    this.start,
    this.finish,
    this.date
  );

  
  Run.fromSQLite(Map<String, Object?> json) 
    : id =  json['id'] as int,
      title = json['title'] as String,
      start = json['start'] as String,
      finish = json['end'] as String,
      date = DateTime.parse(json['date'].toString());

  Map<String, dynamic> toJson() => {
    'title': title,
    'start': start,
    'finish': finish,
    'date': date
  };
}