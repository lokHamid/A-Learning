import 'package:a_learning/Admin/Page/AdminPage.dart';
import 'package:a_learning/Login/View.dart';
import 'package:a_learning/Student/Pages/Assignments.dart';
import 'package:a_learning/Student/Pages/Detailedassignments.dart';
import 'package:a_learning/Student/Pages/dashboard.dart';
import 'package:a_learning/teacher/pages/Teacherpages/dashboardpage.dart';
import 'package:a_learning/teacher/pages/Teacherpages/teacherview.dart';
import 'package:a_learning/teacher/pages/Teacherpages/teacherassignmentsm.dart';
import 'package:a_learning/teacher/teacher%20course/viewmodel.dart';
import 'package:a_learning/teacher/teacher.dart';
import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';
import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:a_learning/teacher/teacherassignmantsmnage/viewmodel.dart';
import 'package:a_learning/test.dart';
import 'package:a_learning/tr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mvc/view.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => teacherassignmanag()),

        ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {

  @override


  Widget build(BuildContext context) {
    List<files> f=[];
    f.add(files(name: 'python', url:'https://www.youtube.com/watch?v=gs8qfL9PNac', idfile: 1));
    f.add(files(name: 'java', url:'https://drive.google.com/file/d/16fg8BFsiy1lZNyTYVJI6eN40wNaGLTb4/view?usp=sharing', idfile: 1));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Translation Test Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Teacher()

    );
  }
}

class TestTranslationPage extends StatefulWidget {
  @override
  _TestTranslationPageState createState() => _TestTranslationPageState();
}

class _TestTranslationPageState extends State<TestTranslationPage> {
  final TranslationService _translationService = TranslationService();
  String _selectedLanguage = 'en'; // Default to English

  // Variables to hold translated text for UI elements
  String _titleText = "Welcome to Our Translation Demo";
  String _subtitleText = "Experience Multi-Language Support";
  String _descriptionText = "Enter your details below and select a language to see live translation.";
  String _nameLabelText = "Name";
  String _emailLabelText = "Email";
  String _buttonText = "Submit";

  @override
  void initState() {
    super.initState();
    _translateUI();  // Initial translation to default language
  }

  // Method to translate all UI text
  Future<void> _translateUI() async {
    final title = await _translationService.translate("Welcome to Our Translation Demo", _selectedLanguage);
    final subtitle = await _translationService.translate("Experience Multi-Language Support", _selectedLanguage);
    final description = await _translationService.translate("Enter your details below and select a language to see live translation.", _selectedLanguage);
    final nameLabel = await _translationService.translate("Name", _selectedLanguage);
    final emailLabel = await _translationService.translate("Email", _selectedLanguage);
    final button = await _translationService.translate("Submit", _selectedLanguage);

    setState(() {
      _titleText = title;
      _subtitleText = subtitle;
      _descriptionText = description;
      _nameLabelText = nameLabel;
      _emailLabelText = emailLabel;
      _buttonText = button;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Set textDirection based on selected language
    TextDirection textDirection = _selectedLanguage == 'ar' ? TextDirection.rtl : TextDirection.ltr;

    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
      ),
      body: Directionality(
        textDirection: textDirection,  // Apply text direction here
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _titleText,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                _subtitleText,
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              Text(
                _descriptionText,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              Text(
                _nameLabelText,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: _nameLabelText,
                ),
              ),
              SizedBox(height: 20),
              Text(
                _emailLabelText,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: _emailLabelText,
                ),
              ),
              SizedBox(height: 30),
              DropdownButton<String>(
                value: _selectedLanguage,
                onChanged: (String? newLanguage) {
                  setState(() {
                    _selectedLanguage = newLanguage!;
                  });
                  _translateUI();
                },
                items: <String>['en', 'es', 'fr', 'de', 'ar']
                    .map<DropdownMenuItem<String>>((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language.toUpperCase()),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your submit action here
                },
                child: Text(_buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
