import 'package:condominios/widgets/option_box.dart';
import 'package:flutter/material.dart';
import 'package:condominios/theme/app_theme.dart';
import 'package:condominios/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.background,
      drawer: const CustomDrawer(),
      body:  Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: size.height * 0.03),
                alignment: Alignment.topCenter,
                child: GridView.count(
        crossAxisCount: 2, // 2 columns
        children: const <Widget>[
          // OptionBox(Icons.home, '/'),
          OptionBox(Icons.message, '/messages'),
          OptionBox(Icons.person, '/profile'),
          OptionBox(Icons.qr_code, '/generate_qr'),
          OptionBox(Icons.check, '/validate_qr'),
          OptionBox(Icons.toys_outlined, '/services')
          // add more options as needed
        ],
      )
        ),
      persistentFooterButtons: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _FooterButton(
                  text: 'Mis QRs',
                  color: AppTheme.background,
                  path: '/my_qrs',
                  ),
                _FooterButton(
                  text: 'Actividades',
                  color: AppTheme.background,
                  path: '/activities',
                  ),
              ],
            ),
            // Row(
            //   children: const [
            //     _FooterButton(text: 'NEED HELP?', color: AppTheme.primary),
            //   ],
            // ),
          ],
        ),
      ],
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }
}

class _FooterButton extends StatelessWidget {
  final String text;
  final Color color;
  final String path;
  const _FooterButton({
    Key? key,
    required this.text,
    required this.color,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.elliptical(5, 5)),
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: 1,
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            Navigator.pushNamed(context, path);
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
          )),
    ));
  }
}
