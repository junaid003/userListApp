part of '../user_details_screen.dart';

class CompanyAddressCard extends StatelessWidget {
  const CompanyAddressCard({
    super.key,
    required this.screenWidth,
    this.details,
  });
  final UserList? details;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth < 600 ? double.infinity : 400.0,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                const Text(
                    "Company Address",
                    style: TextStyle(
                     fontSize: 18,
                     color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    details!.company!.name.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                    child: Text(
                      details!.company!.department.toString(),
                      style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey ),
                    ),
                  ),
                  Text(
                    details!.company!.address!.address.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                    child: Text(
                      details!.company!.address!.city.toString(),
                       style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey ),
                    ),
                  ),
                  Text(
                    details!.company!.address!.postalCode.toString(),
                     style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                    child: Text(
                      details!.company!.address!.state.toString(),
                      style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ));
  }
}
