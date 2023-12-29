import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shikha_demo1/utils/my_toast.dart';
class SignupScreen extends StatefulWidget {
   SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final List<String> items = ['Select', 'Male', 'Female', 'Other'];
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobNoController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController eMailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();
  String selectedValue = "Select";
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateTimeController.text=DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  _showMyDialog(BuildContext context){
    return showDialog(
      context: context,

        builder: (ctx) => AlertDialog(
backgroundColor: Colors.blue,
          title: const Text("Details",style: TextStyle(color: Colors.white),),
          content:  Container(
            height: 130,
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("First Name: ${firstNameController.text}",style: TextStyle(color: Colors.white),),
                  Text("Last Name:  ${lastNameController.text}",style: TextStyle(color: Colors.white),),
                  Text("Mobile No:  ${mobNoController.text}",style: TextStyle(color: Colors.white),),
                  Text("DOB:  ${dobController.text}",style: TextStyle(color: Colors.white),),
                  Text("EMAIL:  ${eMailController.text}",style: TextStyle(color: Colors.white),),
                  Text("Password:  ${passwordController.text}",style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0), // Set the radius here
                      ),
                      padding: const EdgeInsets.only(left:10,right: 10,top: 2,bottom: 2),
                      child: const Text("Cancel",style: TextStyle(color: Colors.red),),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      MyToast().toast("Your details have been successfully registered.");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0), // Set the radius here
                      ),

                      padding: const EdgeInsets.only(left:10,right: 10,top: 2,bottom: 2),
                      child: const Text("Submit",style: TextStyle(color: Colors.green),),
                    ),
                  ),
                ),

              ],
            ),


          ],
        ),
    );
  }

  @override
  void initState() {
    super.initState();
    dateTimeController.text=DateFormat('dd-MMM-yyyy').format(selectedDate);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              color: Colors.blue,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            "assests/images/abc.jpg",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                  const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Register ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            Expanded(
                                child: Text(
                              "Create Account!",
                              style: TextStyle(color: Colors.black, fontSize: 16.0),
                            )),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                       TextField(
                        controller: firstNameController,
                        decoration: const InputDecoration(
                            hintText: "First Name",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                       TextField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                            hintText: "Last Name",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                       TextField(
                        controller: mobNoController,
                        decoration: const InputDecoration(
                            hintText: "Mobile Number",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: TextField(
                          controller: dateTimeController,
                          enabled: false,
                          decoration: const InputDecoration(
                              hintText: "Date Of Birth",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                       TextField(
                        controller: eMailController,
                        decoration: const InputDecoration(
                            hintText: "Email/Username",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black54, // Border color
                            width: 2.0, // Border width
                          ), // Container background color
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the radius as needed
                        ),
                        child: DropdownButton<String>(
                          value: selectedValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 0,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (newValue) {
                            selectedValue = newValue!;
                            setState(() {});
                          },
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),

                      /*const TextField(decoration: InputDecoration(
                          hintText: "Gender",
                          border:OutlineInputBorder()
                      ),),*/
                      const SizedBox(
                        height: 20.0,
                      ),
                       TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            hintText: "Password",
                            suffixIcon: Icon(Icons.visibility_off),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                       TextField(
                        controller: conPasswordController,
                        decoration: const InputDecoration(
                            hintText: "Confirm Password",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () {

                            // validation(context);
                            // MyToast().toast("example toast");
                           _showMyDialog(context);
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "Already have an account? Login",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  validation(BuildContext context){
    if(firstNameController.text.isEmpty){
      MyToast().toast("Enter First Name!");
    }else if(selectedValue=="Select"){
      MyToast().toast("Select gender!");
    }else if(lastNameController.text.isEmpty){
      MyToast().toast("Enter Last Name");
    }else if(mobNoController.text.length!=10){
      MyToast().toast("Enter Valid Number");
    }else if(eMailController.text.isEmpty){
      MyToast().toast("Enter Valid EMAIL");
    }else if(passwordController.text.isEmpty){
      MyToast().toast("Enter Password");
    }else if(conPasswordController.text.isEmpty){
      MyToast().toast("Enter Confirm Password");
    }else if(passwordController.text!=conPasswordController.text){
      MyToast().toast("Password and confirm password should be same");
    }else{
      _showMyDialog(context);
    }
  }

}
