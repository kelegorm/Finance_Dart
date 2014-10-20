import 'dart:html';
import 'dart:convert';

import 'package:polymer/polymer.dart';

import 'package:paper_elements/paper_input.dart';
import 'package:paper_elements/paper_toast.dart';

@CustomTag('signin-form')
class SigninForm extends PolymerElement {

  @observable
  String email = '';

  @observable
  String password = '';

  FormElement elForm;
  PaperInput emailInput;
  PaperInput passwordInput;
  PaperToast messageDisplay;


  //------------------------
  //  C O N S T R U C T O R
  //------------------------

  SigninForm.created() : super.created() {
    elForm = $['form'];
    emailInput = $['emailInput'];
    passwordInput = $['passwordInput'];
//    messageDisplay = $['messageDisplay'];
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
      FormData formData = new FormData();
      formData.append('email', email);
      formData.append('password', password);
      HttpRequest.request('/signin', method: 'POST', sendData: formData)
      .then((HttpRequest request) {
        window.location.href = '/app';
      })
      .catchError(_catchHttpErrors)
      .catchError(_catchErrors);
    }
  }

  void _catchHttpErrors(Event event) {
    HttpRequest request = event.target as HttpRequest;
    if (request == null) {
      throw event;
    }

    if (request.status > 0) {
      _showMessage(request.responseText);
    } else {
      _showMessage('Connection error');
    }
  }

  void _catchErrors(Event event) {
    print(event);
  }

  void _showMessage(String message) {
    if (messageDisplay != null) {
      messageDisplay.remove();
    }

    messageDisplay = new PaperToast();
    messageDisplay.text = message;
    messageDisplay.show();
    shadowRoot.children.add(messageDisplay);

    print(message);
  }
}