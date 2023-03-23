import 'package:condominios/widgets/messages/dropdownadd.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _propertyController = TextEditingController(text: 'Casa 5');
  TextEditingController _nameController = TextEditingController(text: 'Nombres y apellidos');
  TextEditingController _relationshipController = TextEditingController(text: 'Parentesco');
  TextEditingController _whatsappController = TextEditingController(text: 'Whatsapp de referencia');

  bool _propertyEditable = false;
  bool _nameEditable = false;
  bool _relationshipEditable = false;
  bool _whatsappEditable = false;

  Widget buildEditableTextField({required TextEditingController controller, required String label, required bool editable, required VoidCallback onEdit}) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(),
            ),
            enabled: editable,
          ),
        ),
        IconButton(
          icon: Icon(editable ? Icons.cancel : Icons.edit),
          onPressed: onEdit,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildEditableTextField(
              controller: _propertyController,
              label: 'Propiedad',
              editable: _propertyEditable,
              onEdit: () => setState(() => _propertyEditable = !_propertyEditable),
            ),
            SizedBox(height: 20),
            buildEditableTextField(
              controller: _nameController,
              label: 'Nombres y apellidos',
              editable: _nameEditable,
              onEdit: () => setState(() => _nameEditable = !_nameEditable),
            ),
            SizedBox(height: 20),
            buildEditableTextField(
              controller: _relationshipController,
              label: 'Parentesco',
              editable: _relationshipEditable,
              onEdit: () => setState(() => _relationshipEditable = !_relationshipEditable),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Expanded(
                  child: buildEditableTextField(
                    controller: _whatsappController,
                    label: 'Whatsapp de referencia',
                    editable: _whatsappEditable,
                    onEdit: () => setState(() => _whatsappEditable = !_whatsappEditable),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            DropdownWithAddAndRemove(),
          ],
        ),
      ),
    );
  }
}
