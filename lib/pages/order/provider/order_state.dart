import '../../../models/add_product_model.dart';

enum OrderStatus { initial, loading, success, error }

class OrderState {
  final OrderStatus status;
  final AddProductModel? addProduct;

  OrderState({this.status = OrderStatus.initial, this.addProduct});

  factory OrderState.initial() => OrderState(status: OrderStatus.initial);

  OrderState copyWith({OrderStatus? status, AddProductModel? addProduct}) {
    return OrderState(
      status: status ?? this.status,
      addProduct: addProduct ?? this.addProduct,
    );
  }
}
