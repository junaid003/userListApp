part of '../user_details_screen.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({
    super.key,
    required this.screenWidth,
    this.details,
  });
  final UserList? details;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      width: screenWidth < 600 ? double.infinity : 400.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.0), 
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 4,
        offset: const Offset(0, 2), 
      ),
    ],
  ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0),
            child:  Text('Card Details',  style:   TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(details!.bank!.cardNumber.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
           )),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Card Expire', style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,)),
                Text(details!.bank!.cardExpire.toString(),
                    style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                   )),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Card Type', style: TextStyle(
    color: Colors.black,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
  )  ),
                Text(details!.bank!.cardType.toString(),
                    style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                )),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Iban', style:   TextStyle(
                   color: Colors.black,
                   fontSize: 15.0,
                   fontWeight: FontWeight.w500,
                     )),
                
                  Text(details!.bank!.iban.toString(),
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                       )),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Currency', style:  TextStyle(
                   color: Colors.black,
                   fontSize: 15.0,
                   fontWeight: FontWeight.w500,
                     )),
                Text(details!.bank!.currency.toString(),
                    style:const TextStyle(
                  color: Colors.grey,
                    fontSize: 12.0,
  )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
