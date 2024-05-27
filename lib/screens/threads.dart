import 'package:campusconnect/screens/createThread.dart';
import 'package:flutter/material.dart';

class Thread {
  final String title;
  final String description;
  final String category;
  final String author;
  int replies;
  final String lastActivity;
  final List<String> repliesList;

  Thread({
    required this.title,
    required this.description,
    required this.category,
    required this.author,
    required this.replies,
    required this.lastActivity,
    required this.repliesList,
  });
}

class ThreadsPage extends StatefulWidget {
  @override
  _ThreadsPageState createState() => _ThreadsPageState();
}

class _ThreadsPageState extends State<ThreadsPage> {
  final List<Thread> threads = [
    Thread(
      title: 'How to learn Flutter?',
      description: 'Looking for the best resources to learn Flutter.',
      category: 'Development',
      author: 'John Doe',
      replies: 15,
      lastActivity: '2 hours ago',
      repliesList: [
        'Great question!',
        'I recommend checking out the official Flutter documentation.',
        'You can also join online communities like Stack Overflow for help.'
      ],
    ),
    Thread(
      title: 'Best practices for state management?',
      description: 'Which state management approach is better for large apps?',
      category: 'Development',
      author: 'Jane Smith',
      replies: 8,
      lastActivity: '1 day ago',
      repliesList: [
        'There are various approaches like Provider, Bloc, Redux, etc.',
        'It depends on the complexity and requirements of your app.',
        'I personally prefer using Provider for simpler apps.'
      ],
    ),
    // Add more threads as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Threads'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200))),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _createThread(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: threads.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _openThreadDetails(context, threads[index]);
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 182, 195, 252),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        threads[index].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      threads[index].description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category: ${threads[index].category}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue[900],
                          ),
                        ),
                        Text(
                          'Replies: ${threads[index].replies}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green[900],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Author: ${threads[index].author}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue[900],
                          ),
                        ),
                        Text(
                          'Last Activity: ${threads[index].lastActivity}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Replies:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 232, 222, 222),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            threads[index].repliesList.isNotEmpty
                                ? threads[index].repliesList[0]
                                : 'No replies yet',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _openThreadDetails(BuildContext context, Thread thread) {
    // Implement thread details screen/navigation
    print('Open thread details: ${thread.title}');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThreadDetailsPage(thread: thread),
      ),
    );
  }
}

class ThreadDetailsPage extends StatelessWidget {
  final Thread thread;

  ThreadDetailsPage({required this.thread});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thread Details'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              thread.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              thread.description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 171, 200, 234),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: thread.repliesList.map((reply) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      reply,
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _createThread(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CreateThreadPage(),
    ),
  );
}
