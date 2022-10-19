import '../../../../utils/common_imports.dart';

void sendNewMessageBottomSheet() {
  Get.bottomSheet(const SendNew(), backgroundColor: Colors.transparent);
}

class SendNew extends StatelessWidget {
  const SendNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            children: [
              verticalSpacing(20),
              textField(
                giveHeight: 40,
                backgroundColor: Colors.grey.shade100,
                fieldController: TextEditingController(),
                onFieldEntry: null,
                giveHint: 'Search',
                labelColor: AppTheme.commonTextColor,
                alignLabelasHint: true,
                prefixWidget: Icon(
                  Icons.search,
                  color: AppTheme.primaryColor,
                ),
              ),
              verticalSpacing(10),
              Expanded(
                  child: ListView.separated(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (c, i) {
                  return ListTile(
                    onTap: () {
                      Get.toNamed('userchat');
                    },
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: AppTheme.primaryColor,
                    ),
                    title: text(
                      giveText: 'name',
                      fontsize: 16,
                    ),
                    subtitle: text(
                        giveText: 'userName',
                        fontsize: 15,
                        textColor: AppTheme.commonTextColor),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: AppTheme.primaryColor,
                      iconSize: 20,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return verticalSpacing(10);
                },
              ))
            ],
          ),
        ));
  }
}
