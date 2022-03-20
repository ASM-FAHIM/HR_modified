class ShopList{
  final int id;
  final String shop_name;
  final String shop_image;

  ShopList({
    required this.id,
    required this.shop_image,
    required this.shop_name,
  });


  static List<ShopList> shops = [
    ShopList(
        id: 1,
        shop_image: 'image 1',
        shop_name: 'Shop 1'
    ),
    ShopList(
        id: 2,
        shop_image: 'image 2',
        shop_name: 'Shop 2'
    ),
    ShopList(
        id: 3,
        shop_image: 'image 3',
        shop_name: 'Shop 3'
    ),
    ShopList(
        id: 4,
        shop_image: 'image 4',
        shop_name: 'Shop 4'
    ),
    ShopList(
        id: 5,
        shop_image: 'image 5',
        shop_name: 'Shop 5'
    ),
    ShopList(
        id: 6,
        shop_image: 'image 6',
        shop_name: 'Shop 6'
    ),
    ShopList(
        id: 7,
        shop_image: 'image 7',
        shop_name: 'Shop 7'
    ),
    ShopList(
        id: 8,
        shop_image: 'image 8',
        shop_name: 'Shop 8'
    ),
    ShopList(
        id: 9,
        shop_image: 'image 9',
        shop_name: 'Shop 9'
    ),
    ShopList(
        id: 10,
        shop_image: 'image 10',
        shop_name: 'Shop 10'
    ),
  ];

}