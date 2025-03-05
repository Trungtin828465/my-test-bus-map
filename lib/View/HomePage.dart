import 'package:flutter/material.dart';
import 'MapGps.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Chỉ mục tab được chọn

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Map"),
        backgroundColor: Colors.green,
        leading: Icon(Icons.directions_bus), // Icon bus
        elevation: 0, // Bỏ bóng
      ),
      body: Column(
        children: [
          // Ô tìm kiếm địa điểm
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm địa điểm...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),

          // Bản đồ GPS (MapGps)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: MapGps(), // Gọi bản đồ GPS
                ),
              ),
            ),
          ),

          // Danh sách chức năng
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: GridView.count(
              shrinkWrap: true, // Không chiếm toàn bộ màn hình
              physics: NeverScrollableScrollPhysics(), // Vô hiệu hóa cuộn riêng
              crossAxisCount: 4, // 4 cột
              children: [
                _buildFeatureItem(Icons.directions_bus, 'Tra cứu'),
                _buildFeatureItem(Icons.route, 'Tìm đường'),
                _buildFeatureItem(Icons.location_on, 'Trạm gần đây'),
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

      // Thanh điều hướng dưới cùng
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

  // Hàm tạo một item chức năng
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
          Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
