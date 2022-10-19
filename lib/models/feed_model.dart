class FeedPost {
  final String postId;
  final String username;
  final String postTime;
  final String feedText;
  final String feedImageUrl;
  FeedPost(
      {required this.postId,
      required this.username,
      required this.postTime,
      required this.feedText,
      required this.feedImageUrl});
  factory FeedPost.fromJson(Map<String, dynamic> json) {
    return FeedPost(
      postId: json['name'],
      username: json['date'],
      postTime: json[''],
      feedText: json['order_total_quantity'],
      feedImageUrl: json['order_total_price'],
    );
  }
}
