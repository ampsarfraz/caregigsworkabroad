class CommentandReply {
  final String postId;
  final String username;
  final String comment;
  final int commentLikes;
  CommentandReply(
      {required this.postId,
      required this.username,
      required this.commentLikes,
      required this.comment});
  factory CommentandReply.fromJson(Map<String, dynamic> json) {
    return CommentandReply(
      postId: json['name'],
      username: json['date'],
      commentLikes: json['order_total_price'],
      comment: json['order_total_quantity'],
    );
  }
}


 // final List<Items> items;
  // items: List<Items>.from(
      //   json["items"].map(
      //     (x) => Items.fromJson(x),
      //   ),
     // ),
// class Items {
//   final String id;
//   final String itemName;
//   final num price;
//   final num stock;
//   final num quantity;
//   final num itemTotal;
//   Items({
//     required this.id,
//     required this.itemName,
//     required this.price,
//     required this.stock,
//     required this.quantity,
//     required this.itemTotal,
//   });
//   factory Items.fromJson(Map<String, dynamic> json) {
//     return Items(
//       id: json['id'],
//       itemName: json['name'],
//       price: json['price'] ?? 0,
//       stock: json['stock'],
//       quantity: json['quantity'] ?? 0,
//       itemTotal: json['itemTotal'] ?? 0,
//     );
//   }
// }
