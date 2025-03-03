import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(BusMapApp());
}

class BusMapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: Icon(Icons.directions_bus),
        title: Text('Bus Map'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.school),
                hintText: 'Tìm kiếm địa điểm',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),

          // Khung chứa bản đồ
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(10.7769, 106.7009), // TP. Hồ Chí Minh
                      initialZoom: 13.0,
                    ),
                    children: [
                      // Bản đồ chuyển tuyến từ Thunderforest
                      TileLayer(
                        urlTemplate: 'https://tile.thunderforest.com/atlas/'
                            '{z}/{x}/{y}.png?apikey=30bd60a20b974c7c8f4f269a3f66f902'
                            ,
                      ),

                      // Marker vị trí trung tâm
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 50.0,
                            height: 50.0,
                            point: LatLng(10.7769, 106.7009),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                _buildFeatureItem(Icons.directions_bus, 'Tra cứu'),
                _buildFeatureItem(Icons.route, 'Tìm đường'),
                _buildFeatureItem(Icons.location_on, 'Trạm xung quanh'),
                _buildFeatureItem(Icons.feedback, 'Góp ý'),
                _buildFeatureItem(Icons.school, 'Student Hub'),
                _buildFeatureItem(Icons.business, 'Buýt Doanh nghiệp'),
                _buildFeatureItem(Icons.directions_car, 'Tìm kiếm xe'),
                _buildFeatureItem(Icons.chat, 'Chat Nhóm'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Thông báo'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Quét mã'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Yêu thích'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title) {
    return InkWell(
      onTap: () {
        print("$title được nhấn");
      },
      splashColor: Colors.green.withOpacity(0.2),
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.withOpacity(0.2),
            child: Icon(icon, color: Colors.green),
          ),
          SizedBox(height: 5),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
