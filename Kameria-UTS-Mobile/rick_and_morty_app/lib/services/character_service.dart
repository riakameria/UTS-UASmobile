import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/models/character.dart';

class CharacterService {
  static const String _baseUrl = "https://rickandmortyapi.com/api/character";

  // Get list characters dengan pagination
  Future<List<Character>> getCharacters({int page = 1}) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl?page=$page'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List results = jsonData['results'];

        List<Character> characters = results
            .map((characterData) => Character.fromJson(characterData))
            .toList();

        return characters;
      } else {
        throw Exception("Gagal mengambil data karakter");
      }
    } catch (e) {
      throw Exception("Gagal mengambil data karakter: $e");
    }
  }

  // Get character by ID
  Future<Character> getCharacterById(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/$id'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return Character.fromJson(jsonData);
      } else {
        throw Exception("Gagal mengambil detail karakter");
      }
    } catch (e) {
      throw Exception("Gagal mengambil detail karakter: $e");
    }
  }

  // Search characters by name
  Future<List<Character>> searchCharacters(String name) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl?name=$name'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List results = jsonData['results'];

        List<Character> characters = results
            .map((characterData) => Character.fromJson(characterData))
            .toList();

        return characters;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // Filter by status
  Future<List<Character>> filterByStatus(String status) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl?status=$status'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List results = jsonData['results'];

        List<Character> characters = results
            .map((characterData) => Character.fromJson(characterData))
            .toList();

        return characters;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}