class Job {
  String image;
  String title;
  String date;
  String url;

  Job({
    required this.image,
    required this.title,
    required this.date,
    required this.url,
  });

  Map<String, dynamic> toJson() => {
        'image': image,
        'title': title,
        'date': date,
        'url': url,
      };

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        image: json['image'],
        title: json['title'],
        date: json['date'],
        url: json['url'],
      );
}
