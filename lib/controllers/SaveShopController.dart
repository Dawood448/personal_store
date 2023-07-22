import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/Screens/DashBoard/DB5.dart';

class SaveShopController extends GetxController {
  Api_Provider api_provider = Api_Provider();

  void SaveShopAPI({
    required String computerNo,
    required int invoiceType,
    required int detailCode,
    required String cashCustomerName,
    required int exchangeRate,
    required String remarks,
    required double grossTotal,
    required List<Map<String, dynamic>> invoiceDetail,
  }) {
    api_provider
        .saveShopSaleAPI(
      computerNo: computerNo,
      invoiceType: invoiceType,
      detailCode: detailCode,
      cashCustomerName: cashCustomerName,
      exchangeRate: exchangeRate,
      remarks: remarks,
      grossTotal: grossTotal,
      invoiceDetail: invoiceDetail,
    )
        .then((value) async {
      if (value!.status == true) {
        showDialog(
          context: Get.overlayContext!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Items Added Successfully.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    GetStorage().remove('myKey');
                    Get.to(() => Dashboard4(
                          fullname: GetStorage().read('fullname'),
                          SalesmanID: GetStorage().read('SalesmanId'),
                        ));
                  },
                ),
              ],
            );
          },
        );
        print(value.status);
      } else {
        showDialog(
          context: Get.overlayContext!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Failed'),
              content: Text('There is an Error.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    // Do something on OK pressed
                  },
                ),
              ],
            );
          },
        );
      }
    }).onError((error, stackTrace) {
      print("${error}");
    });
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
