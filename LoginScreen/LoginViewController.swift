//
//  ViewController.swift
//  LoginScreen
//
//  Created by Tringapps on 17/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
	
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var topBackground: UIView!
    @IBOutlet weak var loginBackground: UIView!
    @IBOutlet weak var errorTextView: UILabel!
	@IBOutlet weak var scrollView: UIScrollView!

	override func viewWillAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		userNameField.text = nil
		passwordField.text = ""
		errorTextView.text = ""
		errorTextView.isHidden = true
		userNameField.setBottomBorder(withColor: Colors.DARK_BLUE.cgColor)
		passwordField.setBottomBorder(withColor: Colors.DARK_BLUE.cgColor)
		applyPasswordFieldDisabledDesign()
		print("Login View Will Appear")
	}

	override func viewDidAppear(_ animated: Bool){
		super.viewDidAppear(animated)
		print("Login Screen Appeared")
	}
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		print("Login View Loaded")
        appplyTopBackground();
        applyScrollableLoginBackgroundDesign();
        applyButtonsDesign();
        applyTextFieldsDesign();
        applyPasswordFieldDisabledDesign();

		setKeyboardNotificationListeners();

		setDelegates()

    }

	private func setKeyboardNotificationListeners() {
		NotificationCenter.default.addObserver(self, selector: #selector(moveScrollViewUp(notification:)), name: UIResponder.keyboardWillHideNotification , object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(moveScrollViewUp(notification:)), name: UIResponder.keyboardWillChangeFrameNotification , object: nil)
	}

	private func setDelegates() {
		userNameField.delegate = self
		passwordField.delegate = self
	}

	@objc private func moveScrollViewUp(notification: Notification) {
		print("View Will Be Scrolled Up")

		guard let keyboardScreenEndFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
			print("Nothing has been changed")
			return

		}
		let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
		if(notification.name == UIResponder.keyboardWillHideNotification){
			scrollView.contentInset = UIEdgeInsets.zero
			print("Scrolled Back To Normal")
		} else {
			print("Scrolling Above The Keyboard Height")
			scrollView.contentInset = UIEdgeInsets(top: CGFloat.zero, left: CGFloat.zero, bottom: keyboardViewEndFrame.height, right: CGFloat.zero)
		}
	}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touches Happening Outside TextField")
        view.endEditing(true)
	}

	@IBAction func onUserNameChange(_ sender: UITextField) {
		let enteredUsername = userNameField.text!
		let isValid = LoginFormValidation.isUserNameValid(enteredUserName: enteredUsername)
		if(isValid == nil){
			passwordField.isEnabled = true
		} else {
			passwordField.isEnabled = false
		}
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
			userNameField.setBottomBorder(withColor: Colors.DARK_BLUE.cgColor);
            errorTextView.isHidden = true
			passwordField.isEnabled = true;
			passwordField.layer.sublayers?.removeFirst()
			return true
		}
		userNameField.setBottomBorder(withColor: Colors.DARK_RED.cgColor);
        errorTextView.isHidden = false
		errorTextView.text! = userNameValidityStatusUnwrapped;
		applyPasswordFieldDisabledDesign();
		return false
    }

    private func isPasswordValid() -> Bool {
		let isPasswordValid = LoginFormValidation.setPasswordStrength(enteredPassword: passwordField, passwordStrengthIndicator: errorTextView)
		return isPasswordValid
    }


	private func applyScrollableLoginBackgroundDesign() {
		loginBackground.applyViewTheme()
		scrollView.applyViewTheme()
	}

	private func appplyTopBackground() {
		let radius:CGFloat = 40;
		topBackground.layer.cornerRadius = radius;
	}

	private func applyButtonsDesign() {
		loginButton.applyButtonTheme()
	}

	private func applyTextFieldsDesign(){
		userNameField.applyTextFieldTheme()
		passwordField.applyTextFieldTheme()
	}

	private func applyPasswordFieldDisabledDesign(){
		passwordField.isEnabled = false
		passwordField.layer.sublayers?.removeFirst()
		passwordField.setGradientBackground(startColor: Colors.LIGHT_GREY, endColor: Colors.LIGHT_GREY)
	}

    @IBAction func onClickLoginButton(_ sender: Any) {
		print("Login Button Has Been Clicked")
		let isAllFieldsValid:Bool = (isUserNameValid() && isPasswordValid());
		if(!isAllFieldsValid){return}
		let enteredUserName:String = userNameField.text!
		let enteredPassword:String = passwordField.text!
		let loginFormValidationStatus:Bool = LoginFormValidation.validateAllFilds(enteredUserName: enteredUserName, enteredPassword: enteredPassword)

		if(loginFormValidationStatus){
			print("User Authenticated")
			print("Performing Segue for Welcome Screen")

			let loginData = UserDefaults.standard
			UserDefaults.standard.synchronize();
			loginData.set(userNameField.text!, forKey: SavedVariables.LOGGED_IN_USERNAME.rawValue)
			loginData.synchronize()
			
			performSegue(withIdentifier: "WelcomeScreenSegueIdentifier", sender: nil)
			return
		}

		let wrongCredentialsAlert = AlertCreator.createAlert(title: "Try Again", message: "Account not Found Found", buttonTitle: "Ok")
		self.present(wrongCredentialsAlert, animated: true, completion: {self.errorTextView.isHidden = false;
			self.errorTextView.text! = LoginStatus.ACCOUNT_NOT_FOUND.rawValue
			self.errorTextView.textColor = Colors.DARK_RED
		})
	}
	
	@IBAction func onClickForgotPassword(_ sender: UIButton) {
		let forgorPasswordAlert = AlertCreator.createAlert(title: "ForgotPassword", message: "Work In Progress", buttonTitle: "Ok")
		self.present(forgorPasswordAlert, animated: true, completion: nil)
	}

	@IBAction func onClickSignupButton(_ sender: Any) {
		performSegue(withIdentifier: "RegistrationPageSegue", sender: self)
	}


	@IBAction func unwindToLoginViewController(_ unwindSegue: UIStoryboardSegue) {}
	deinit {
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
		print("LoginScreen is safe from Memory Leaks")
	}
}
