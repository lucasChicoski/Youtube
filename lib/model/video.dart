class Video {
  String? id;
  String? title;
  String? image;
  String? channel;
  String? description;

  Video({
    this.id,
    this.title,
    this.image,
    this.channel,
    this.description,
  });

  // static convertJson(Map<String, dynamic> json){
  //   return Video(
  //     id: json['id']['videoId'],
  //     title: json['snippet']['title'],
  //     image: json['snippet']['thumbnails']['high']['url'],
  //     channel: json['snippet']['channelId']
  //   );
  // }

  factory Video.fromJason(Map<String, dynamic> json) {
    return Video(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        image: json['snippet']['thumbnails']['high']['url'],
        channel: json['snippet']['channelId'],
        description: json['snippet']['description']);
  }
}


//Pesquisar -> Dieferença entre Static e Factory