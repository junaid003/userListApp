part of '../user_details_screen.dart';

class AddressViewCard extends StatelessWidget {
  const AddressViewCard({
    super.key,
    required this.screenWidth,
    this.details,
  });
  final UserList? details;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Card(
        elevation: 5, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  Text(
                "Address",
                style:  TextStyle(
                fontSize: 18,
                color: Colors.black )
              ),
              const SizedBox(height: 8.0),
              Text(
                details!.address!.address.toString(),
                style:const  TextStyle(
                fontSize: 16,
                color: Colors.grey )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                child: Text(
                  details!.address!.city.toString(),
                  style:const  TextStyle(
                  fontSize: 16,
                  color: Colors.grey )
                ),
              ),
              Text(
                details!.address!.postalCode.toString(),
                style:const TextStyle(
                fontSize: 16,
                color: Colors.grey )
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Text(
                    details!.address!.state.toString(),
                    style:const TextStyle(
                    fontSize: 16,
                    color: Colors.grey )
                  )),
             
            ],
          ),
        ),
      ),
    );
  }
}
