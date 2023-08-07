import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD'),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _buildAddEditUserView(text: 'ADD', addEditFlag: 1, docId: '');
            },
          )
        ],
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) => Card(
            color: AppColors.cardColor,
            child: ListTile(
              title: Text(controller.users[index].name!),
              subtitle: Text(controller.users[index].cnic!),
              leading: CircleAvatar(
                child: Text(
                  controller.users[index].name!.substring(0, 1).capitalize!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                backgroundColor: AppColors.secondaryColor,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                onPressed: () {
                  displayDeleteDialog(controller.users[index].docId!);
                },
              ),
              onTap: () {
                controller.nameController.text = controller.users[index].name!;
                controller.cnicController.text = controller.users[index].cnic!;
                _buildAddEditUserView(
                    text: 'UPDATE',
                    addEditFlag: 2,
                    docId: controller.users[index].docId!);
              },
            ),
          ),
        ),
      ),
    );
  }

  _buildAddEditUserView({String? text, int? addEditFlag, String? docId}) {
    Get.bottomSheet(Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${text} User'),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Name'),
                  controller: controller.nameController,
                  validator: (value) {
                    return controller.validateName(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'CNIC'),
                  controller: controller.cnicController,
                  validator: (value) {
                    return controller.ValidateCnic(value!);
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      width: Get.context!.width, height: 45),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.saveUpdateUser(controller.nameController.text,
                          controller.cnicController.text, docId!, addEditFlag!);
                    },
                    child: Text(text!),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  displayDeleteDialog(String docId) {
    Get.defaultDialog(
      title: "Delete User",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete user?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.black,
      onCancel: () {},
      onConfirm: () {
        controller.deleteData(docId);
      },
    );
  }
}
