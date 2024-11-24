import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:videotiktok/data/models/video.dart';
import 'package:videotiktok/routes/api_endpoint.dart';

class VideoService {
  Future<List<Video>> fetchVideos() async {
    final url = Uri.parse(ApiEndpoint.getVideos);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> data = responseData['videos'];
        return data.map((video) => Video.fromJson(video)).toList();
      } else {
        print('Failed to fetch videos: ${response.statusCode}');
        throw HttpException('Failed to fetch videos: ${response.statusCode}');
      }
    } on FormatException catch (e) {
      // Lỗi parse JSON
      print('Failed to parse response: ${e.message}');
      throw Exception('Failed to parse response: ${e.message}');
    } on http.ClientException catch (e) {
      // Lỗi kết nối HTTP
      print('HTTP Client error: ${e.message}');
      throw Exception('HTTP Client error: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('fetch videos Unexpected error: $e');
    }
  }
}
