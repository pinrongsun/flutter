import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(context) {
    final bloc = Provider.of(context);
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //alignment:Alignment.center,

                margin: EdgeInsets.only(top: 100, bottom: 100),
                child: Text('Logo here!'),
              )
            ],
          ),
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          //submitButton(bloc),
          Row(
            children: [
              submitButton(bloc),
              Container(
                margin: EdgeInsets.only(left: 20.0),
              ),
              new Text("Forgot your Password?",
                  style: new TextStyle(
                      fontSize: 17.0,
                      color: Color(0xFF18D191),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: new Text("Create A New Account ",
                      style: new TextStyle(
                          fontSize: 17.0,
                          color: Color(0xFF18D191),
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Address',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          //obscureText: true,
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          //obscureText: true,
          child: Text('Login'),
          color: Colors.blue,
          onPressed: snapshot.hasData
              ? () {
                  bloc.submit();
                }
              : null,
        );
      },
    );
  }
}
