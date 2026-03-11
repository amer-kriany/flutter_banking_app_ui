import 'package:banking_app/componets/customizedTapBar.dart';
import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildFeaturedOffer(),
                    const SizedBox(height: 32),
                    _buildSectionHeader('Exclusive Deals', onSeeAll: () {}),
                    const SizedBox(height: 16),
                    _buildExclusiveDealsList(),
                    const SizedBox(height: 32),
                    _buildSectionHeader('Cashback Offers', onSeeAll: () {}),
                    const SizedBox(height: 16),
                    _buildCashbackList(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TapBar(initialIndex: 1,),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Offers',
            style: TextStyle(
              fontFamily: 'Mont',
              fontWeight: FontWeight.w800,
              fontSize: 34,
              color: Color(0xFF200E32),
            ),
          ),
          Row(
            children: [
              Opacity(
                opacity: 0.8,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: const Icon(
                    Icons.lock_outline_rounded,
                    color: Color(0xFF200E32),
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Opacity(
                opacity: 0.8,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: const Icon(
                    Icons.notifications_none_rounded,
                    color: Color(0xFF200E32),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedOffer() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF250447),
            Color(0xFF6B21A8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF250447).withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background decorative circles
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.06),
              ),
            ),
          ),
          Positioned(
            right: 40,
            bottom: -40,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.06),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Limited Time',
                    style: TextStyle(
                      fontFamily: 'Mont',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Get 20% Cashback',
                      style: TextStyle(
                        fontFamily: 'Mont',
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'On all purchases this weekend',
                      style: TextStyle(
                        fontFamily: 'Mont',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Claim Now',
                        style: TextStyle(
                          fontFamily: 'Mont',
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Color(0xFF250447),
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
    );
  }

  Widget _buildSectionHeader(String title, {required VoidCallback onSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Mont',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xFF200E32),
          ),
        ),
        GestureDetector(
          onTap: onSeeAll,
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Color(0xFF200E32),
          ),
        ),
      ],
    );
  }

  Widget _buildExclusiveDealsList() {
    final deals = [
      _DealItem(
        icon: Icons.local_cafe_rounded,
        iconColor: const Color(0xFFFF6B35),
        bgColor: const Color(0xFFFFF0EB),
        title: 'Starbucks',
        subtitle: 'Buy 1 Get 1 Free',
        tag: '50% OFF',
        tagColor: const Color(0xFFFF6B35),
      ),
      _DealItem(
        icon: Icons.shopping_bag_rounded,
        iconColor: const Color(0xFF6B21A8),
        bgColor: const Color(0xFFF3E8FF),
        title: 'Amazon',
        subtitle: 'Free delivery on orders',
        tag: 'FREE',
        tagColor: const Color(0xFF6B21A8),
      ),
      _DealItem(
        icon: Icons.movie_rounded,
        iconColor: const Color(0xFF0EA5E9),
        bgColor: const Color(0xFFE0F2FE),
        title: 'Netflix',
        subtitle: '3 months premium plan',
        tag: 'NEW',
        tagColor: const Color(0xFF0EA5E9),
      ),
    ];

    return Column(
      children: deals.map((deal) => _buildDealCard(deal)).toList(),
    );
  }

  Widget _buildDealCard(_DealItem deal) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.black.withOpacity(0.07),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: deal.bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(deal.icon, color: deal.iconColor, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deal.title,
                  style: const TextStyle(
                    fontFamily: 'Mont',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFF200E32),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  deal.subtitle,
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: deal.tagColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              deal.tag,
              style: TextStyle(
                fontFamily: 'Mont',
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: deal.tagColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCashbackList() {
    final cashbacks = [
      _CashbackItem(label: 'Groceries', percent: '5%', color: const Color(0xFF62C73F)),
      _CashbackItem(label: 'Dining', percent: '8%', color: const Color(0xFFFF6B35)),
      _CashbackItem(label: 'Travel', percent: '10%', color: const Color(0xFF0EA5E9)),
      _CashbackItem(label: 'Electronics', percent: '3%', color: const Color(0xFF6B21A8)),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 1.5,
      children: cashbacks.map((c) => _buildCashbackCard(c)).toList(),
    );
  }

  Widget _buildCashbackCard(_CashbackItem item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item.color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: item.color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.percent,
            style: TextStyle(
              fontFamily: 'Mont',
              fontWeight: FontWeight.w800,
              fontSize: 26,
              color: item.color,
            ),
          ),
          Text(
            item.label,
            style: TextStyle(
              fontFamily: 'Mont',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

 
  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isActive) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF250447),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 20),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Mont',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ] else ...[
          Icon(icon, color: const Color(0xFF200E32).withOpacity(0.4), size: 28),
        ],
      ],
    );
  }
}

class _DealItem {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String subtitle;
  final String tag;
  final Color tagColor;

  _DealItem({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.tagColor,
  });
}

class _CashbackItem {
  final String label;
  final String percent;
  final Color color;

  _CashbackItem({
    required this.label,
    required this.percent,
    required this.color,
  });
}
