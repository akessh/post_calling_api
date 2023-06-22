import 'package:flutter/material.dart';
import 'package:sample_api_request/models/post.dart';
import 'package:sample_api_request/services/remote_services.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Post>? posts;
  var isLoded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //fetch data from api
    getData();
  }

  getData() async {
    posts = await RemoteServices().getpost();
    if (posts != null) {
      setState(() {
        isLoded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 20,);
          },
          itemCount: posts!.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.grey,
              width: double.infinity,
              height: 100,
              
              child: Row(
                
                children: [
                 const CircleAvatar(
                    backgroundColor: Colors.white60,
                    
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    
                    child: Text(
                      posts![index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
