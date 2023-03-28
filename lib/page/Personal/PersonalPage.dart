import 'package:electronic_health_app/page/SignInPage.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16,0,0,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 60.0,
                          width: 60.0,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(40)),
                            child:Image.asset(
                              'assets/images/icons.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            'Trần Hoài Sơn',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton.icon( 
                        icon: const Icon(Icons.logout_outlined,color: Colors.white,),
                        label:const Text('',),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Đăng xuất'),
                            content: const Text('Bạn thật sự muốn đăng xuất tài khoản'),
                            actions: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context, 'Hủy bỏ',),
                                  child: const Text('Hủy bỏ',style: TextStyle(color: Colors.white),),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {Navigator.pushNamed(context,SignInPage.routeName);},
                                  child: const Text('Đăng xuất',style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 120.0,
                width: 120.0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child:Image.asset(
                    'assets/images/codeQR.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0,10,0,20),
                child: Text('Mã sổ sức khỏe', style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Container(
                      padding: const EdgeInsets.only(top:30),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,16,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  icon: const Icon(Icons.person,color: Colors.black,size: 30,),
                                  label:const Text(
                                    'Thông tin cá nhân',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: (){},
                                ),
                                const Icon(Icons.navigate_next,color: Colors.black,size: 30,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,0,0),
                            child: Container(
                              height: 2,
                              color: const Color.fromRGBO(90, 90, 90, 0.1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,16,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  icon: const Icon(Icons.people_alt,color: Colors.black,size: 30,),
                                  label:const Text(
                                    'Thành viên gia đình',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: (){},
                                ),
                                const Icon(Icons.navigate_next,color: Colors.black,size: 30,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,0,0),
                            child: Container(
                              height: 2,
                              color: const Color.fromRGBO(90, 90, 90, 0.1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,16,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  icon: const Icon(Icons.location_on_rounded,color: Colors.black,size: 30,),
                                  label:const Text(
                                    'Nơi đã đến',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: (){},
                                ),
                                const Icon(Icons.navigate_next,color: Colors.black,size: 30,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,0,0),
                            child: Container(
                              height: 2,
                              color: const Color.fromRGBO(90, 90, 90, 0.1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,16,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  icon: const Icon(Icons.calendar_month,color: Colors.black,size: 30,),
                                  label:const Text(
                                    'Lịch sử đặt khám',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: (){},
                                ),
                                const Icon(Icons.navigate_next,color: Colors.black,size: 30,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,0,0),
                            child: Container(
                              height: 2,
                              color: const Color.fromRGBO(90, 90, 90, 0.1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,16,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  icon: const Icon(Icons.library_books,color: Colors.black,size: 30,),
                                  label:const Text(
                                    'Hộ chiếu vắc-xin',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: (){},
                                ),
                                const Icon(Icons.navigate_next,color: Colors.black,size: 30,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,0,0),
                            child: Container(
                              height: 2,
                              color: const Color.fromRGBO(90, 90, 90, 0.1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,16,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  icon: const Icon(Icons.quiz,color: Colors.black,size: 30,),
                                  label:const Text(
                                    'Giới thiệu',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: (){},
                                ),
                                const Icon(Icons.navigate_next,color: Colors.black,size: 30,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,0,0),
                            child: Container(
                              height: 2,
                              color: const Color.fromRGBO(90, 90, 90, 0.1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,16,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  icon: const Icon(Icons.settings,color: Colors.black,size: 30,),
                                  label:const Text(
                                    'Cài đặt',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: (){},
                                ),
                                const Icon(Icons.navigate_next,color: Colors.black,size: 30,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,0,0),
                            child: Container(
                              height: 2,
                              color: const Color.fromRGBO(90, 90, 90, 0.1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,16,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  icon: const Icon(Icons.logout,color: Colors.black,size: 30,),
                                  label:const Text(
                                    'Đăng xuất',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Đăng xuất'),
                                      content: const Text('Bạn thật sự muốn đăng xuất tài khoản'),
                                      actions: <Widget>[
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                              textStyle: const TextStyle(fontSize: 20),
                                            ),
                                            onPressed: () => Navigator.pop(context, 'Hủy bỏ',),
                                            child: const Text('Hủy bỏ',style: TextStyle(color: Colors.white),),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.redAccent,
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                              textStyle: const TextStyle(fontSize: 20),
                                            ),
                                            onPressed: () {Navigator.pushNamed(context,SignInPage.routeName);},
                                            child: const Text('Đăng xuất',style: TextStyle(color: Colors.white),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Icon(Icons.navigate_next,color: Colors.black,size: 30,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,10,0,0),
                            child: Container(
                              height: 2,
                              color: const Color.fromRGBO(90, 90, 90, 0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )

      ),
    );
  }
}
