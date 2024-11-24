import 'package:translator/translator.dart';

class TranslationService {
  final GoogleTranslator _translator = GoogleTranslator();

  Future<String> translate(String text, String targetLanguageCode) async {
    try {
      final translation = await _translator.translate(text, to: targetLanguageCode);
      return translation.text;
    } catch (e) {
      print("Translation Error: $e");
      return text;  // Fallback to original text if there's an error
    }
  }
}
