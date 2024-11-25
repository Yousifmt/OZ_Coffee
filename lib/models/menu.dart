class Menu {
  String name;
  String price;
  String imagePath;
  String description;
  String category;

  Menu(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.description,
      required this.category});

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _description => description;
  String get _category => category;
}

class MenuItems {
  static List<Menu> menuItem = [
    Menu(
      name: 'Latte',
      price: '2.100',
      imagePath: 'assets/latte.png',
      description:
          'A delightful blend of rich espresso and creamy steamed milk, topped with a light foam for a smooth, balanced taste. The perfect drink for coffee lovers who enjoy a mellow yet flavorful experience. Whether youre starting your day or taking a relaxing break, the Lattee is your ideal companion. Available in various sizes and customizable with your choice of milk or sweetener.',
      category: 'Hot Drinks',
    ),
    Menu(
      name: 'Cortado',
      price: '1.900',
      imagePath: 'assets/cortado.png',
      description:
          'A perfect balance of bold espresso and velvety steamed milk, the Cortado is a smooth, rich coffee that cuts the intensity of espresso with just a touch of milk. Served in a small glass, its the ideal choice for those who enjoy a strong coffee flavor without being overwhelmed. Whether youre looking for a quick pick-me-up or a sophisticated treat, the Cortado offers a refined coffee experience.',
      category: 'Hot Drinks',
    ),
    Menu(
      name: 'Flat White',
      price: '1.900',
      imagePath: 'assets/flatWhite.png',
      description:
          'A smooth and velvety coffee made with rich espresso and silky steamed milk, topped with a thin layer of microfoam. The Flat White offers a perfect balance between the strength of coffee and the creaminess of milk, making it a great choice for those who enjoy a coffee with a mellow, yet full-bodied taste. Ideal for any time of day, it’s a refined, satisfying drink thats not too strong, but still packed with flavor.',
      category: 'Hot Drinks',
    ),
    Menu(
      name: 'Iced Americano',
      price: '1.650',
      imagePath: 'assets/icedAmericano.png',
      description:
          'A refreshing and bold coffee made by diluting rich espresso with cold water and ice. The Iced Americano delivers the perfect balance of strength and smoothness, offering a crisp, chilled coffee experience. Ideal for hot days or when you want a cool, energizing boost without the creaminess of milk. Perfect for those who love the pure, bold taste of espresso, served cold.',
      category: 'cold Drinks',
    ),
    Menu(
      name: 'Iced latte',
      price: '1.900',
      imagePath: 'assets/icedLatte.png',
      description:
          'A chilled blend of rich espresso and creamy cold milk, served over ice for a refreshing, smooth coffee experience. The Iced Latte is the perfect balance of bold coffee flavor and smooth creaminess, ideal for warm days or when you’re looking for a cool, energizing drink. Customizable with your choice of milk or sweetener, it’s a versatile and refreshing choice for coffee lovers.',
      category: 'cold Drinks',
    ),
    Menu(
      name: 'Iced Rose Latte',
      price: '2.350',
      imagePath: 'assets/icedRoseLatte.png',
      description:
          'A refreshing twist on the classic iced latte, infused with the delicate floral notes of rose syrup. This iced drink combines smooth espresso and cold milk with the subtle sweetness and aroma of rose, creating a uniquely fragrant and refreshing experience. Perfect for those who enjoy a floral, flavorful coffee with a touch of elegance. Ideal for warm days or when youre looking for something a little more special.',
      category: 'cold Drinks',
    ),
    Menu(
      name: 'Lemon Cake',
      price: '1.250',
      imagePath: 'assets/lemonCake.png',
      description:
          'A zesty, moist cake bursting with fresh lemon flavor and a light, fluffy texture. Topped with a sweet and tangy lemon glaze, this cake offers the perfect balance of sweetness and citrusy brightness. Ideal for those who love a refreshing twist in their desserts, the Lemon Cake is a delightful treat for any occasion, from a casual snack to a special celebration.',
      category: 'Dessert',
    ),
    Menu(
      name: 'Acai Bowl',
      price: '3.900',
      imagePath: 'assets/acaiBowl.png',
      description:
          'A vibrant, nutritious bowl packed with the antioxidant-rich power of acai berries. Blended with frozen fruit and topped with granola, fresh berries, coconut flakes, and a drizzle of honey, the Acai Bowl offers a deliciously refreshing and energizing treat. Perfect for breakfast, a post-workout boost, or a healthy snack, it’s a flavorful way to nourish your body while satisfying your cravings.',
      category: 'Dessert',
    ),
    Menu(
      name: 'French Toast',
      price: '2.800',
      imagePath: 'assets/frenchToast.png',
      description:
          'Golden, crispy on the outside and soft on the inside, our French Toast is a breakfast classic made from thick slices of brioche soaked in a rich cinnamon-vanilla egg batter, then grilled to perfection. Served with a dusting of powdered sugar, a drizzle of maple syrup, and your choice of fresh berries or whipped cream, it’s the perfect sweet and indulgent start to your day.',
      category: 'Dessert',
    ),
  ];
}
