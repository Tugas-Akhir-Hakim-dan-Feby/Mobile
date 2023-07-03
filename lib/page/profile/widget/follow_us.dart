import 'package:api_mobile/components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowUsPage extends StatefulWidget {
  const FollowUsPage({Key? key}) : super(key: key);

  @override
  State<FollowUsPage> createState() => _FollowUsPageState();
}

class _FollowUsPageState extends State<FollowUsPage> {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchFacebook() async {
    final urlScheme = 'fb://profile/64185906478'; // Ganti dengan ID halaman Facebook Anda
    final webUrl = 'https://www.facebook.com/groups/64185906478/?locale=id_ID'; // Ganti dengan URL halaman Facebook Anda
    if (await canLaunch(urlScheme)) {
      await launch(urlScheme);
    } else {
      await launch(webUrl);
    }
  }
  
void _launchYouTube() async {
    final urlScheme = 'https://www.youtube.com/@apipusatasosiasipengelasanindo/featured'; // Ganti dengan URL saluran YouTube Anda
    if (await canLaunch(urlScheme)) {
      await launch(urlScheme);
    } else {
      throw 'Could not launch $urlScheme';
    }
  }

  

  

  void _launchBrowser() async {
    final urlScheme = 'https://www.api-iws.org/';
    if (await canLaunch(urlScheme)) {
      await launch(urlScheme);
    } else {
      throw 'Could not launch $urlScheme';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: const Text('Halaman Ikuti Kami'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PhysicalModel(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: _launchFacebook,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              height: 64, // Specify the desired height
                              width: 64, // Specify the desired width
                              child: Image.asset(
                                'assets/facebook_logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PhysicalModel(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: _launchYouTube,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              height: 64, // Specify the desired height
                              width: 64, // Specify the desired width
                              child: Image.asset(
                                'assets/youtube_logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PhysicalModel(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: _launchBrowser,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              height: 64, // Specify the desired height
                              width: 64, // Specify the desired width
                              child: Image.asset(
                                'assets/browser.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
