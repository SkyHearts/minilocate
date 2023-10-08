class Images {
  final String url;
  final ImagesVer ver;

  Images({required this.url, required this.ver});
  factory Images.fromJson(Map<String, dynamic> json) => Images(
    url: json["link"] as String,
    ver: ImagesVer.fromJson(json["versions"]),
  );
  Map<String, dynamic> toJson() => {
    'link': url,
    'versions': ver,
  };
}

class ImagesVer {
  final String large , medium, small, micro;

  ImagesVer({required this.large, required this.medium, required this.small, required this.micro,});
  factory ImagesVer.fromJson(Map<String, dynamic> json) => ImagesVer(
    large: json["large"] as String,
    medium: json["medium"] as String,
    small: json["small"] as String,
    micro: json["micro"] as String,
  );
  Map<String, dynamic> toJson() => {
    'large': large,
    'medium': medium,
    'small': small,
    'micro': micro,
  };
}