import 'package:flutter/material.dart';

void main() {
  runApp(DestiniApp());
}

class DestiniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destini Adventure',
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int _storyNumber = 0;

  final List<Map<String, dynamic>> _storyData = [
    {
      'story': 'Bạn lạc vào khu rừng bí ẩn với hai con đường trước mặt.',
      'choices': ['Trái', 'Phải'],
      'next': [1, 2]
    },
    {
      'story': 'Bạn nghe thấy tiếng cành cây gãy. Một bóng đen lao tới!',
      'choices': ['Chạy trốn', 'Đứng yên quan sát'],
      'next': [3, 4]
    },
    {
      'story': 'Một con sư tử trắng xuất hiện chặn đường.',
      'choices': ['Chạy về phía rừng', 'Đối mặt với sư tử'],
      'next': [5, 6]
    },
    {
      'story': 'Bạn vấp ngã nhưng đó chỉ là một con nai. Tiếp tục đi.',
      'choices': ['Tiếp tục'],
      'next': [0]
    },
    {
      'story': 'Một cụ già bí ẩn đưa bạn chìa khóa. Bạn tiếp tục hành trình.',
      'choices': ['Tiếp tục'],
      'next': [0]
    },
    {
      'story': 'Bạn rơi vào hố sâu và mắc kẹt mãi mãi...',
      'choices': ['Chơi lại'],
      'next': [0]
    },
    {
      'story': 'Bạn vượt qua bài kiểm tra của sư tử và thoát khỏi khu rừng!',
      'choices': ['Chơi lại'],
      'next': [0]
    },
  ];

  void _changeStory(int choiceIndex) {
    setState(() {
      _storyNumber = _storyData[_storyNumber]['next'][choiceIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  _storyData[_storyNumber]['story'],
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Column(
              children: _storyData[_storyNumber]['choices']
                  .asMap()
                  .entries
                  .map<Widget>((entry) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ElevatedButton(
                          onPressed: () => _changeStory(entry.key),
                          child: Text(entry.value),
                        ),
                      ))
                  .toList()
                  .cast<Widget>(), // Chuyển đổi danh sách thành List<Widget>
            ),
          ],
        ),
      ),
    );
  }
}
