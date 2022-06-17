import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => PageOne(),
      '/detail': (context) => const PageTwo(image: '', name: ''),
    },
  ));
}

class Photo {
  final String image;
  final String name;

  Photo(this.image, this.name);
}

class PageOne extends StatelessWidget {
  PageOne({Key? key}) : super(key: key);

  final List<Photo> photos = [
    Photo("https://picsum.photos/200/300", "Chandra 1"),
    Photo("https://picsum.photos/200/300", "David 2"),
    Photo("https://picsum.photos/200/300", "Ollive"),
    Photo("https://picsum.photos/200/300", "Sengkuni"),
    Photo("https://picsum.photos/200/300", "Diah"),
    Photo("https://picsum.photos/200/300", "Itaku"),
    Photo("https://picsum.photos/200/300", "Pola"),
    Photo("https://picsum.photos/200/300", "lalli"),
    Photo("https://picsum.photos/200/300", "Chandllra 1"),
    Photo("https://picsum.photos/200/300", "lai lai"),
    Photo("https://picsum.photos/200/300", "kuita"),
    Photo("https://picsum.photos/200/300", "julia"),
    Photo("https://picsum.photos/200/300", "looove"),
    Photo("https://picsum.photos/200/300", "asda"),
    Photo("https://picsum.photos/200/300", "test nama"),
    Photo("https://picsum.photos/200/300", "Jeni"),
    Photo("https://picsum.photos/200/300", "Lyuka"),
    Photo("https://picsum.photos/200/300", "Fann"),
    Photo("https://picsum.photos/200/300", "Weeessas"),
    Photo("https://picsum.photos/200/300", "CZ waa"),
    Photo("https://picsum.photos/200/300", "test nama 2"),
    Photo("https://picsum.photos/200/300", "apa ini nama"),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Photos'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0, crossAxisSpacing: 0, crossAxisCount: 3),
          itemCount: photos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageTwo(
                            image: photos[index].image,
                            name: photos[index].name)));
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(photos[index].image))),
              ),
            );
          }),
    );
  }
}

class PageTwo extends StatelessWidget {
  final String image;
  final String name;

  const PageTwo({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(

        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: Image(
                image: NetworkImage(image),
              ),
            ),
          ),
          Container(margin: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(name, style:const  TextStyle(fontSize: 40, color: Colors.black),),
          ),
          )
        ],
      ),
    );
  }
}
