//
//  ScrollWhenKeyboardHidesTextView.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 05/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit;
class ScrollWhenKeyboardHidesTextView {
    @objc public class func moveScrollViewUp(ofScrllView scrollView:UIScrollView, inView view:UIView, notification: Notification) {
        print("This will change the view")

        guard let keyboardScreenEndFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        if(notification.name == UIResponder.keyboardWillHideNotification){
            scrollView.contentInset = UIEdgeInsets.zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: CGFloat.zero, left: CGFloat.zero, bottom: keyboardViewEndFrame.height, right: CGFloat.zero)
        }
    }
}
