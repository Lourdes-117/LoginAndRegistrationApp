//
//  RegistrationConfirmationClass.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 30/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class RegistrationConfirmationViewController: UIViewController {

    @IBOutlet weak var topBackground: UIView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var scrollableContentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var imageView_ProfilePicture: UIImageView!
    @IBOutlet weak var label_Address: UILabel!
    @IBOutlet weak var label_PhoneNumber: UILabel!
    @IBOutlet weak var label_Email: UILabel!
    @IBOutlet weak var label_DOB: UILabel!
    @IBOutlet weak var label_LastName: UILabel!
    @IBOutlet weak var label_FirstName: UILabel!
    @IBOutlet weak var label_AboutMe: UILabel!
    @IBOutlet weak var label_Status: UILabel!
    public var registrationData:RegistrationData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RegistrationConfirmation Page Loaded")
        applyScrollViewDesign()
        appplyTopBackground()
        applyOkButtonDesign()
        applyImageViewDesign()
        applyAllDataToLables()
    }

    private func applyScrollViewDesign() {
        scrollableContentView.applyViewTheme()
        scrollView.applyViewTheme()
    }

    private func applyOkButtonDesign() {
        okButton.applyButtonTheme()
    }

    private func applyImageViewDesign(){
        imageView_ProfilePicture.layer.cornerRadius = imageView_ProfilePicture.frame.height / 2
    }

    private func appplyTopBackground() {
        topBackground.layer.cornerRadius = 40;
    }

    private func applyAllDataToLables(){
        imageView_ProfilePicture.image = registrationData!.profileImage
        label_Status.text! = registrationData!.status!
        label_AboutMe.text! = registrationData!.aboutMe!
        label_FirstName.text! = registrationData!.firstName!
        label_LastName.text! = registrationData!.lastName!
        label_DOB.text! = registrationData!.dob!
        label_Email.text! = registrationData!.emailID!
        label_PhoneNumber.text! = registrationData!.phoneNumber!
        label_Address.text! = registrationData!.address!
    }

    @IBAction func onClickPreviousButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    deinit{
        print("Confirmation Page is safe from memory leaks")
    }
}
