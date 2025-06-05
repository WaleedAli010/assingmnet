import 'package:flutter/material.dart';
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Threads',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15), // 15px from right edge
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(scrollDirection: Axis.vertical,shrinkWrap: true,itemCount: 100,itemBuilder: (context,index){
              return ListTile(leading: CircleAvatar(radius: 50,),);
            })
          ],
        ),
      ),
    );
  }
}
