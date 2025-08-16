import 'package:news_app/Model/model_endpoints.dart';
import 'package:news_app/Model/model_card.dart';

List<ModelCard> modelCardData = [
  ModelCard(imageCard: 'assets/business.avif', titleCard: 'Business'),
  ModelCard(imageCard: 'assets/entertaiment.avif', titleCard: 'Entertaiment'),
  ModelCard(imageCard: 'assets/general.avif', titleCard: 'General'),
  ModelCard(imageCard: 'assets/health.avif', titleCard: 'Health'),
  ModelCard(imageCard: 'assets/science.avif', titleCard: 'Science'),
  ModelCard(imageCard: 'assets/sports.avif', titleCard: 'Sports'),
  ModelCard(imageCard: 'assets/technology.jpeg', titleCard: 'Technology'),
];

List<ModelEndpoints> endpoints = [
  ModelEndpoints(title: 'business'),
  ModelEndpoints(title: 'entertainment'),
  ModelEndpoints(title: 'general'),
  ModelEndpoints(title: 'health'),
  ModelEndpoints(title: 'science'),
  ModelEndpoints(title: 'sports'),
  ModelEndpoints(title: 'technology'),
];
