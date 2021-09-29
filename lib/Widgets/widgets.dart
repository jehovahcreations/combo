import 'package:combo_expert/Screen/constants.dart';
import 'package:flutter/material.dart';

// Widget otpField(BuildContext context){
//   return OTPTextField(
//   length: 5,
//   width: MediaQuery.of(context).size.width,
//   fieldWidth: 80,
//   style: TextStyle(
//     fontSize: 17
//   ),
//   textFieldAlignment: MainAxisAlignment.spaceAround,
//   fieldStyle: FieldStyle.underline,
//   onCompleted: (pin) {
//     print("Completed: " + pin);
//   },
// );
// }
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppBar myAppBar(
  BuildContext context,
  title,
  image,
) {
  return AppBar(
    leading: title != 'Home'
        ? InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 40,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        : null,
    title: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: 40,
          width: 40,
        ),
        SizedBox(
          width: 20,
        ),
        Text(title),
      ],
    ),
  );
}
String? finalname;
class MYBody extends StatefulWidget {
  const MYBody({ Key? key, required this.page, required this.name }) : super(key: key);
  final String page;
  final String name;

  @override
  _MYBodyState createState() => _MYBodyState();
}

class _MYBodyState extends State<MYBody> {
  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedname = sharedPreferences.getString('name');
    setState(() {
      finalname = obtainedname;
    });
    print(finalname);
  }
  @override
  Padding build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hello',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  TextSpan(
                    text: '$finalname',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(10),
                crossAxisCount: 2,
                // itemCount: categories.length,
                itemCount: 14,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        height: index.isEven ? 200 : 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            // image: AssetImage(categories[index].image),
                            image: AssetImage("images/CELogo.jpeg"),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(4, 4),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            // categories[index].name,
                            "First Text",
                            style: kTitleTextStyle,
                          ),
                          Text(
                            // 'Price: \$${categories[index].price}',
                            "Second Text",
                            style: TextStyle(
                              color: kTextColor.withOpacity(.5),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      );
  }
}



// Expanded image(img) {
//   return Expanded(
//     flex: 8,
//     child: Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.black,
//           width: 5,
//         ),
//         image: DecorationImage(
//           image: AssetImage(
//             img,
//           ),
//           fit: BoxFit.fill,
//         ),
//       ),
//     ),
//   );
// }

// Expanded texts(txt) {
//   return Expanded(
//     flex: 2,
//     child: Text(
//       txt,
//       style: TextStyle(color: Colors.black),
//     ),
//   );
// }

// bool firstvalue = false;

// Widget buildCheckbox() => Checkbox(
//     value: firstvalue,
//     onChanged: (value) {
//       // setState(() {
//       // firstvalue = value!;
//       // });
//     });
