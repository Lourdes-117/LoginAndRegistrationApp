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


    var validity_FirstName:Bool = false
    var validity_LastName:Bool = false
    var validity_EmailID:Bool = false
    var validity_PhoneNumber:Bool = false
    var validity_Password:Bool = false
    var validity_ConfirmPassword:Bool = false
    var validity_Address:Bool = false

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

        NotificationCenter.default.addObserver(self, selector: #selector(moveScrollViewUp(notification:)), name: UIResponder.keyboardWillHideNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveScrollViewUp(notification:)), name: UIResponder.keyboardWillChangeFrameNotification , object: nil)
    }

    @objc private func moveScrollViewUp(notification: Notification) {
        print("This will change the view")

        guard let keyboardScreenEndFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        if(notification.name == UIResponder.keyboardWillHideNotification){
            scrollView.contentInset = UIEdgeInsets.zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: CGFloat.zero, left: CGFloat.zero, bottom: keyboardViewEndFrame.height, right: CGFloat.zero)
        }
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

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return Called")
        if(textField == self.textField_FirstName && checkFirstName()) {
            textField_LastName.becomeFirstResponder()
        } else if(textField == self.textField_LastName && checkLastName()) {
            view.endEditing(true)
        } else if(textField == self.textField_EmailId && checkEmailId()){
            textField_PhoneNumber.becomeFirstResponder();
        } else if(textField == self.textField_PhoneNumber && checkPhoneNumber()){
            textField_Password.becomeFirstResponder();
        }else if(textField == self.textField_Password && checkPassWordStrength()){
            textField_ConfirmPassword.becomeFirstResponder();
        } else if(textField == self.textField_ConfirmPassword && checkConfirmPassword()){
            textView_Address.becomeFirstResponder();
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField Has Ended Editting")
        if(textField == self.textField_FirstName) {
            validity_FirstName = checkFirstName()
        } else if(textField == self.textField_LastName) {
            validity_LastName = checkLastName()
        } else if(textField == self.textField_EmailId) {
            validity_EmailID = checkEmailId()
        } else if(textField == self.textField_PhoneNumber) {
            validity_PhoneNumber = checkPhoneNumber()
        } else if(textField == self.textField_Password) {
            validity_Password = checkPassWordStrength()
        } else if(textField == self.textField_ConfirmPassword) {
            validity_ConfirmPassword = checkConfirmPassword()
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        validity_Address = checkAddress();
    }

    private func checkAddress() -> Bool {
        let isValid = textView_Address.text! != ""
        setStatus(forLabel: error_Address, ofTextField:nil, ofTextView: textView_Address, validityStatus: isValid)
        return isValid;
    }

    private func checkFirstName() -> Bool {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_FirstName.text!, format: "([A-Za-z\\s]){1,}")
        setStatus(forLabel: error_FirstName, ofTextField:textField_FirstName, ofTextView: nil, validityStatus: isValid)
        return isValid
    }

    private func checkLastName() -> Bool {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_LastName.text!, format: "([A-Za-z\\s]){1,}")
        setStatus(forLabel: error_LastName, ofTextField:textField_LastName, ofTextView: nil, validityStatus: isValid)
        return isValid
    }

    private func checkEmailId() -> Bool {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_EmailId.text!, format: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        setStatus(forLabel: error_EmailID, ofTextField:textField_EmailId, ofTextView: nil, validityStatus: isValid)
        return isValid
    }

    private func checkPhoneNumber() -> Bool {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_PhoneNumber.text!, format: "([0-9]){10}")
        setStatus(forLabel: error_PhoneNumber, ofTextField:textField_PhoneNumber, ofTextView: nil, validityStatus: isValid)
        return isValid
    }

    private func checkPassWordStrength() -> Bool {
        let passwordStrength = LoginFormValidation.isPasswordValid(enteredPassword: textField_Password.text!)
        label_PasswordStrengthIndicator.isHidden = false
        guard let passwordStrengthUnwrapped = passwordStrength else {
            label_PasswordStrengthIndicator.text! = "PassWord Is Strong"
            label_PasswordStrengthIndicator.textColor = Colors.Green
            textField_Password.setBottomBorder(withColor: Colors.darkBlue.cgColor)
            textField_ConfirmPassword.isEnabled = true
            textField_ConfirmPassword.layer.sublayers?.remove(at: 0);
            return true;
        }
        textField_ConfirmPassword.isEnabled = false
        textField_ConfirmPassword.layer.sublayers?.remove(at: 0);
        textField_ConfirmPassword.setGradientBackground(startColor: Colors.lightGray, endColor: Colors.lightGray)
        if(passwordStrengthUnwrapped == "⚠️ Password cannot be empty") {
            label_PasswordStrengthIndicator.textColor = Colors.Red
            textField_Password.setBottomBorder(withColor: Colors.Red.cgColor)
            label_PasswordStrengthIndicator.text! = passwordStrengthUnwrapped
        } else {
            label_PasswordStrengthIndicator.textColor = Colors.Yellow
            textField_Password.setBottomBorder(withColor: Colors.Yellow.cgColor)
            label_PasswordStrengthIndicator.text! = passwordStrengthUnwrapped
        }
        return false

    }

    private func checkConfirmPassword() -> Bool {
        if(textField_Password.text == ""){
            setStatus(forLabel: error_ConfirmPassword, ofTextField:textField_ConfirmPassword, ofTextView: nil, validityStatus: false)
            error_ConfirmPassword.isHidden = true
            return false
        }
        if(textField_Password.text! == textField_ConfirmPassword.text!) {
            setStatus(forLabel: error_ConfirmPassword, ofTextField:textField_ConfirmPassword, ofTextView: nil, validityStatus: true)
            error_ConfirmPassword.text! = "Password Match"
            return true
        } else {
            setStatus(forLabel: error_ConfirmPassword, ofTextField:textField_ConfirmPassword, ofTextView: nil, validityStatus: false)
            error_ConfirmPassword.text! = "Password Mismatch"
            return false
        }
    }

    private func setStatus(forLabel label:UILabel,ofTextField textField: UITextField?, ofTextView textView:UITextView?, validityStatus IsValid:Bool) {
        label.isHidden = false
        if(IsValid) {
            label.text! = "Valid"
            label.textColor = Colors.Green
            guard let textFieldUnwrapped = textField else {
                textView!.setBottomBorder(withColor: Colors.darkBlue.cgColor)
                return
            }
            textFieldUnwrapped.setBottomBorder(withColor: Colors.darkBlue.cgColor)
        } else {
            label.text! = "Invalid"
            label.textColor = Colors.Red
            guard let textFieldUnwrapped = textField else {
                textView!.setBottomBorder(withColor: Colors.Red.cgColor)
                return
            }
            textFieldUnwrapped.setBottomBorder(withColor: Colors.Red.cgColor)
        }
    }

    private func getDateFromDatePicker() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dateOfBorth = formatter.string(from: datePicker_Date.date)
        return dateOfBorth
    }

    @IBAction func onClickContinueButton(_ sender: Any) {

        print("Continue Button Has Been Clicked")
        validity_FirstName = checkFirstName()
        validity_LastName = checkLastName()
        validity_PhoneNumber = checkPhoneNumber()
        validity_Password = checkPassWordStrength()
        validity_ConfirmPassword = checkConfirmPassword()
        validity_Address = checkAddress()
        validity_EmailID = checkEmailId()

        print(validity_FirstName)
        print(validity_LastName)
        print(validity_PhoneNumber)
        print(validity_Password)
        print(validity_ConfirmPassword)
        print(validity_Address)
        print(validity_EmailID)

        let isAllValid = validity_FirstName && validity_LastName && validity_PhoneNumber && validity_Password && validity_ConfirmPassword && validity_Address && validity_EmailID

        if(isAllValid) {
            print("All Fields Are Valid")
            performSegue(withIdentifier: "registrationPage2Segue", sender: self)
        }
        
        let alert = AlertCreator.createAlert(title: "Invalid Input", message: "Please Check All Fields", buttonTitle: "Ok")
        self.present(alert, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        removeNotificationCenter()
        guard let registrationPage2 = segue.destination as? RegistrationPage2Class else {
            print("Invalid Segue to Registration Page 2")
            return;
        }
        let registrationData = RegistrationData.init(firstName: textField_FirstName.text!, lastName: textField_LastName.text!, dob: getDateFromDatePicker(), emailID: textField_EmailId.text!, phoneNumber: textField_PhoneNumber.text!, password: textField_Password.text!, address: textView_Address.text!, profileImage: nil, status: nil, aboutMe: nil)
        registrationPage2.registrationData = registrationData

    }

    @IBAction func onClickCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    private func removeNotificationCenter(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    deinit {
        removeNotificationCenter()
        print("Registration Page 1 is safe from memory leak")
    }
}
