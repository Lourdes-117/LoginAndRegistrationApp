//
//  RegistrationPage2Class.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 30/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class RegistrationPage2Class: UIViewController, UIImagePickerControllerDelegate, UITextViewDelegate, UITextFieldDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView_ProfilePicture: UIImageView!
    @IBOutlet weak var error_Status: UILabel!
    @IBOutlet weak var textView_AboutMe: UITextView!
    @IBOutlet weak var textField_Status: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollableContentView: UIView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var topBackground: UIView!
    @IBOutlet weak var error_AboutMe: UILabel!
    private var validity_Status = false
    private var validity_AboutMe = false
    private var validity_Image = false

    @IBOutlet weak var error_ProfilePicture: UILabel!
    public var registrationData:RegistrationData? = nil

    override func viewDidLoad() {
        print("Registration Page2 View has been Loaded")
        applyImageViewDesign();
        applyScrollViewDesign();
        appplyTopBackground();
        applyRegisterButtonDesign();
        applyTextFieldsDesign(to: textField_Status);
        applyTextViewDesign(to: textView_AboutMe)

        textView_AboutMe.delegate = self
        textField_Status.delegate = self

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

    private func applyImageViewDesign(){
        imageView_ProfilePicture.layer.cornerRadius = imageView_ProfilePicture.frame.height / 2
        imageView_ProfilePicture.clipsToBounds = true
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

    private func applyRegisterButtonDesign() {
        registerButton.layer.cornerRadius = (registerButton.frame.height/2)
        registerButton.setGradientBackground(startColor: Colors.darkBlue, endColor: Colors.lightBlue)
    }

    private func applyTextFieldsDesign(to textField: UITextField){
        textField.setBottomBorder(withColor: Colors.darkBlue.cgColor)
        textField.setBottomBorder(withColor: Colors.darkBlue.cgColor)
    }

    private func applyTextViewDesign(to textView: UITextView){
        textView.setBottomBorder(withColor: Colors.darkBlue.cgColor)
        textView.setBottomBorder(withColor: Colors.darkBlue.cgColor)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touches Began Outside TextField")
        view.endEditing(true)
    }

    @IBAction func onClickImportImageButton(_ sender: Any) {
        print("Import Image Button Clicked")
        importImage();
    }

    func importImage(){
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true){
            self.imageView_ProfilePicture.layer.borderColor = Colors.Green.cgColor
        self.error_ProfilePicture.isHidden = false
        self.error_ProfilePicture.textColor = Colors.Green
        self.error_ProfilePicture.text! = "Valid"
            print("Image Presented")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView_ProfilePicture.image = image
        } else {
            print("Invalid Image")
        }
        self.dismiss(animated: true, completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        validity_Status = checkStatus()
        if(validity_Status){
            textView_AboutMe.becomeFirstResponder();
        }
        return true;
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        validity_Status = checkStatus()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        validity_AboutMe = checkAboutMe()
    }

    private func checkProfilePicture() -> Bool {
        if(imageView_ProfilePicture.image == nil){
            print("No image found")
            imageView_ProfilePicture.layer.borderWidth = CGFloat.init(2.0)
            imageView_ProfilePicture.layer.borderColor = Colors.Red.cgColor
            error_ProfilePicture.isHidden = false
            error_ProfilePicture.textColor = Colors.Red
            error_ProfilePicture.text! = "Pleaes Upload a Picture"
            return false
        }
        error_ProfilePicture.isHidden = false
        error_ProfilePicture.textColor = Colors.Green
        error_ProfilePicture.text! = "Valid"
        imageView_ProfilePicture.layer.borderColor = Colors.Green.cgColor
        print("Image Found")
        return true
    }

    private func checkStatus() -> Bool {
        let isValid = FormatChecking.isValidFormat(textToCheck: textField_Status.text!, format: "([A-Za-z\\s]){1,}")
        setStatus(forLabel: error_Status, ofTextField:textField_Status, ofTextView: nil, validityStatus: isValid)
        return isValid
    }

    private func checkAboutMe() -> Bool {
        let isValid = textView_AboutMe.text! != ""
        setStatus(forLabel: error_AboutMe, ofTextField: nil, ofTextView: textView_AboutMe, validityStatus: isValid)
        return isValid;
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

    @IBAction func onClickPreviousButton(_ sender: Any) {
        removeNotificationCenter()
        self.dismiss(animated: true, completion: nil)
        print("Previous Button Clicked")
        
    }
    
    @IBAction func onClickRegisterButton(_ sender: Any) {
        validity_Image = checkProfilePicture()
        validity_Status = checkStatus()
        validity_AboutMe = checkAboutMe()
        
        if(validity_Status && validity_AboutMe && validity_Image){
            performSegue(withIdentifier: "registrationConfirmationSegue", sender: self)
        } else {
            let alert = AlertCreator.createAlert(title: "Invalid Input", message: "Please Check All Fields", buttonTitle: "Ok")
            self.present(alert, animated: true, completion: nil)
        }
    }

    private func removeNotificationCenter() {
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillHideNotification)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillChangeFrameNotification)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let registrationConfirmationPage = segue.destination as? RegistrationConfirmationClass else {
            print("Invalid Segue to Registration ConfirmationPage")
            return;
        }
        removeNotificationCenter()
        registrationData?.profileImage = imageView_ProfilePicture.image!
        registrationData?.status = textField_Status.text!
        registrationData?.aboutMe = textView_AboutMe.text!

        registrationConfirmationPage.registrationData = self.registrationData
    }
    deinit {
        print("Registration Page 2 is safe from memory leak")
        removeNotificationCenter()
    }
}
