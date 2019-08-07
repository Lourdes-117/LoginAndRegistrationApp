//
//  RegistrationPage2Class.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 30/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class RegistrationPageTwoViewController: UIViewController, UIImagePickerControllerDelegate, UITextViewDelegate, UITextFieldDelegate, UINavigationControllerDelegate {

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
        applyTextFieldsDesign()
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
        scrollableContentView.applyViewTheme()
        scrollView.applyViewTheme()
    }

    private func appplyTopBackground() {
        topBackground.layer.cornerRadius = 40;
    }

    private func applyRegisterButtonDesign() {
        registerButton.applyButtonTheme()
    }

    private func applyTextFieldsDesign(){
        textField_Status.applyTextFieldTheme()
    }

    private func applyTextViewDesign(to textView: UITextView){
        textView.setBottomBorder(withColor: Colors.DARK_BLUE.cgColor)
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
        image.allowsEditing = false
        self.present(image, animated: true){
            print("Gallery Presented")
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
            imageView_ProfilePicture.layer.borderColor = Colors.RED.cgColor
            error_ProfilePicture.isHidden = false
            error_ProfilePicture.textColor = Colors.RED
            error_ProfilePicture.text! = "Pleaes Upload a Picture"
            return false
        }
        error_ProfilePicture.isHidden = false
        error_ProfilePicture.textColor = Colors.GREEN
        error_ProfilePicture.text! = "Valid"
        imageView_ProfilePicture.layer.borderColor = Colors.GREEN.cgColor
        print("Image Found")
        return true
    }

    private func checkStatus() -> Bool {
        let status = textField_Status.text!
        let isValid = RegistrationPageValidation.checkStatus(status)
        StatusSetter.setStatus(forLabel: error_Status, ofTextField:textField_Status, ofTextView: nil, validityStatus: isValid)
        return isValid
    }

    private func checkAboutMe() -> Bool {
        let aboutMe = textView_AboutMe.text!
        let isValid = RegistrationPageValidation.checkTextView(aboutMe)
        StatusSetter.setStatus(forLabel: error_AboutMe, ofTextField: nil, ofTextView: textView_AboutMe, validityStatus: isValid)
        return isValid;
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
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let registrationConfirmationPage = segue.destination as? RegistrationConfirmationViewController else {
            print("Invalid Segue to Registration ConfirmationPage")
            return;
        }
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
