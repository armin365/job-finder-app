import 'package:flutter/material.dart';
import 'package:job_finder_app/providers/user_provider.dart';
import 'package:job_finder_app/screens/users/services/favoriteservices.dart';
import 'package:provider/provider.dart';

class FaviroteScreen extends StatefulWidget {
  static const pagename = '/favorite';
  const FaviroteScreen({
    super.key,
  });

  @override
  State<FaviroteScreen> createState() => _FaviroteScreenState();
}

class _FaviroteScreenState extends State<FaviroteScreen> {
  Favoriteservices favoriteservices = Favoriteservices();
  void removeFavorite(int index) async {
    favoriteservices.removeFavorite(context: context, index: index);
  }

  bool isLoading = true;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var user = Provider.of<Userprovider>(
      context,
    ).users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite jobs'),
        elevation: 5,
      ),
      body: isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/splash.png'),
                CircularProgressIndicator(),
              ],
            )
          : user.favoriteJobs!.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning, size: 64, color: Colors.orange),
                      SizedBox(height: 16),
                      Text(
                        'No favorite jobs',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: user.favoriteJobs!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var favoriteJob = user.favoriteJobs![index];
                      var job = favoriteJob['job'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          height: size.height * 0.18,
                          child: Card(
                            surfaceTintColor: Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ListTile(
                                      contentPadding:
                                          const EdgeInsets.only(left: 6),
                                      title:
                                          Text(job['title'] ?? 'Unknown Job'),
                                      subtitle: Text(
                                        job['description'] ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          removeFavorite(index);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
