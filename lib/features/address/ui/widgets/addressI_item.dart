
import '../../data/model/address_model.dart';
import '../../../../routes_app.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  final AddressModel addressModel;
  const AddressItem({super.key, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(addressModel.addressName!),
        subtitle: Text(addressModel.addressStreet!),
        trailing: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.kAddressEdit,
                arguments: {
                  'addressModel': addressModel,
                });
          },
        ),
      ),
    );
  }
}
