// To parse this JSON data, do
//
//     final animeQuote = animeQuoteFromJson(jsonString);

import 'dart:convert';

List animeQuoteFromJson(String str) =>
    List<AnimeQuote>.from(json.decode(str).map((x) => AnimeQuote.fromJson(x)));

String animeQuoteToJson(List<AnimeQuote> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimeQuote {
  AnimeQuote({
    required this.anime,
    required this.character,
    required this.quote,
  });

  String? anime;
  String? character;
  String? quote;

  factory AnimeQuote.fromJson(Map<String, dynamic> json) => AnimeQuote(
        anime: json["anime"],
        character: json["character"],
        quote: json["quote"],
      );

  Map<String, dynamic> toJson() => {
        "anime": anime,
        "character": character,
        "quote": quote,
      };
}
