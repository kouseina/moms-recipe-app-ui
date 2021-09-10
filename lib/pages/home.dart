import 'package:flutter/material.dart';
import 'package:mom_recipe/config/theme.dart';

class Home extends StatelessWidget {
  Widget header() {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/dummy/img_profile.png',
                width: 46,
                height: 46,
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Annie',
                  style: title.copyWith(fontSize: 18),
                ),
                Text(
                  'Ingin masak apa hari ini',
                  style: subtitle,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffF3F6F8),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/search.png',
                width: 18,
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: TextFormField(
                  style: search.copyWith(color: black1),
                  decoration: InputDecoration(
                    hintText: 'Cari Resep',
                    hintStyle: search,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget categories(Color bg, String imgUrl, String name) {
    return Padding(
      padding: const EdgeInsets.only(right: 37),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {},
        child: Column(
          children: [
            Container(
              width: 52,
              height: 52,
              margin: EdgeInsets.only(bottom: 4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.asset(
                imgUrl,
                width: 24,
              ),
            ),
            Text(
              name,
              style: subtitle.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget star(int active) {
    final children = <Widget>[];
    for (var i = 1; i <= 5; i++) {
      if (active <= 5 && active >= 0) {
        children.add(
          new Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Image.asset(
              i <= active
                  ? 'assets/icons/star_active.png'
                  : 'assets/icons/star.png',
              width: 12,
            ),
          ),
        );
      }
    }

    return new Row(
      children: children,
    );
  }

  Widget product({
    String time = '',
    String name = '',
    int rating = 0,
    String imgurl = 'assets/dummy/img_product_1.jpg',
    double width = 154,
  }) {
    return Container(
      width: width,
      height: 215,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imgurl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 18, right: 12, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
            colors: [
              Color(0xff8D8D8D).withOpacity(0),
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/clock.png',
                  width: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  time,
                  style: subtitle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: title.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                star(rating),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 48, left: 20, right: 20, bottom: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Categories',
                style: title,
              ),
              SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categories(Color(0xffFFF6EF),
                        'assets/icons/chicken_leg.png', 'Ayam'),
                    categories(Color(0xffECF5F3), 'assets/icons/broccoli.png',
                        'Sayur'),
                    categories(
                        Color(0xffEDF6FB), 'assets/icons/soup.png', 'Sup'),
                    categories(
                        Color(0xffEDECF5), 'assets/icons/grid.png', 'Lainnya'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Populer',
                style: title,
              ),
              SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    product(
                      imgurl: 'assets/dummy/img_product_1.jpg',
                      name: 'Nasi Goreng',
                      time: '10 min',
                      rating: 5,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    product(
                      imgurl: 'assets/dummy/img_product_2.jpg',
                      name: 'Roti Bakar',
                      time: '4 min',
                      rating: 4,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    product(
                      imgurl: 'assets/dummy/img_product_3.jpg',
                      name: 'Mie Goreng',
                      time: '5 min',
                      rating: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Rekomendasi',
                style: title,
              ),
              SizedBox(
                height: 12,
              ),
              Wrap(
                runSpacing: 12,
                spacing: 12,
                children: [
                  product(
                    imgurl: 'assets/dummy/img_product_1.jpg',
                    name: 'Nasi Goreng',
                    time: '10 min',
                    rating: 5,
                    width: MediaQuery.of(context).size.width / 2 - 26,
                  ),
                  product(
                    imgurl: 'assets/dummy/img_product_3.jpg',
                    name: 'Mie Goreng',
                    time: '5 min',
                    rating: 5,
                    width: MediaQuery.of(context).size.width / 2 - 26,
                  ),
                  product(
                    imgurl: 'assets/dummy/img_product_2.jpg',
                    name: 'Roti Bakar',
                    time: '4 min',
                    rating: 4,
                    width: MediaQuery.of(context).size.width / 2 - 26,
                  ),
                  product(
                    imgurl: 'assets/dummy/img_product_1.jpg',
                    name: 'Nasi Goreng',
                    time: '10 min',
                    rating: 5,
                    width: MediaQuery.of(context).size.width / 2 - 26,
                  ),
                  product(
                    imgurl: 'assets/dummy/img_product_3.jpg',
                    name: 'Mie Goreng',
                    time: '5 min',
                    rating: 5,
                    width: MediaQuery.of(context).size.width / 2 - 26,
                  ),
                  product(
                    imgurl: 'assets/dummy/img_product_2.jpg',
                    name: 'Roti Bakar',
                    time: '4 min',
                    rating: 4,
                    width: MediaQuery.of(context).size.width / 2 - 26,
                  ),
                  product(
                    imgurl: 'assets/dummy/img_product_1.jpg',
                    name: 'Nasi Goreng',
                    time: '10 min',
                    rating: 5,
                    width: MediaQuery.of(context).size.width / 2 - 26,
                  ),
                  product(
                    imgurl: 'assets/dummy/img_product_3.jpg',
                    name: 'Mie Goreng',
                    time: '5 min',
                    rating: 5,
                    width: MediaQuery.of(context).size.width / 2 - 26,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: title.copyWith(fontSize: 8),
        currentIndex: 0,
        fixedColor: primary,
        unselectedLabelStyle:
            subtitle.copyWith(fontSize: 8, color: Color(0xffB1B6BC)),
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/icons/home_active.png',
              width: 20,
            ),
            icon: Image.asset(
              'assets/icons/home.png',
              width: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/icons/recipe_active.png',
              width: 20,
            ),
            icon: Image.asset(
              'assets/icons/recipe.png',
              width: 20,
            ),
            label: 'Resep',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/icons/bookmark_active.png',
              width: 20,
            ),
            icon: Image.asset(
              'assets/icons/bookmark.png',
              width: 20,
            ),
            label: 'Tersimpan',
          ),
        ],
      ),
    );
  }
}
