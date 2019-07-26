//
//  RegistrationPage1ClassViewController.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 25/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class RegistrationPage1Class: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    //Views
    @IBOutlet weak var topBackground: UIView!
    @IBOutlet weak var scrollableContentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    //InputFields
    @IBOutlet weak var textField_FirstName: UITextField!
    @IBOutlet weak var textField_LastName: UITextField!
    @IBOutlet weak var datePicker_Date: UIDatePicker!
    @IBOutlet weak var textField_EmailId: UITextField!
    @IBOutlet weak var textField_PhoneNumber: UITextField!
    @IBOutlet weak var textField_Password: UITextField!
    @IBOutlet weak var textField_ConfirmPassword: UITextField!
    @IBOutlet weak var textView_Address: UITextView!
    //Button
    @IBOutlet weak var continueButton: UIButton!
    //Labels
    @IBOutlet weak var error_FirstName: UILabel!
    @IBOutlet weak var error_LastName: UILabel!
    @IBOutlet weak var error_EmailID: UILabel!
    @IBOutlet weak var error_PhoneNumber: UILabel!
    @IBOutlet weak var label_PasswordStrengthIndicator: UILabel!
    @IBOutlet weak var error_ConfirmPassword: UILabel!
    @IBOutlet weak var error_Address: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Registration Page 1 view has been loaded")
        //Applying Designs
        applyScrollViewDesign()
        appplyTopBackground()
        applyContinueButtonDesign()
        applyTextFieldsDesign(to: textField_FirstName)
        applyTextFieldsDesign(to: textField_LastName)
        applyTextFieldsDesign(to: textField_EmailId)
        applyTextFieldsDesign(to: textField_PhoneNumber)
        applyTextFieldsDesign(to: textField_Password)
        applyTextFieldsDesign(to: textField_ConfirmPassword)
        applyTextViewDesign(to: textView_Address)

        setMaximumDateInDatePicker()

        //Applying Delegates
        textField_FirstName.delegate = self
        textField_LastName.delegate = self
        textField_EmailId.delegate = self
        textField_PhoneNumber.delegate = self
        textField_Password.delegate = self
        textField_ConfirmPassword.delegate = self
        textView_Address.delegate = self

        textField_ConfirmPassword.isEnabled = false
        textField_ConfirmPassword.setGradientBackground(startColor: Colors.lightGray, endColor: Colors.lightGray)

    }

    private func applyScrollViewDesign() {
        scrollableContentView.layer.cornerRadius = 15;
        scrollableContentView.layer.shadowColor = UIColor.black.cgColor;
        scrollableContentView.layer.shadowRadius = 5;
        scrollableContentView.layer.shadowOpacity = 0.5;
        scrollableContentView.layer.shadowOffset = CGSize(width: 2, height: 2)

        scrollView.layer.cornerRadius = 15;
        scrollView.layer.shadowColor = UIColor.black.cgColor;
        scrollView.layer.shadowRadius = 5;
        scrollView.layer.shadowOpacity = 0.5;
        scrollView.layer.shadowOffset = CGSize(width: 2, height: 2)
    }

    private func appplyTopBackground() {
        topBackground.layer.cornerRadius = 40;
    }

    private func applyContinueButtonDesign() {
        continueButton.layer.cornerRadius = (continueButton.frame.height/2)
        continueButton.setGradientBackground(startColor: Colors.darkBlue, endColor: Colors.lightBlue)
    }

    private func applyTextFieldsDesign(to textField: UITextField){
        textField.setBottomBorder(withColor: Colors.darkBlue.cgColor)
        textField.setBottomBorder(withColor: Colors.darkBlue.cgColor)
    }

    private func applyTextViewDesign(to textView: UITextView){
        textView.setBottomBorder(withColor: Colors.darkBlue.cgColor)
        textView.setBottomBorder(withColor: Colors.darkBlue.cgColor)
    }

    private func setMaximumDateInDatePicker() {
        datePicker_Date.maximumDate = Date()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touches Began Outside TextField")
        view.endEditing(true)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField Has Ended Editting")
        if(textField == self.textField_FirstName) {
            checkFirstName()
        } else if(textField == self.textField_LastName) {
            checkLastName()
        } else if(textField == self.textField_EmailId) {
            checkEmailId()
        } else if(textField == self.textField_PhoneNumber) {
            checkPhoneNumber()
        } else if(textField == self.textField_Password) {
            checkPassWordStrength()
        } else if(textField == self.textField_ConfirmPassword) {
            checkConfirmPassword()
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        let isValid = textView_Address.text! != ""
        setStatus(forLabel: error_Address, validityStatus: isValid)
    }

    private func checkFirstName() {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_FirstName.text!, format: "([A-Za-z\\s]){1,}")
        setStatus(forLabel: error_FirstName, validityStatus: isValid)
    }

    private func checkLastName() {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_LastName.text!, format: "([A-Za-z]){1,}")
        setStatus(forLabel: error_LastName, validityStatus: isValid)
    }

    private func checkEmailId() {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_EmailId.text!, format: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        setStatus(forLabel: error_EmailID, validityStatus: isValid)
    }

    private func checkPhoneNumber() {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_PhoneNumber.text!, format: "([0-9]){10}")
        setStatus(forLabel: error_PhoneNumber, validityStatus: isValid)
    }

    private func checkPassWordStrength() {
        let passwordStrength = LoginFormValidation.isPasswordValid(enteredPassword: textField_Password.text!)
        label_PasswordStrengthIndicator.isHidden = false
        guard let passwordStrengthUnwrapped = passwordStrength else {
            label_PasswordStrengthIndicator.text! = "PassWord Is Strong"
            label_PasswordStrengthIndicator.textColor = Colors.Green
            textField_ConfirmPassword.isEnabled = true
            textField_ConfirmPassword.layer.sublayers?.remove(at: 0);
            return;
        }
        textField_ConfirmPassword.isEnabled = false
        textField_ConfirmPassword.layer.sublayers?.remove(at: 0);
        textField_ConfirmPassword.setGradientBackground(startColor: Colors.lightGray, endColor: Colors.lightGray)
        if(passwordStrengthUnwrapped == "⚠️ Password cannot be empty") {
            label_PasswordStrengthIndicator.textColor = Colors.Red
            label_PasswordStrengthIndicator.text! = passwordStrengthUnwrapped
        } else {
            label_PasswordStrengthIndicator.textColor = Colors.Yellow
            label_PasswordStrengthIndicator.text! = passwordStrengthUnwrapped
        }

    }

    private func checkConfirmPassword() {
        if(textField_Password.text! == textField_ConfirmPassword.text!) {
            setStatus(forLabel: error_ConfirmPassword, validityStatus: true)
            error_ConfirmPassword.text! = "Password Match"
        } else {
            setStatus(forLabel: error_ConfirmPassword, validityStatus: false)
            error_ConfirmPassword.text! = "Password Mismatch"
        }
    }

    private func setStatus(forLabel label:UILabel, validityStatus IsValid:Bool) {
        label.isHidden = false
        if(IsValid) {
            label.text! = "Valid"
            label.textColor = Colors.Green
        } else {
            label.text! = "Invalid"
            label.textColor = Colors.Red
        }
    }
}
