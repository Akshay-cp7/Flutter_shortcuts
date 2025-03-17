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

 try {
                                    await checkNetwork(); // Call the corrected function
                                  } catch (e) {
                                
                                    if (mounted) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder:
                                              (context) => const NoInternet(),
                                        ),
                                      );
                                    }
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    return; 
                                  }
