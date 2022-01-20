class Pay {
  String img;
  String method;
  String type;
  Pay({required this.img, required this.method, required this.type});
}

List<Pay> methods = [
  Pay(
      img:
          "https://www.citypng.com/public/uploads/small/21635327389jq8fr7iazzsq6qlyoighskll8h5u6xkwg8ur6hfozelzyxsnqz0gnjtazyklwtmghol2fxpzle0efpmvu3tbsgwvrddqe7xiesub.png",
      method: "VISA",
      type: "**** **** **** 456"),
  Pay(
      img: "https://image.flaticon.com/icons/png/512/39/39022.png",
      method: "Paypal",
      type: "Reham@gmail.com"),
  Pay(
      img:
          "https://toppng.com/uploads/preview/mastercard-black-vector-logo-mastercard-logo-one-color-11563507809qwkm7jwfjp.png",
      method: "Master Card",
      type: "**** **** **** 456"),
];
