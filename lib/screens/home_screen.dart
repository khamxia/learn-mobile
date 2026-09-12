import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {  // 👈 ແກ້ເບື້ອງນີ້ເປັນ StatefulWidget
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'All',
    'Men',
    'Women',
    'Girls',
  ];
    
  // 📍 ແກ້ໄຂຈຸດທີ 1: ລົບ @override ທີ່ຂຽນຊ້ຳກັນ 2 ເທື່ອອອກ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // ປ້ອງກັນບໍ່ໃຫ້ເນື້ອຫາຕິດຂອບ Dynamic Island / Notch
        child: SingleChildScrollView( // ເຮັດໃຫ້ໜ້າຈໍສາມາດເລື່ອນຂຶ້ນ-ລົງໄດ້
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),          // 1. Header
              const SizedBox(height: 20),
              _buildSearchBar(),       // 2. Search Bar
              const SizedBox(height: 20),
              _buildCategories(),      // 3. Categories
              const SizedBox(height: 20),
              _buildBanner(),          // 4. Banner Promotion
              const SizedBox(height: 25),
              _buildPopularProducts(), // 5. Popular Products
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(), // 6. ເມນູດ້ານລຸ່ມ
    );
  }

  // header
  Widget _buildHeader(){
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage('https://imgs.search.brave.com/-TPKrvJh7D2UOaJkGCfyII6HO47YWy9VBZRuUtYHpBQ/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3N5c3RlbS9y/ZXNvdXJjZXMvdGh1/bWJuYWlscy8wNTkv/MjMwLzA5NS9zbWFs/bC9wb3J0cmFpdC1v/Zi1hLXN3ZWV0LWxp/dHRsZS1naXJsLXdl/YXJpbmctYS1ibGFj/ay1oYXQtaW4tdGhl/LWF1dHVtbi1hLXN0/dW5uaW5nLXJlcHJl/c2VudGF0aW9uLW9m/LWNoaWxkaG9vZC1q/b3ktZnJlZS1waG90/by5qcGc'),//profile
        ),
        const SizedBox(width: 12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const[
            Text('Hello Alex',style: TextStyle(color: Colors.grey,fontSize: 13)),
            Text('Good Morning',style: TextStyle(color: Colors.black,fontSize: 18),)
          ],
        ), // 📍 ແກ້ໄຂຈຸດທີ 2: ເພີ່ມເຄື່ອງໝາຍ ຄອມມາ (,) ຫຼັງຈາກ Column(...) 
        const Spacer(), // ດັນໄອຄອນໄປທາງຂວາສຸດ
        // ປຸ່ມ Notification ທີ່ມີ Dot ສີສົ້ມ
        Stack(
          children: [
            const Icon(Icons.notifications_none_rounded, size: 24),
            Positioned(
              right: 0, top: 0,
              child: Container(
                width: 8, height: 8,
                decoration: const BoxDecoration(color: Color(0xFFFF5722), shape: BoxShape.circle),
              ),
            )
          ],
        ),
      ],
    );
  }

  // ໂຄດສ່ວນ Search Bar
  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded( // ໃຫ້ຊ່ອງ Search ຍືດເຕັມພື້ນທີ່ທີ່ເຫຼືອ
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Text('Search...', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // ປຸ່ມ Filter
        Container(
          width: 48, height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.tune_rounded),
        ),
      ],
    );
  }

  // ໂຄດສ່ວນ Categories
  Widget _buildCategories() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // ເລື່ອນແນວນອນ
        itemCount: _categories.length, // 📍 ແກ້ໄຂຈຸດທີ 3: ປ່ຽນເປັນ _categories ໃຫ້ກົງກັບຕົວແປ
        itemBuilder: (context, index) {
          bool isSelected = _selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategoryIndex = index), // ເມື່ອຄລິກປ່ຽນສະຖານະ
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFFF5722) : const Color(0xFFF6F6F6), // ສີສົ້ມເມື່ອຖືກເລືອກ
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _categories[index], // 📍 ແກ້ໄຂຈຸດທີ 3: ປ່ຽນເປັນ _categories ໃຫ້ກົງກັບຕົວແປ
                style: TextStyle(color: isSelected ? Colors.white : Colors.grey[700]),
              ),
            ),
          );
        },
      ),
    );
  }

  // ໂຄດສ່ວນ Banner Promotion
  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFFFF5722), // ສີສົ້ມຫຼັກ
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack( // ໃຊ້ Stack ເພື່ອວາງຮູບຄົນຊ້ອນຢູ່ດ້ານຂວາ
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Get Your\nSpecial Sale\nUp to 40%', 
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text('Shop Now', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
          Positioned( // ຈັດວາງຮູບນາງແບບຢູ່ gócຂວາ
            right: 0, bottom: 0, top: 0,
            child: Image.network('https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=400'),
          ),
        ],
      ),
    );
  }

  // ໂຄດສ່ວນ Popular Products
  Widget _buildPopularProducts() {
    return Row(
      children: [
        Expanded(child: _buildProductCard('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400')),
        const SizedBox(width: 10),
        Expanded(child: _buildProductCard('https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400')),
        
      ],
    );
  }

  // Component ຍ່ອຍສຳລັບ Card ສິນຄ້າ
  Widget _buildProductCard(String imageUrl) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Center(child: Image.network(imageUrl)),
          const Positioned( // ໄອຄອນ Heart (Wishlist)
            top: 10, right: 10,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite_border, size: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  // 📍 ແກ້ໄຂຈຸດທີ 4: ເພີ່ມຟັງຊັນ _buildBottomNavigationBar() ເຂົ້າໄປເພື່ອນຳໃຊ້ກັບ Scaffold
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() => _selectedIndex = index),
      selectedItemColor: const Color(0xFFFF5722),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Shopping'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ],
    );
  }
}