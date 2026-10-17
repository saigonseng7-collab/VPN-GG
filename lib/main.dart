import 'package:flutter/material.dart';

void main() {
  runApp(const VPNGGApp());
}

class VPNGGApp extends StatelessWidget {
  const VPNGGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VPN GG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.blueAccent,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isConnected = false;
  String selectedServer = '🇹🇭 Thailand - Bangkok (Fast)';

  void toggleConnection() {
    setState(() {
      isConnected = !isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VPN GG', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.15),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blueAccent, width: 2.5),
            ),
            child: const Center(
              child: Text(
                'GG',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey[800]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedServer, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                const Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
              ],
            ),
          ),
          GestureDetector(
            onTap: toggleConnection,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isConnected ? Colors.green.shade600 : Colors.grey[850],
                boxShadow: [
                  BoxShadow(
                    color: isConnected ? Colors.green.withOpacity(0.4) : Colors.black54,
                    blurRadius: 25,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.power_settings_new,
                    size: 75,
                    color: isConnected ? Colors.white : Colors.grey[400],
                  ),
                ],
              ),
            ),
          ),
          Text(
            isConnected ? 'CONNECTED (เชื่อมต่อแล้ว)' : 'DISCONNECTED (ยังไม่เชื่อมต่อ)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isConnected ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
