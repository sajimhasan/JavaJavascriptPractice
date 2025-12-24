import 'package:ecommercewithlocal/core/controller/SellerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BecomeSellerPage extends StatelessWidget {
  BecomeSellerPage({super.key});

  final SellerInfoController controller = Get.put(SellerInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Become a Seller'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Grow Your Business With Us',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Join our platform as a seller and reach more customers. '
              'Choose a package that suits your business and contact us '
              'to get started.',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Packages
            _sectionTitle('Seller Packages'),
            _packageCard('Homemade', '100 BDT / month'),
            _packageCard('Hotel', '300 BDT / month'),
            _packageCard('Restaurant', '500 BDT / month'),

            const SizedBox(height: 24),

            // Required Information
            _sectionTitle('Required Information'),
            _infoText('• Full Name'),
            _infoText('• Contact Number'),
            _infoText('• NID Card'),
            _infoText('• Address'),
            _infoText('• Business Details (if any)'),

            const SizedBox(height: 32),

            // Contact buttons
            _sectionTitle('Contact With Us'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _contactButton(
                    icon: Icons.message_outlined,
                    label: 'WhatsApp',
                    color: Colors.green,
                    onTap: controller.openWhatsApp,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _contactButton(
                    icon: Icons.bolt,
                    label: 'Instagram',
                    color: Colors.purple,
                    onTap: controller.openInstagram,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _contactButton(
              icon: Icons.call,
              label: 'Call Us',
              color: Colors.blue,
              onTap: controller.callUs,
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _packageCard(String title, String price) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Text(
          price,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _infoText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _contactButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
        icon: Icon(icon,color: Colors.white,),
        label: Text(label,style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}