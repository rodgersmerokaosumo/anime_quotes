import 'dart:convert';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'models/quote.dart';
import 'dart:developer';
import 'screens/screens.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List animeQuotes = [];

  Future<void> _handleRefresh() async {
    getAnimeQuotes();
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();
    getAnimeQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: DraggableFab(
        child: SpeedDial(
          closeManually: false,
          animatedIcon: AnimatedIcons.menu_close,
          spaceBetweenChildren: 0.5,
          overlayOpacity: 0.2,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.search_rounded),
              label: "Search Quotes",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.shuffle_on_rounded),
              label: "Random Quote",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RandomQuoteScreen(),
                  ),
                );
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.list_alt_rounded),
              label: "Available Anime and Character Names",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AvailableNamesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: double.maxFinite,
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: Colors.deepPurpleAccent,
                pinned: true,
                expandedHeight: 300,
                centerTitle: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image(
                    image: AssetImage('assets/images/hachiman.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  "Anime Quotes",
                  style: TextStyle(
                    fontSize: 30,
                    height: 1.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              // const SliverAppBar(
              //   backgroundColor: Colors.deepPurpleAccent,
              //   pinned: true,
              //   expandedHeight: 250,
              //   bottom: PreferredSize(
              //       child: SizedBox(), preferredSize: Size.fromHeight(-10)),
              // ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final animeTitle = animeQuotes[index]["anime"].toString();
                    final animeCharacter =
                        animeQuotes[index]["character"].toString();
                    final animeQuote = animeQuotes[index]["quote"].toString();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                animeTitle,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.notoSerif(
                                  fontSize: 19,
                                  height: 1.5,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: Text(
                                  animeQuote,
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.notoSerif(
                                    fontSize: 17,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              Text(
                                "- $animeCharacter",
                                textAlign: TextAlign.right,
                                style: GoogleFonts.notoSerif(
                                  fontSize: 14,
                                  height: 1.5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: animeQuotes.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<AnimeQuote> animeQuotesList = [];

  Future<void> getAnimeQuotes() async {
    var url = "https://animechan.vercel.app/api/quotes";
    //final response = await http.get(Uri.parse(url));
    final response = await rootBundle.loadString('assets/sample.json');
    //final data = [];
    if (true) {
      final data = jsonDecode(response) as List;
      //final data = jsonDecode(response.body) as List;
      setState(() {
        animeQuotes = data;
      });
    } else {
      log("Unexpected response");
    }

    //final data = jsonDecode(response.body.toString());
    //final data = jsonDecode(response) as List;
    //print(data);
  }
}
