//
//  ViewController.swift
//  LoginScreen
//
//  Created by Tringapps on 17/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var topBackground: UIView!
    @IBOutlet weak var loginBackground: UIView!
    @IBOutlet weak var errorTextView: UILabel!

	override func viewWillAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: false)
		print("Login View Will Appear")
	}

	override func viewDidAppear(_ animated: Bool){
		super.viewDidAppear(animated)
		print("Login Screen Appeared")
	}
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.setNavigationBarHidden(false, animated: true)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField.delegate = self
        passwordField.delegate = self
        appplyTopBackground();
        applyLoginBackgroundDesign();
        applyLoginButtonDesign();
        applyTextFieldsDesign();
        applyPasswordFieldDisabledDesign();
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touches Happening Outside TextField")
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return called")
        if(textField == self.userNameField) {
            //If it is UserName field
            print("UserName Field Return key")
            if(isUserNameValid()) {
                passwordField.becomeFirstResponder()
                return true
            }
            else {return false}
        } else if (textField == self.passwordField) {
            //If it is Password Field
            print("Password Field Return Key")
            if(isPasswordValid()) {
                onClickLoginButton(passwordField!)
                return true
            }
            else {return false}
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField == self.userNameField) {
            //Checking UserName
			if(isUserNameValid()) {
				print("UserName is Valid")
			}

        } else if (textField == self.passwordField) {
            //Checking Password
			if(isPasswordValid()) {
				print("Password is Valid")
			}
        }
    }

    private func isUserNameValid() -> Bool {
        print("UserName Field has ended")
        let enteredUsername: String = userNameField.text!
        let userNameValidityStatus:String? = LoginFormValidation.isUserNameValid(enteredUserName: enteredUsername)
		guard let userNameValidityStatusUnwrapped = userNameValidityStatus else {
			//UserName is Valid
			userNameField.setBottomBorder(withColor: Colors.darkBlue.cgColor);
            errorTextView.isHidden = true
			passwordField.isEnabled = true;
			passwordField.layer.sublayers?.remove(at: 0);
			return true
		}
		userNameField.setBottomBorder(withColor: Colors.darkRed.cgColor);
        errorTextView.isHidden = true
		errorTextView.text! = userNameValidityStatusUnwrapped;
		applyPasswordFieldDisabledDesign();
		return false
    }

    private func isPasswordValid() -> Bool {
        print("PassWord Field has ended")
        let enteredPassword: String = passwordField.text!
        let passwordValidityStatus:String? = LoginFormValidation.isPasswordValid(enteredPassword: enteredPassword)
		guard  let passwordValidityStatusUnwrapped = passwordValidityStatus else {
			//Password is Valid
			passwordField.setBottomBorder(withColor: Colors.darkBlue.cgColor)
			errorTextView.isHidden = true
			return true
		}
		//Password in Invalid
		passwordField.setBottomBorder(withColor: Colors.darkRed.cgColor)
        errorTextView.isHidden = false
		errorTextView.text! = passwordValidityStatusUnwrapped
		return false
    }


	private func applyLoginBackgroundDesign() {
		loginBackground.layer.cornerRadius = 15;
		loginBackground.layer.shadowColor = UIColor.black.cgColor;
		loginBackground.layer.shadowRadius = 5;
		loginBackground.layer.shadowOpacity = 0.5;
		loginBackground.layer.shadowOffset = CGSize(width: 2, height: 2)
	}

	private func appplyTopBackground() {
		topBackground.layer.cornerRadius = 40;	
	}

	private func applyLoginButtonDesign() {
		loginButton.layer.cornerRadius = (loginButton.frame.height/2)
		loginButton.setGradientBackground(startColor: Colors.darkBlue, endColor: Colors.lightBlue)
	}

	private func applyTextFieldsDesign(){
		userNameField.setBottomBorder(withColor: Colors.darkBlue.cgColor)
		passwordField.setBottomBorder(withColor: Colors.darkBlue.cgColor)
	}

	private func applyPasswordFieldDisabledDesign(){
		passwordField.isEnabled = false
		passwordField.layer.sublayers?.remove(at: 0)
		passwordField.setGradientBackground(startColor: Colors.lightGray, endColor: Colors.lightGray)
	}

    @IBAction func onClickLoginButton(_ sender: Any) {
    print("Login Button Has Been Clicked")
    let enteredUserName:String = userNameField.text!
    let enteredPassword:String = passwordField.text!
    let loginFormValidationStatus:String = LoginFormValidation.validateAllFilds(enteredUserName: enteredUserName, enteredPassword: enteredPassword)

		if(loginFormValidationStatus == enteredUserName){
			print("User Authenticated")
			errorTextView.isHidden = true

			let storyBoard = UIStoryboard(name: "Main", bundle:  nil)

			guard let welcomeScreen = storyBoard.instantiateViewController(withIdentifier : "WelcomeScreenIdentifier") as? WelcomeScreenClass else {
				print("Coldn't find the WelcmeScreen view controller")
				return
			}
			self.navigationController?.pushViewController(welcomeScreen, animated: true)
			print("Welcome Screen Pushed to Stack")
			return
		}

		if(loginFormValidationStatus == "⚠️ Account Not Found"){
			let wrongCredentialsAlert = AlertCreator.createAlert(title: "Try Again", message: "Account not Found Found", buttonTitle: "Ok")
			self.present(wrongCredentialsAlert, animated: true, completion: nil)
			errorTextView.isHidden = false
			errorTextView.text! = "⚠️ Account Not Found"
			return
		}

		let wrongCredentialsAlert = AlertCreator.createAlert(title: "Try Again", message: "Invalid Field(s) Found", buttonTitle: "Ok")
		self.present(wrongCredentialsAlert, animated: true, completion: nil)

        errorTextView.isHidden = false
		errorTextView.text = loginFormValidationStatus
	}

	@IBAction func onClickForgotPassword(_ sender: UIButton) {
		let forgorPasswordAlert = AlertCreator.createAlert(title: "ForgotPassword", message: "Work In Progress", buttonTitle: "Ok")
		self.present(forgorPasswordAlert, animated: true, completion: nil)
	}

    @IBAction func onClickSignupButton(_ sender: Any) {
		guard let registrationPage1 = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationPage1Identity") else {
			print("Cannot find RegistrationPage1 View Controller")
			return;
		}
		self.present(registrationPage1, animated: true, completion: nil)
    }
}
