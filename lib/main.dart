import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: 'SF Pro',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color(0xFFE8E8E8),
                      child: Icon(Icons.person, color: Colors.grey),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Welcome Back!',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const Text(
                          'Leon Fernandez',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.notifications_outlined, size: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Balance Card
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your Balance',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: const Center(
                                  child: Text(
                                    '\$',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'USD',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down, size: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Available for Use',
                      style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '\$651,972.00',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        icon: Icons.add,
                        label: 'Top Up',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildActionButton(
                        icon: Icons.arrow_forward,
                        label: 'Transfer',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(Icons.more_horiz, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Overview Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Overview Cards
                Row(
                  children: [
                    Expanded(child: _buildSpendingCard()),
                    const SizedBox(width: 12),
                    Expanded(child: _buildSubscriptionCard()),
                  ],
                ),
                const SizedBox(height: 30),

                // Spending Categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Spending Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Category Item
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F0FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Freepik Premium',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Today • 08:00 AM',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        '-\$49',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingCard() {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            'Spending',
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text(
                '\$945',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  '+2.7%',
                  style: TextStyle(color: Colors.green, fontSize: 11),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              gradient: const LinearGradient(
                colors: [Colors.white, Colors.green, Colors.yellow],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard() {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDD835),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.subscriptions_outlined,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            'Subscription',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSubscriptionIcon('N', Colors.red),
              _buildSubscriptionIcon('S', Colors.green),
              _buildSubscriptionIcon('♥', Colors.pink),
              _buildSubscriptionIcon('P', Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionIcon(String text, Color color) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', true),
          _buildNavItem(Icons.swap_horiz, '', false),
          _buildNavItem(Icons.pie_chart_outline, '', false),
          _buildNavItem(Icons.settings_outlined, '', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        if (label == 'Home') {
          // Already on home
        } else {
          // Navigate to other screens
          if (icon == Icons.pie_chart_outline) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReportPage()),
            );
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
              size: 24,
            ),
            if (label.isNotEmpty && isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// REPORT PAGE
class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Report',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Congratulations Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.celebration,
                        color: Colors.orange,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Congratulations! 🎉',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Great progress! Keep controlling your finances!',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Data Metrics Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Metrics',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Income-Expense Insight Analyzer',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          '6 Months',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Chart
              SizedBox(
                height: 200,
                child: CustomPaint(painter: ChartPainter(), child: Container()),
              ),
              const SizedBox(height: 24),

              // Income and Expense Stats
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Average Income',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text(
                              '\$11,876.00',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                '+8.4%',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Average Expense',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text(
                              '\$7,525.00',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                '+6.8%',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Your Saving
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Saving',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$321,523.05',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _buildSavingIcon(Icons.home_outlined, 0.7),
                      const SizedBox(width: 12),
                      _buildSavingIcon(Icons.refresh, 0.5),
                      const SizedBox(width: 12),
                      _buildSavingIcon(Icons.trending_up, 0.6),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Goals
              Row(
                children: [
                  Expanded(child: _buildGoalCard('Dream House')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildGoalCard('New Car')),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildSavingIcon(IconData icon, double progress) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 3,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.green, size: 20),
        ),
      ],
    );
  }

  Widget _buildGoalCard(String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            title == 'Dream House'
                ? Icons.home_outlined
                : Icons.directions_car_outlined,
            color: Colors.grey,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, false, context),
          _buildNavItem(Icons.swap_horiz, false, context),
          _buildNavItem(Icons.pie_chart, true, context),
          _buildNavItem(Icons.settings_outlined, false, context),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (icon == Icons.home_outlined) {
          Navigator.pop(context);
        } else if (icon == Icons.settings_outlined) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QRCodePage()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
          size: 24,
        ),
      ),
    );
  }
}

// Chart Painter
class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final paint2 = Paint()
      ..color = Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final pointPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    // Draw orange line
    final path1 = Path();
    path1.moveTo(0, size.height * 0.4);
    path1.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.3,
      size.width * 0.35,
      size.height * 0.35,
    );
    path1.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.4,
      size.width * 0.65,
      size.height * 0.25,
    );
    path1.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.1,
      size.width,
      size.height * 0.2,
    );
    canvas.drawPath(path1, paint1);

    // Draw green line
    final path2 = Path();
    path2.moveTo(0, size.height * 0.7);
    path2.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.65,
      size.width * 0.35,
      size.height * 0.6,
    );
    path2.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.55,
      size.width * 0.65,
      size.height * 0.5,
    );
    path2.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.45,
      size.width,
      size.height * 0.5,
    );
    canvas.drawPath(path2, paint2);

    // Draw point on orange line
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.4),
      4,
      pointPaint,
    );

    // Draw point on green line
    final greenPointPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.55),
      4,
      greenPointPaint,
    );

    // Draw labels
    final textPainter1 = TextPainter(
      text: const TextSpan(
        text: '\$8,875.00',
        style: TextStyle(
          color: Colors.black,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter1.layout();
    textPainter1.paint(canvas, Offset(size.width * 0.35, size.height * 0.15));

    final textPainter2 = TextPainter(
      text: const TextSpan(
        text: '\$6,952.00',
        style: TextStyle(
          color: Colors.black,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter2.layout();
    textPainter2.paint(canvas, Offset(size.width * 0.6, size.height * 0.15));

    // Draw month labels
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
    for (int i = 0; i < months.length; i++) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: months[i],
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(i * size.width / 6 + 10, size.height - 20),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// QR CODE PAGE
class QRCodePage extends StatelessWidget {
  const QRCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D2D2D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Scan QR Code',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 280,
              height: 280,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // QR Code simulation
                  CustomPaint(
                    size: const Size(240, 240),
                    painter: QRCodePainter(),
                  ),
                  // Center logo
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFDD835),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // User Info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white.withOpacity(0.7),
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Devano Mahendra',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Experience fast, secure, and hassle-free transactions with FirePay. Scan QR codes and complete payments effortlessly!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 48),

            // Share Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, color: Colors.white),
                      SizedBox(width: 12),
                      Text(
                        'Share Code',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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

// QR Code Painter
class QRCodePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final blockSize = size.width / 24;
    final random = math.Random(42); // Fixed seed for consistency

    // Draw QR pattern
    for (int i = 0; i < 24; i++) {
      for (int j = 0; j < 24; j++) {
        // Skip center area for logo
        if (i >= 9 && i <= 15 && j >= 9 && j <= 15) continue;

        // Draw corner squares
        if ((i < 7 && j < 7) || (i < 7 && j > 16) || (i > 16 && j < 7)) {
          if ((i == 0 || i == 6 || j == 0 || j == 6) ||
              (i >= 2 && i <= 4 && j >= 2 && j <= 4)) {
            canvas.drawRect(
              Rect.fromLTWH(
                j * blockSize,
                i * blockSize,
                blockSize * 0.9,
                blockSize * 0.9,
              ),
              paint,
            );
          }
        } else if (random.nextDouble() > 0.5) {
          // Random pattern
          canvas.drawRect(
            Rect.fromLTWH(
              j * blockSize,
              i * blockSize,
              blockSize * 0.9,
              blockSize * 0.9,
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
