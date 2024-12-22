import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiController extends GetxController {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  var posts = <dynamic>[].obs;
  var isLoading = false.obs;

  // Fungsi untuk GET data
  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        posts.value = json.decode(response.body);
        Get.snackbar('Sukses', 'Data berhasil diambil!');
      } else {
        throw Exception('Gagal mengambil data');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk POST data
  Future<void> createPost() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'userId': 1,
        }),
      );
      if (response.statusCode == 201) {
        posts.add({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'id': posts.length + 1,
        });
        Get.snackbar('Sukses', 'Data berhasil ditambahkan!');
      } else {
        throw Exception('Gagal melakukan Post');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Fungsi untuk UPDATE data
  Future<void> updatePost() async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/posts/1'),
        body: json.encode({
          'title': 'Updated Title',
          'body': 'Updated Body',
          'userId': 1,
        }),
      );
      if (response.statusCode == 200) {
        final index = posts.indexWhere((post) => post['id'] == 1);
        if (index != -1) {
          posts[index]['title'] = 'Updated Title';
          posts[index]['body'] = 'Updated Body';
        }
        Get.snackbar('Sukses', 'Data berhasil diperbarui!');
      } else {
        throw Exception('Gagal melakukan Update data');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Fungsi untuk DELETE data
  Future<void> deletePost() async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/posts/1'));
      if (response.statusCode == 200) {
        posts.removeWhere((post) => post['id'] == 1);
        Get.snackbar('Sukses', 'Data berhasil dihapus!');
      } else {
        throw Exception('Gagal menghapus data');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
