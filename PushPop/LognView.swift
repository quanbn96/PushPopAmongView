//
//  LognView.swift
//  PushPop
//
//  Created by Quan on 6/22/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class LognView: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textfield_Username: UITextField!
    @IBOutlet weak var textfield_Password: UITextField!
    @IBOutlet weak var lbl_Notify: UILabel!
    
    var Users = ["Quan": "123", "Giap": "1234ab", "Duong": "1", "Hung": "abc"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield_Password.delegate = self
        textfield_Username.delegate = self
    }
    
    
    @IBAction func action_Login(sender: AnyObject) {
        if let password = Users[textfield_Username.text!] {
            if password == textfield_Password.text! {
                lbl_Notify.text = "Đăng nhập thành công"
                let mathView = self.storyboard?.instantiateViewControllerWithIdentifier("MathView") as! athView
                self.navigationController?.pushViewController(mathView, animated: true)
            } else {
                lbl_Notify.text = "Mật khẩu không đúng"
            }
            
        } else {
            lbl_Notify.text = "Tài khoản này không tồn tại"
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
