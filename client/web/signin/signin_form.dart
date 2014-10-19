import 'dart:html';

import 'package:polymer/polymer.dart';

import 'package:paper_elements/paper_input.dart';

@CustomTag('signin-form')
class SigninForm extends PolymerElement {

  @observable
  String email = 'wert';

  @observable
  String password = 'qqq';

  FormElement elForm;
  PaperInput emailInput;
  PaperInput passwordInput;


  //------------------------
  //  C O N S T R U C T O R
  //------------------------

  SigninForm.created() : super.created() {
    elForm = $['form'];
    emailInput = $['emailInput'];
    passwordInput = $['passwordInput'];
  }


  //------------------------------
  //  E V E N T   H A N D L E R S
  //------------------------------

  /**
   *  Click event handler for form's Submit Button
   */
  void submitButton_onClick(MouseEvent event) {
    _checkAndSendForm();
  }

  /**
   *  Submit event handler for Sign In Form
   */
  void form_onSubmit(Event event) {
    event.preventDefault();

    _checkAndSendForm();
  }


  //--------------------------------
  //  P R I V A T E   M E T H O D S
  //--------------------------------

  bool _checkAndSubmit() {
    return (emailInput.checkValidity() && passwordInput.checkValidity());
  }

  void _checkAndSendForm() {
    if (_checkAndSubmit() == true) {
      print('All right, sending...');
    }
  }
}