import 'package:flutter/material.dart';
import 'package:pmsn20232/models/popular_model.dart';
import 'package:pmsn20232/network/api_popular.dart';
import 'package:pmsn20232/widgets/item_movie_widget.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {

  ApiPopular? apiPopular;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiPopular = ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popular Movies'),),
      body: FutureBuilder(
        future: apiPopular!.getAllPopular(),
      builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
          if( snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return itemMovieWidget(snapshot.data![index]);
              },
            );
          }else{
            if( snapshot.hasError){
              return Center(child: Text('Algo salió mal :()'));
            }else{
              return CircularProgressIndicator();
            }
          }
        },
      ),
    );
  }
}