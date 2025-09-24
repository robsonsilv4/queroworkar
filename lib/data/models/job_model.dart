class Job {
  Job({
    required this.image,
    required this.title,
    required this.date,
    required this.url,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        image: json['image'] as String,
        title: json['title'] as String,
        date: json['date'] as String,
        url: json['url'] as String,
      );

  String image;
  String title;
  String date;
  String url;

  Map<String, dynamic> toJson() => {
        'image': image,
        'title': title,
        'date': date,
        'url': url,
      };
}
