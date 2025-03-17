// Description: This file contains a network checking utility function and its implementation 
// to verify internet connectivity in a Flutter application. The checkNetwork() function 
// attempts to reach Google and times out after 5 seconds. The event handler shows a 
// NoInternet page when connection fails. Last updated: March 17, 2025

// Network checking function
Future<void> checkNetwork() async {
  try {
    final response = await http
        .get(Uri.parse('https://www.google.com'))
        .timeout(const Duration(seconds: 5));
    if (response.statusCode != 200) {
      throw Exception('No internet connection');
    }
  } catch (e) {
    print('Network check failed: $e');
    throw Exception('No internet connection');
  }
}

// Implementation on event
Future<void> checkConnection(BuildContext context) async {
  try {
    await checkNetwork();
  } catch (e) {
    if (mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const NoInternet(),
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
    return;
  }
}

/* Usage example:
 * Call checkConnection(context) whenever you need to verify internet connectivity
 * Requirements: 
 * - import 'package:http/http.dart' as http;
 * - BuildContext available
 * - NoInternet widget/page defined
 * - mounted property available in StatefulWidget
 * - _isLoading boolean defined in state
 */
