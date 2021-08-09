///[ImageGrid] is grid of images that uses array of string array.
///Every string array requires [0-6] image links
///Summing them up, a beautiful image grid will be created.


class ImageGrid extends StatelessWidget {
  const ImageGrid({Key key, this.onTap, @required this.images}) : super(key: key);
  final ValueChanged<String> onTap;
  final List<List<String>> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(images.length, (i) {
        if(images[i].length==1) return _one(i);
        if(images[i].length==2) return _two(i);
        if(images[i].length==3) return _three(i);
        if(images[i].length==4) return _four(i);
        if(images[i].length==5) return _five(i);
        if(images[i].length==6) return _six(i);
        return Container();
      }),
    );
  }

  Widget _one(int i){
    return ImageLoader(
      image: images[i][0],
      onTap: onTap,
    );
  }

  Widget _two(int i){
    return AspectRatio(
      aspectRatio: 2,
      child: IntrinsicHeight(
        child: Row(
          children: List.generate(2, (index) => AspectRatio(
            aspectRatio: 1,
            child: ImageLoader(
              image: images[i][index],
              onTap: onTap,
            ),
          )),
        ),
      ),
    );
  }

  Widget _three(int i){
    return AspectRatio(
      aspectRatio: 1.5,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ImageLoader(
                image: images[i][0],
                onTap: onTap,
              ),
            ),
            Expanded(
              child: Column(
                children: List.generate(2, (index) => Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ImageLoader(
                      image: images[i][index+1],
                      onTap: onTap,
                    ),
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _four(int i){
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: List.generate(2, (index) => AspectRatio(
                aspectRatio: 1,
                child: ImageLoader(
                  image: images[i][index],
                  onTap: onTap,
                ),
              )),
            ),
          ),
          Expanded(
            child: Row(
              children: List.generate(2, (index) => AspectRatio(
                aspectRatio: 1,
                child: ImageLoader(
                  image: images[i][index+2],
                  onTap: onTap,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _five(int i){
    return AspectRatio(
      aspectRatio: 1.2,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: List.generate(2, (index) => AspectRatio(
                aspectRatio: 1,
                child: ImageLoader(
                  image: images[i][index],
                  onTap: onTap,
                ),
              )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: List.generate(3, (index) => AspectRatio(
                aspectRatio: 1,
                child: ImageLoader(
                  image: images[i][index+2],
                  onTap: onTap,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _six(int i){
    return AspectRatio(
      aspectRatio: 1.5,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: List.generate(3, (index) => AspectRatio(
                aspectRatio: 1,
                child: ImageLoader(
                  image: images[i][index],
                  onTap: onTap,
                ),
              )),
            ),
          ),
          Expanded(
            child: Row(
              children: List.generate(3, (index) => AspectRatio(
                aspectRatio: 1,
                child: ImageLoader(
                  image: images[i][index+3],
                  onTap: onTap,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}