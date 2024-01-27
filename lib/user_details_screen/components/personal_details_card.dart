part of '../user_details_screen.dart';

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({
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
                "Personal Details",
                style: TextStyle(
                fontSize: 18,
                color: Colors.blue),
              ),
              const SizedBox(height: 8.0),
              LabelDesign(
                  label: "Name",
                  value: "${details!.firstName} ${details!.lastName}"),
              LabelDesign(
                  label: "Dob",
                  value:
                      " ${details!.birthDate!.year}-${details!.birthDate!.month}-${details!.birthDate!.day}"),
              LabelDesign(label: "Age", value: " ${details!.age}"),
              LabelDesign(
                  label: "Gender", value: " ${details!.gender}"),
              LabelDesign(
                  label: "Height", value: " ${details!.height}"),
              LabelDesign(
                  label: "Height", value: " ${details!.weight}"),
              LabelDesign(
                  label: "Blood", value: " ${details!.bloodGroup}"),
              LabelDesign(
                  label: "Eye Color", value: " ${details!.eyeColor}"),
              LabelDesign(
                  label: "Hiar",
                  value: " ${details!.hair!.color}  ${details!.hair!.type}"),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: LabelDesign(
                    label: "username", value: " ${details!.username}"),
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<UserDetailsCubit>(context)
                      .makeCall(details!.phone.toString());
                },
                child: LabelDesign(
                    label: "Phone", value: " ${details!.phone}"),
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<UserDetailsCubit>(context)
                      .openEmail(details!.email.toString());
                },
                child: LabelDesign(
                    label: "Email", value: " ${details!.email}"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LabelDesign extends StatelessWidget {
  final String label;
  final String value;

  const LabelDesign({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Wrap(
        children: <Widget>[
          SizedBox(
              width: 100,
              child: Text(label,
                  style:const TextStyle(
      fontSize: 15,
      color:  Colors.black))),
          Text(value,
              style:
                 TextStyle(fontSize: 13,
                 decoration:  label == "Phone" || label == "Email" ? TextDecoration.underline: TextDecoration.none,
                color: label == "Phone" || label == "Email" ? Colors.blue: Colors.grey)
                  ),
        ],
      ),
    );
  }
}
