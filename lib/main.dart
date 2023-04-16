import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: const Homepage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   final String title;
//   const MyHomePage({super.key, required this.title});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   //st<AnimeQuote> _animeQuotes = List<AnimeQuote>();

//   List<AnimeQuote> animeQuotesList = [];

//   Future<List<AnimeQuote>> getAnimeQuotes() async {
//     //var url = "https://animechan.vercel.app/api/quotes";
//     //final response = await http.get(Uri.parse(url));
//     final response = await rootBundle.loadString('assets/sample.json');
//     //var data = jsonDecode(response.body.toString());
//     var data = jsonDecode(response);
//     //print(data);

//     if (true) {
//       for (Map i in data) {
//         AnimeQuote animeQuote = AnimeQuote(
//             anime: i['anime'], character: i['character'], quote: i['quote']);
//         animeQuotesList.add(animeQuote);
//       }
//       return animeQuotesList;
//     } else {
//       return animeQuotesList;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F3),
//       body: CustomScrollView(slivers: <Widget>[
//         const SliverAppBar(
//           expandedHeight: 200,
//           pinned: true,
//           flexibleSpace: FlexibleSpaceBar(
//             title: Text('FilledStacks'),
//           ),
//         ),
//         SliverList(
//           delegate: SliverChildListDelegate([
//             Flexible(
//               child: FutureBuilder(
//                 future: getAnimeQuotes(),
//                 builder: (context, AsyncSnapshot<List<AnimeQuote>> snapshot) {
//                   return ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     itemCount:
//                         animeQuotesList == null ? 0 : animeQuotesList.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: Column(
//                           children: [
//                             Text(
//                               snapshot.data![index].quote.toString(),
//                               style: const TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w300),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text(
//                                   snapshot.data![index].character.toString(),
//                                   style: const TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                   child: Text(
//                                     ":",
//                                     style: TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Text(
//                                     snapshot.data![index].anime.toString(),
//                                     style: const TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             )
//           ]),
//         )
//       ]),
//     );
//   }
// }
