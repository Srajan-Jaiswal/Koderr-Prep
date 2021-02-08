import 'package:koderr/widgets/practice_sets_listTile.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

class PracticeSet {
  final String imageUrl;
  final String labName;
  final String labDescription;
  final String webUrl;
  PracticeSet(this.labName, this.labDescription, this.webUrl, this.imageUrl);
}

class PracticeSetPage extends StatefulWidget {
  @override
  _PracticeSetPageState createState() => _PracticeSetPageState();
}

class _PracticeSetPageState extends State<PracticeSetPage> {
  static List<PracticeSet> name = [
    PracticeSet(
        'Must Do Interview Problems',
        '                                        GFG',
        'https://www.geeksforgeeks.org/must-do-coding-questions-for-companies-like-amazon-microsoft-adobe/',
        'assets/images/gfg.png'),
    PracticeSet(
        'Important Leetcode Problems',
        '                                      Leetcode',
        'https://github.com/Srajan-Jaiswal/Leetcode-Problems',
        'assets/images/leetcode.png'),
    PracticeSet(
        'Competetive Programming Sheet',
        '                                    Codeforces',
        'https://a2oj.com/ladders',
        'assets/images/cp.jpg'),
    PracticeSet(
        'Love Babbar DSA Sheet',
        '                                        YouTube',
        'https://drive.google.com/file/d/1FMdN_OCfOI0iAeDlqswCiC2DZzD4nPsb/view',
        'assets/images/DSA.jpg'),
    PracticeSet(
        'Striver SDE Sheet',
        '                                     YouTube',
        'https://docs.google.com/document/d/1SM92efk8oDl8nyVw8NHPnbGexTS9W-1gmTEYfEurLWQ/edit',
        'assets/images/striver.jpg'),
    PracticeSet(
        'Techie Delight Interview Questions',
        '                                        Techie Delight',
        'https://www.techiedelight.com/huge-collection-of-array-interview-questions/',
        'assets/images/techie_delight.png'),     
    PracticeSet(
        'Top 25 Interview Questions',
        '                                        GeeksforGeeks',
        'https://www.geeksforgeeks.org/top-25-interview-questions/',
        'assets/images/top25.png'),       
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text(
          'Practice Section',
          style: TextStyle(
              color: Colors.red,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            final PracticeSet practiceset = name[index];
            return PracticeSetTile(
              sheetTitle: practiceset.labName,
              sheetDescription: practiceset.labDescription,
              webUrl: practiceset.webUrl,
              imageUrl: practiceset.imageUrl,
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        tooltip: 'Search Practice Sets',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<PracticeSet>(
            items: name,
            searchLabel: 'Search Practice Sets',
            suggestion: Center(
              child: Text('Practice sets for coding practice'),
            ),
            failure: Center(
              child: Text('No set found :('),
            ),
            filter: (practiceset) => [
              practiceset.labName,
              practiceset.labDescription,
              practiceset.webUrl,
              practiceset.imageUrl
            ],
            builder: (practiceset) => PracticeSetTile(
              sheetTitle: practiceset.labName,
              sheetDescription: practiceset.labDescription,
              webUrl: practiceset.webUrl,
              imageUrl: practiceset.imageUrl,
            ),
          ),
        ),
        child: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }
}
