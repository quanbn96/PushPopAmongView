//
//  ViewController.swift
//  PushPop
//
//  Created by Quan on 6/22/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var lbl_Text: UILabel!
    @IBOutlet weak var btn_Text: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logo!.alpha = 1
        self.lbl_Text!.alpha = 1
        self.btn_Text!.alpha = 1
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animateWithDuration(3, animations: {
            self.logo!.alpha = 1
        }){(finished) in
            UIView.animateWithDuration(3, animations: {
                self.lbl_Text!.center = CGPointMake(self.logo!.center.x, self.logo!.frame.origin.y - 40)
                self.lbl_Text!.alpha = 1
            }){(finished) in
                UIView.animateWithDuration(3, animations: {
                    self.btn_Text!.center = CGPointMake(self.logo!.center.x, self.logo!.frame.origin.y + self.logo!.frame.height + 60)
                    self.btn_Text.alpha = 1
                }){(finished) in
                        let loginView = self.storyboard?.instantiateViewControllerWithIdentifier("LogInView") as! LognView
                        self.navigationController?.pushViewController(loginView, animated: true)
                }
            }
        }
    }

}

