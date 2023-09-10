import 'package:e_mart_flutter_app/consts/consts.dart';
import 'package:e_mart_flutter_app/widget_common/bg_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title: Text('Experts Chat'),
        ),
        body: Column(
          children: [
            // User Circle Image and Title Row
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(icProfile),
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(), // Add a horizontal divider

            // Chat List
            Expanded(
              child: ListView.builder(
                itemCount: 20, // Replace with your actual chat item count
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Chat $index'),
                    subtitle: Text('Last message from John Doe'),
                    onTap: () {
                      // Open the chat screen for this user
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}