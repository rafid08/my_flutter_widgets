///[ImageLoader] is a simple Image.network but with a shimmer loading effect.
///It requires [Shimmer] package.
///It also has a fade transition when image is loaded


class ImageLoader extends StatelessWidget {
  const ImageLoader({
    Key key,
    @required this.image,
    this.onTap,
    this.borderRadius=BorderRadius.zero,
    this.single=false,
  }) : super(key: key);

  final String image;
  final BorderRadius borderRadius;
  final bool single;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        single ? Positioned.fill(child: Image.network(image, fit: BoxFit.cover)) : Positioned.fill(
          child: Container(
            height: double.infinity,
            child: Image.network(
              image,
              fit: BoxFit.cover,
              loadingBuilder: (context, widget, event){
                return ClipRRect(
                  borderRadius: borderRadius,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: event==null ? widget : Shimmer.fromColors(
                        period: Duration(milliseconds: 1000),
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.grey.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Icon(Icons.image_outlined,),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned.fill(
          child: new Material(
            color: Colors.transparent,
            child: new InkWell(
              onTap: onTap!=null?()=>onTap(image):null,
            ),
          ),
        ),
      ],
    );
  }
}
