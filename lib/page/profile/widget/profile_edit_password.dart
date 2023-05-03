import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileEditPasswordPage extends StatefulWidget {
  const ProfileEditPasswordPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPasswordPage> createState() =>
      _ProfileEditPasswordPageState();
}

class _ProfileEditPasswordPageState extends State<ProfileEditPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;
    bool _isOldVisible = false;
  bool _isNewVisible = false;
  String _errorMessage = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('update password'),
        backgroundColor: Color.fromARGB(255, 244, 17, 17),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo_api.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (password) =>
                                        onPasswordChanged(password),
                                    obscureText: _isOldVisible,
                  controller: _currentPasswordController,
                  decoration: InputDecoration(
                    labelText: 'password anda saat ini',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isOldVisible = !_isOldVisible;
                                          });
                                        },
                                        icon: _isOldVisible
                                            ? const Icon(
                                                Icons.visibility,
                                                color: Colors.black,
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
          
                                      ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'masukan pasword anda saat ini.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (password) =>
                                        onPasswordChanged(password),
                                    obscureText: _isNewVisible,
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Password baru',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(Icons.lock),
                     suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isNewVisible = !_isNewVisible;
                                          });
                                        },
                                        icon: _isNewVisible
                                            ? const Icon(
                                                Icons.visibility,
                                                color: Colors.black,
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
          
                                      ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'tolong masukan password baru anda.';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (password) =>
                                        onPasswordChanged(password),
                                    obscureText: _isNewVisible,
                  controller: _confirmPasswordController,
                  
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(Icons.lock),
                     suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isNewVisible = !_isNewVisible;
                                          });
                                        },
                                        icon: _isNewVisible
                                            ? const Icon(
                                                Icons.visibility,
                                                color: Colors.black,
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
          
                                      ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your new password.';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleChangePassword,
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : Text('ubah password'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // warna latar belakang tombol
                    onPrimary: Colors.white, // warna teks pada tombol
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleChangePassword() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    if (_formKey.currentState!.validate()) {
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });
      // Show notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('password telah diganti.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 10),
        ),
      );
    }
  }
}


// class _ProfileEditPasswordPageState extends State<ProfileEditPasswordPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 255, 0, 0),
//           title: Text('Halaman Edit Kata Sandi'),
          
//         ),
//         body: Center(
//           child: Text('page Buat Ubah Password'),
//         ),
//     );
//   }
// }