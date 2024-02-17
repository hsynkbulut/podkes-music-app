import "package:flutter/material.dart";

class LibraryTiles extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final bool? pinned;
  final bool? artist;
  const LibraryTiles(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.pinned,
      this.artist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            if (artist == true)
              CircleAvatar(
                radius: 33,
                backgroundImage: NetworkImage(image),
              ),
            if (artist == null)
              SizedBox(
                height: 65,
                width: 65,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 235),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: pinned == true
                            ? Theme.of(context).highlightColor
                            : Colors.white),
                  ),
                ),
                Row(
                  children: [
                    if (pinned == true)
                      Icon(
                        Icons.pin,
                        color: Theme.of(context).highlightColor,
                        size: 14,
                      ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
