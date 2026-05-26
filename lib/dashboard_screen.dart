import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  int _devClickCount = 0; 
  bool _isDevModeActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        title: GestureDetector(
          // TRIK SILUMAN: Klik judul "Science Studio" 5 kali untuk aktifkan mode Dev
          onTap: () {
            setState(() {
              _devClickCount++;
              if (_devClickCount >= 5) {
                _isDevModeActive = !_isDevModeActive;
                _devClickCount = 0;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_isDevModeActive ? 'Akses Dev Utama Aktif! (Privat & Siluman)' : 'Mode Rahasia Ditutup'),
                    backgroundColor: Colors.purple,
                  ),
                );
              }
            });
          },
          child: const Text('Science Studio', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        actions: [
          if (_isDevModeActive)
            IconButton(
              icon: const Icon(Icons.admin_panel_settings, color: Colors.amber, size: 28),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color(0xFF222222),
                    title: const Text('👑 Kedaulatan Dev Absolut', style: TextStyle(color: Colors.amber)),
                    content: const Text(
                      'Semua Sistem Terbuka Mutlak.\n\n'
                      '• Bebas upload tanpa batas durasi & ukuran\n'
                      '• Bypass enkripsi & hak cipta platform luar\n'
                      '• Mode Penyamaran Ikon & Anti-Intip aktif.',
                      style: TextStyle(color: Colors.white70),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Mulai Akses Bebas', style: TextStyle(color: Colors.cyanAccent)),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      body: _buildPageContent(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xFF111111),
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie_filter_outlined), label: 'Media Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.hub_outlined), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet_membership_outlined), label: 'Studio & Wallet'),
        ],
      ),
    );
  }

  Widget _buildPageContent(int index) {
    switch (index) {
      case 0:
        return const Center(child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('📺 MEDIA ENGINE\n\n[YouTube + TikTok + Instagram]\n\n• Scroll Video Pendek (Vertical)\n• Video Panjang (Chapters)\n• Carousel Post & Stories 24 Jam\n• Live Streaming & Virtual Gifts\n• Musik & Podcast Background Player', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 15)),
        ));
      case 1:
        return const Center(child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('💬 COMMUNICATION HUB\n\n[Discord + Teams + WhatsApp]\n\n• Chat Pribadi (End-to-End Encryption)\n• Server Komunitas, Channel & Roles\n• Voice Channel & Video Conference\n• Screen Sharing & Papan Tulis Tim\n• Kalender Kerja & Pembagian Tugas', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 15)),
        ));
      case 2:
        return const Center(child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('📊 DEV ANALYTICS & FINTECH\n\n[YT Studio + Wallet + AI Copilot]\n\n• Grafik Analitik Penonton Terpadu\n• Dompet Digital & Transfer Instan via Chat\n• AI Chatbot & Generator Skrip Konten\n• Detektor Hak Cipta Otomatis', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 15)),
        ));
      default:
        return const SizedBox();
    }
  }
}
