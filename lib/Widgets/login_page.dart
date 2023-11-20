import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Result'),
          content: Column(
              children: [
                Text(_usernameController.text),
                Text(_passwordController.text),
              ]
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<AlertDialog> _loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      final UserCredential authResult =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Handle the user authentication result as needed
      return AlertDialog(
          title: const Text('Login Result'),
          content: Column(
              children: [
                Text('Google Sign-In Successful: ${authResult.user?.displayName}'),
              ]
          ),
      );
      //print('Google Sign-In Successful: ${authResult.user?.displayName}');
    } catch (error) {
      return AlertDialog(
        title: const Text('Login Result'),
        content: Column(
            children: [
              Text('Google Sign-In Error: $error'),
            ]
        ),
      );
    }
  }

  Future<void> _loginWithApple() async {
    try {
      final result = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final AuthCredential credential = OAuthProvider("apple.com").credential(
        accessToken: result.authorizationCode,
        idToken: result.identityToken,
      );

      final UserCredential authResult =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Handle the user authentication result as needed
      print('Apple Sign-In Successful: ${authResult.user?.displayName}');
    } catch (error) {
      print('Apple Sign-In Error: $error');
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers and focus nodes when the widget is disposed
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              focusNode: _usernameFocus,
              decoration: const InputDecoration(labelText: 'Username'),
              onSubmitted: (value) {
                // When the user submits the username field, move focus to the password field
                FocusScope.of(context).requestFocus(_passwordFocus);
              },
            ),
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              onSubmitted: (value) {
                // When the user submits the password field, you can trigger the login logic here
                // For simplicity, let's just show the dialog
                _showDialog('Login Successful');
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              ),
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                // You can add your authentication logic here
                // For simplicity, let's just check if both fields are non-empty
                if (username.isNotEmpty && password.isNotEmpty) {
                  _showDialog('Login Successful');
                } else {
                  _showDialog('Username and password are required');
                }
              },
              child: const Text('Login'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  0, 0, 0, 16),
              child: FloatingActionButton.extended(
                onPressed: () {
                  _loginWithGoogle();
                },
                label: const Text('Continue with Google'),
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  size: 20,
                ),
                splashColor: const Color(0xFFFF3E30),
                hoverColor: Colors.grey[200],
                elevation: 0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  0, 0, 0, 16),
              child: FloatingActionButton.extended(
                onPressed: () {
                  _loginWithApple();
                },
                label: const Text('Continue with Apple'),
                icon: const FaIcon(
                  FontAwesomeIcons.apple,
                  size: 20,
                ),
                splashColor:const Color(0xFF0066cc),
                hoverColor: Colors.grey[200],
                elevation: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  State<LoginScreenWidget> createState() => LoginScreenWidgetState();
}

class LoginScreenWidgetState extends State<LoginScreenWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();


  bool get isiOS => false;

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => LoginScreenModel());

    // _model.textController1 ??= TextEditingController();
    // _model.textFieldFocusNode1 ??= FocusNode();
    //
    // _model.textController2 ??= TextEditingController();
    // _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.blueGrey[50],
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.00, -1.00),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: const Text(
                        'Fantasy Weather',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white60,
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 24, 24, 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Welcome Back',
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 24),
                                child: Text(
                                  'Let\'s get started by filling out the form below.',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 16),
                                child: TextFormField(
                                  controller: _model.textController1,
                                  focusNode: _model.textFieldFocusNode1,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24, 24, 24, 24),
                                  ),
                                  validator: _usernameController.asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 16),
                                child: TextFormField(
                                  controller: _model.textController2,
                                  focusNode: _model.textFieldFocusNode2,
                                  obscureText: !_model.passwordVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24, 24, 24, 24),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => _model.passwordVisibility =
                                            !_model.passwordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 16),
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    //dummy Options
                                  },
                                  label: const Text('Sign In'),
                                ),
                              ),
                              const Align(
                                alignment:
                                    AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 24),
                                  child: Text(
                                    'Or sign up with',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 16),
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    //dummy Function;
                                  },
                                  label: const Text('Continue with Google'),
                                  icon: const FaIcon(
                                    FontAwesomeIcons.google,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 16),
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    //dummy function
                                  },
                                  label: const Text('Continue with Apple'),
                                  icon: const FaIcon(
                                    FontAwesomeIcons.apple,
                                    size: 20,
                                  ),
                                  splashColor:const Color(0xFF0066cc),
                                  hoverColor: Colors.grey,
                                  elevation: 0.5,
                                ),
                              ),
                              const Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 4),
                                    child: Text(
                                      'Don\'t have an account? ',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 4, 0, 4),
                                    child: Text(
                                      'Sign Up',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/
