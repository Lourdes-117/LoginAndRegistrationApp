//
//  RegistrationPage1ClassViewController.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 25/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class RegistrationPage1ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    //Views
    @IBOutlet weak var topBackground: UIView!
    @IBOutlet weak var scrollableContentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    //InputFields
    @IBOutlet weak var textField_FirstName: UITextField!
    @IBOutlet weak var textField_LastName: UITextField!
    @IBOutlet weak var textField_DateOfBirth: UITextField!
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
    //DatePicker
    private var datePicker_DateOfBirth:UIDatePicker?

    private var registrationData: RegistrationData = RegistrationData.init();

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
        applyButtonsDesign()
        applyTextFieldsDesign()
        applyTextViewDesign()

        //DatePicker
        initializeDatePicker()

        setMaximumDateInDatePicker()

        //Applying Delegates
        setDelegates()

        textField_ConfirmPassword.isEnabled = false
        textField_ConfirmPassword.setGradientBackground(startColor: Colors.LIGHT_GREY, endColor: Colors.LIGHT_GREY)

        setKeyboardNotificationListeners()
    }

    private func initializeDatePicker(){
        datePicker_DateOfBirth = UIDatePicker()
        datePicker_DateOfBirth?.datePickerMode = .date
        datePicker_DateOfBirth?.addTarget(self, action: #selector(datechange(datepick:)), for: .valueChanged)
        textField_DateOfBirth.inputView = datePicker_DateOfBirth
    }

    @objc func  datechange(datepick:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        textField_DateOfBirth.text = formatter.string(from: datepick.date)
    }

    private func setDelegates(){
        textField_FirstName.delegate = self
        textField_LastName.delegate = self
        textField_EmailId.delegate = self
        textField_PhoneNumber.delegate = self
        textField_Password.delegate = self
        textField_ConfirmPassword.delegate = self
        textView_Address.delegate = self
    }

    private func setKeyboardNotificationListeners() {
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
        scrollableContentView.applyViewTheme()
        scrollView.applyViewTheme()
    }

    private func appplyTopBackground() {
        topBackground.layer.cornerRadius = 40;
    }

    private func applyButtonsDesign() {
        continueButton.applyButtonTheme()
    }

    private func applyTextFieldsDesign(){
        textField_FirstName.applyTextFieldTheme()
        textField_LastName.applyTextFieldTheme()
        textField_DateOfBirth.applyTextFieldTheme()
        textField_EmailId.applyTextFieldTheme()
        textField_PhoneNumber.applyTextFieldTheme()
        textField_Password.applyTextFieldTheme()
        textField_ConfirmPassword.applyTextFieldTheme()
    }

    private func applyTextViewDesign(){
        textView_Address.setBottomBorder(withColor: Colors.DARK_BLUE.cgColor)
        textView_Address.setBottomBorder(withColor: Colors.DARK_BLUE.cgColor)
    }

    private func setMaximumDateInDatePicker() {
        datePicker_DateOfBirth?.maximumDate = Date()
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
            textField_DateOfBirth.becomeFirstResponder()
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
        StatusSetter.setStatus(forLabel: error_Address, ofTextField:nil, ofTextView: textView_Address, validityStatus: isValid)
        return isValid;
    }

    private func checkFirstName() -> Bool {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_FirstName.text!, format: "([A-Za-z\\s]){1,}")
        StatusSetter.setStatus(forLabel: error_FirstName, ofTextField:textField_FirstName, ofTextView: nil, validityStatus: isValid)
        return isValid
    }

    private func checkLastName() -> Bool {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_LastName.text!, format: "([A-Za-z\\s]){1,}")
        StatusSetter.setStatus(forLabel: error_LastName, ofTextField:textField_LastName, ofTextView: nil, validityStatus: isValid)
        return isValid
    }

    private func checkEmailId() -> Bool {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_EmailId.text!, format: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        StatusSetter.setStatus(forLabel: error_EmailID, ofTextField:textField_EmailId, ofTextView: nil, validityStatus: isValid)
        return isValid
    }

    private func checkPhoneNumber() -> Bool {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_PhoneNumber.text!, format: "([0-9]){10}")
        StatusSetter.setStatus(forLabel: error_PhoneNumber, ofTextField:textField_PhoneNumber, ofTextView: nil, validityStatus: isValid)
        return isValid
    }

    private func checkPassWordStrength() -> Bool {
        let passwordStrength = LoginFormValidation.isPasswordValid(enteredPassword: textField_Password.text!)
        label_PasswordStrengthIndicator.isHidden = false
        guard let passwordStrengthUnwrapped = passwordStrength else {
            label_PasswordStrengthIndicator.text! = "PassWord Is Strong"
            label_PasswordStrengthIndicator.textColor = Colors.GREEN
            textField_Password.setBottomBorder(withColor: Colors.DARK_BLUE.cgColor)
            textField_ConfirmPassword.isEnabled = true
            textField_ConfirmPassword.layer.sublayers?.remove(at: 0);
            return true;
        }
        textField_ConfirmPassword.isEnabled = false
        textField_ConfirmPassword.layer.sublayers?.remove(at: 0);
        textField_ConfirmPassword.setGradientBackground(startColor: Colors.LIGHT_GREY, endColor: Colors.LIGHT_GREY)
        if(passwordStrengthUnwrapped == "⚠️ Password cannot be empty") {
            label_PasswordStrengthIndicator.textColor = Colors.RED
            textField_Password.setBottomBorder(withColor: Colors.RED.cgColor)
            label_PasswordStrengthIndicator.text! = passwordStrengthUnwrapped
        } else {
            label_PasswordStrengthIndicator.textColor = Colors.YELLOW
            textField_Password.setBottomBorder(withColor: Colors.YELLOW.cgColor)
            label_PasswordStrengthIndicator.text! = passwordStrengthUnwrapped
        }
        return false

    }

    private func checkConfirmPassword() -> Bool {
        if(textField_Password.text == ""){
            StatusSetter.setStatus(forLabel: error_ConfirmPassword, ofTextField:textField_ConfirmPassword, ofTextView: nil, validityStatus: false)
            error_ConfirmPassword.isHidden = true
            return false
        }
        if(textField_Password.text! == textField_ConfirmPassword.text!) {
            StatusSetter.setStatus(forLabel: error_ConfirmPassword, ofTextField:textField_ConfirmPassword, ofTextView: nil, validityStatus: true)
            error_ConfirmPassword.text! = RegistrationStatus.PASSWORD_MATCH.rawValue
            return true
        } else {
            StatusSetter.setStatus(forLabel: error_ConfirmPassword, ofTextField:textField_ConfirmPassword, ofTextView: nil, validityStatus: false)
            error_ConfirmPassword.text! = RegistrationStatus.PASSWORD_MISMATCH.rawValue
            return false
        }
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
        guard let registrationPage2 = segue.destination as? RegistrationPage2ViewController else {
            print("Invalid Segue to Registration Page 2")
            return;
        }
        registrationData.firstName = textField_FirstName.text
        registrationData.lastName = textField_LastName.text
        registrationData.dob = textField_DateOfBirth.text
        registrationData.emailID = textField_EmailId.text
        registrationData.phoneNumber = textField_EmailId.text
        registrationData.password = textField_Password.text
        registrationData.address = textView_Address.text

        registrationPage2.registrationData = self.registrationData

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
