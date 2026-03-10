import 'package:flutter/material.dart';




  Widget _numbers(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 71,
        height: 71,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
            strokeAlign: BorderSide.strokeAlignInside,
            width: 0.887,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            "$index",
            style: TextStyle(
              fontSize: 30.175,
              fontWeight: FontWeight.w800,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  } 
class Login extends StatelessWidget {
  Login({super.key});
  GlobalKey<FormState> password = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 120),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 28),
              alignment: Alignment.center,
              child: Icon(
                Icons.fingerprint,
                size: 70,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              "enter pin code or use fingerprint",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                color: Colors.black.withOpacity(0.5),
              ),
            ),

            Container(
              width: 284,
              height: 46,
              margin: EdgeInsets.symmetric(horizontal: 65, vertical: 38),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.03),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.02),
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  hint: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      ...List.generate(4, (val) {
                        return Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        );
                      }),
                    ],
                  ),
                  suffixIcon: Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Icon(Icons.backspace),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 65),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        mainAxisSpacing: 36,
                        crossAxisSpacing: 36,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return _numbers(index + 1);
                      },
                    ),
                    SizedBox(height: 36),
                    _numbers(0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 
}
