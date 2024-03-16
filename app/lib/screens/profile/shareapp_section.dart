import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShareAppSection extends StatelessWidget {
  void shareViaMessaging() {
    // Handle share via messaging
    // Use platform-specific code to open messaging app
  }

  void shareOnSocialMedia() {
    // Handle share on social media
    // Use platform-specific code to open social media apps
  }

  void shareViaEmail() {
    // Handle share via email
    // Use platform-specific code to open email app
  }

  void copyLinkToClipboard() {
    // Handle copy link to clipboard
    Clipboard.setData(ClipboardData(text: 'Your App Download Link'));
    // Optionally show a snackbar or toast to indicate the link is copied
  }

  void inviteFriends() {
    // Handle inviting friends
    // You can navigate to a screen where users can enter friend's contact information
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildShareCard(
                icon: Icons.message,
                label: 'Share via Messaging',
                onPressed: shareViaMessaging,
              ),
              buildShareCard(
                icon: Icons.share,
                label: 'Share on Social Media',
                onPressed: shareOnSocialMedia,
              ),
              buildShareCard(
                icon: Icons.email,
                label: 'Share via Email',
                onPressed: shareViaEmail,
              ),
              buildShareCard(
                icon: Icons.content_copy,
                label: 'Copy Link to Clipboard',
                onPressed: copyLinkToClipboard,
              ),
              buildShareCard(
                icon: Icons.person_add,
                label: 'Invite Friends',
                onPressed: inviteFriends,
              ),
              buildShareCard(
                icon: Icons.qr_code,
                label: 'Show QR Code',
                onPressed: () {
                  // Handle showing QR code
                  // You can navigate to a screen with the QR code
                },
              ),
              // ... other share options
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShareCard({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            width: 350,
            height: 60,
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 247, 136, 255),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromARGB(255, 247, 136, 255),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
