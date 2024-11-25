import 'package:flutter/material.dart';
import 'package:ozcoffee/models/menu.dart';
import 'package:ozcoffee/ui/views/cart/cart_view.dart';
import 'package:ozcoffee/ui/views/cart/cart_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DetailsView extends StatefulWidget {
  final Menu menu;

  const DetailsView({super.key, required this.menu});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int quantity = 1;
  bool isAddedToCart = false;
  String cartMessage = '';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),
      onViewModelReady: (model) => model.loadCartFromDevice(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.menu.name),
        ),
        body: Column(
          children: [
            Hero(
              tag: widget.menu.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.menu.imagePath,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.menu.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.menu.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Quantity:",
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                }
                              });
                            },
                          ),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (cartMessage.isNotEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    cartMessage,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF056780),
                    ),
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.menu.price} BD',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!isAddedToCart) {
                        model.addMultipleItemsToCart(widget.menu, quantity);
                        setState(() {
                          isAddedToCart = true;
                          cartMessage = 'Items added to cart';
                        });
                        Future.delayed(const Duration(seconds: 1), () {
                          if (mounted) {
                            setState(() {
                              cartMessage = '';
                            });
                          }
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartView(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 170, 170, 170),
                      foregroundColor: const Color(0xFF056780),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(isAddedToCart ? 'View Cart' : 'Add to Cart'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
