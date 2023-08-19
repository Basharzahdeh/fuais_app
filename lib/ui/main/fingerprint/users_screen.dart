import 'package:flutter/material.dart';
import 'package:fuais_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool open = false;
  String _selectedStatus = 'متصل';
  List<String> _statusOptions = ['متصل', 'غير متصل'];

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<UsersProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('جميع الموظفين',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Consumer<UsersProvider>(
                builder: (context, value, child) => Expanded(
                      child: ListView.builder(
                        itemCount: value.listUser.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            setState(() {
                              open = !open;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 25),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 215, 215, 215),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                      '${value.listUser[index].userName}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                  subtitle: Text(
                                      '${value.listUser[index].userPosition}'),
                                  leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          '${value.listUser[index].imageUrl}')),
                                  trailing: Container(
                                    width: 105,
                                    child: DropdownButton<String>(
                                      value: _selectedStatus,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedStatus = newValue!;
                                        });
                                      },
                                      items: _statusOptions
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                value == 'متصل'
                                                    ? 'assets/images/green dot.png'
                                                    : 'assets/images/red dot.png',
                                                width: 10,
                                              ),
                                              SizedBox(width: 8),
                                              Text(value),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                if (open == true)
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 30),
                                        child: Text(
                                            'الدخول :  ${value.listUser[index].enterTime}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 50),
                                        child: Text(
                                            'الخروج : ${value.listUser[index].outTime} ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54)),
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
