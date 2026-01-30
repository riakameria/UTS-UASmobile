import 'package:flutter/material.dart';

class Character {
  final int id;
  final String name;
  final String status; // Alive, Dead, unknown
  final String species; // Human, Alien, etc
  final String type;
  final String gender;
  final String image;
  final Location origin;
  final Location location;
  final List<String> episode;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
    required this.episode,
  });

  // Factory constructor untuk parsing JSON dari API
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      status: json['status'] ?? 'unknown',
      species: json['species'] ?? 'Unknown',
      type: json['type'] ?? '',
      gender: json['gender'] ?? 'Unknown',
      image: json['image'] ?? '',
      origin: Location.fromJson(json['origin'] ?? {}),
      location: Location.fromJson(json['location'] ?? {}),
      episode: List<String>.from(json['episode'] ?? []),
    );
  }

  // Getter untuk warna berdasarkan status
  Color get statusColor {
    switch (status.toLowerCase()) {
      case 'alive':
        return Colors.green;
      case 'dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  // Getter untuk icon berdasarkan status
  IconData get statusIcon {
    switch (status.toLowerCase()) {
      case 'alive':
        return Icons.check_circle;
      case 'dead':
        return Icons.dangerous;
      default:
        return Icons.help_outline;
    }
  }

  // Getter untuk warna berdasarkan species
  Color get speciesColor {
    switch (species.toLowerCase()) {
      case 'human':
        return Colors.blue;
      case 'alien':
        return Colors.purple;
      case 'humanoid':
        return Colors.teal;
      case 'robot':
        return Colors.orange;
      default:
        return Colors.indigo;
    }
  }

  // Getter untuk icon berdasarkan species
  IconData get speciesIcon {
    switch (species.toLowerCase()) {
      case 'human':
        return Icons.person;
      case 'alien':
        return Icons.emoji_nature;
      case 'humanoid':
        return Icons.android;
      case 'robot':
        return Icons.smart_toy;
      default:
        return Icons.pets;
    }
  }

  // Getter untuk jumlah episode
  int get episodeCount => episode.length;

  // Getter untuk display type (jika kosong return species)
  String get displayType => type.isEmpty ? species : type;
}

// Class untuk Location (Origin dan Current Location)
class Location {
  final String name;
  final String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] ?? 'Unknown',
      url: json['url'] ?? '',
    );
  }
}