import 'package:fl_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate(
                [_InfoPelicula(), _Overview(), CastCarrousel()]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black38,
            child: Text(
              'movie.title',
              style: TextStyle(fontSize: 16),
            )),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              'https://www.abc.es/media/peliculas/000/016/006/el-senor-de-los-anillos-el-retorno-del-rey-version-extendida-2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _InfoPelicula extends StatelessWidget {
  const _InfoPelicula({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(
                      'https://pics.filmaffinity.com/El_se_or_de_los_anillos_El_retorno_del_rey-164432989-large.jpg'),
                  height: 180,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Título',
                  style: Theme.of(context).textTheme.headline5,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '2002',
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: const [
                    Icon(Icons.star, size: 25, color: Colors.amber),
                    SizedBox(width: 5),
                    Text('movie.rate')
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Nostrud deserunt non sit mollit laboris laboris voluptate fugiat reprehenderit duis deserunt ea amet magna. Ex officia eiusmod consectetur sit ad velit fugiat commodo. Voluptate commodo dolor occaecat aliqua et aliquip sint anim aliqua nulla aute.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
