import '../../../../utils/common_imports.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.sp),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: AppTheme.primaryColor,
          ),
        ),
        titleSpacing: 15.sp,
        elevation: 0,
        title:
            text(giveText: 'Kimara', fontweight: FontWeight.w500, fontsize: 18),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Image.asset(
              'assets/edit_square_FILL0_wght400_GRAD0_opsz48.png',
              height: 25,
              width: 25,
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Column(
              children: [
                verticalSpacing(20),
                textField(
                  backgroundColor: Colors.grey.shade100,
                  fieldController: TextEditingController(),
                  onFieldEntry: null,
                  giveHint: 'Search',
                  labelColor: AppTheme.commonTextColor,
                  prefixWidget: Icon(
                    Icons.search,
                    color: AppTheme.primaryColor,
                  ),
                ),
                verticalSpacing(20),
                Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (c, i) {
                          return chatProfile(ontap: () {
                            Get.toNamed('userchat');
                          });
                        }))
              ],
            )),
      ),
    );
  }
}

Widget chatProfile(
    {String user = 'Username',
    String message = 'last received message',
    required void Function()? ontap}) {
  return ListTile(
    onTap: ontap,
    contentPadding: const EdgeInsets.all(0),
    leading: CircleAvatar(
      backgroundColor: AppTheme.primaryColor,
      radius: 25,
    ),
    title: text(giveText: user, textColor: Colors.black87),
    subtitle: text(giveText: message, textColor: AppTheme.commonTextColor),
    trailing: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.more_vert,
        size: 25,
        color: AppTheme.primaryColor,
      ),
    ),
  );
}
