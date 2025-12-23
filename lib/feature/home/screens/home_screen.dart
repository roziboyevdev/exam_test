import 'package:exam_test/feature/home/provider/home_provider.dart';
import 'package:exam_test/feature/painter/screen/signature_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Painter')),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) => Stack(
          children: [
            ListView.builder(
              padding: const .all(16),
              itemCount: value.points?.length ?? 1,
              itemBuilder: (context, index) {
                return ListTile(title: Text('$index-painter'));
              },
            ),
            Align(
              alignment: .bottomCenter,
              child: Padding(
                padding: const .all(18.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(borderRadius: .circular(32)),
                    backgroundColor: Colors.blue.shade500,
                    fixedSize: .fromHeight(56),
                    minimumSize: .fromHeight(56),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PainterScreen()),
                    );
                  },
                  child: Text(
                    'New painter',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: .bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
