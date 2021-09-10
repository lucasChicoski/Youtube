import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:youtube/model/video.dart';
import 'package:youtube/utils/api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controllers/bottom_navigation_controller.dart';

class HomePage extends StatelessWidget {
  _listarVideos(research) {
    API api = GetIt.I<API>();
    return api.pesquisar(research);
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationController bottomNavigationController =
        GetIt.I<BottomNavigationController>();
    return Observer(builder: (_) {
      return LayoutBuilder(
        builder: (context, mainConstraints) {
          print(mainConstraints.maxWidth);
          if (mainConstraints.maxWidth > 1024) {
            return FutureBuilder<List<Video>>(
                future: _listarVideos(bottomNavigationController.research),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        return Container(
                          child: GridView.builder(
                              itemCount: 50,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                              itemBuilder: (context, index) {
                                List<Video>? videos = snapshot.data;
                                Video video = videos![index];
                                return Column(
                                  children: [
                                    Card(
                                      elevation: 15,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    '${video.image}'),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                              title: AutoSizeText(
                                                video.title!,
                                                maxLines: 1,
                                                minFontSize: 1,
                                                maxFontSize: 14,
                                              ),
                                              subtitle: AutoSizeText(
                                                video.description!,
                                                maxLines: 4,
                                                minFontSize: 1,
                                                maxFontSize: 12,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        );
                      } else {
                        return Center(
                          child: Text("Acabou a cota da API do youtube."),
                        );
                      }
                  }
                });
          } else if (mainConstraints.maxWidth >= 250) {
            print("Entrou no celular");
            return FutureBuilder<List<Video>>(
              future: _listarVideos(bottomNavigationController
                  .research), //Método que irá retornar os videos pesquisados
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:

                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  case ConnectionState.active:

                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            List<Video>? videos = snapshot.data;
                            Video video = videos![index];
                            return GestureDetector(
                              onTap: () {
                                YoutubePlayer(
                                  controller: YoutubePlayerController(
                                      initialVideoId: video.id!),
                                );
                              },
                              child: Card(
                                elevation: 15,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage('${video.image}'),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(video.title!),
                                      subtitle: Text(video.description!),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 3,
                              color: Colors.grey,
                            );
                          },
                          itemCount: snapshot.data!.length);
                    } else {
                      return Center(
                        child: Text('Acabou a cota da API do youtube.'),
                      );
                    }
                }
              },
            );
          } else {
            return Container(); //Para largura menor ou igual que 280
          }
        },
      );
    });
  }
}
