//
//  athView.swift
//  PushPop
//
//  Created by Quan on 6/22/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//
import UIKit

class athView: UIViewController {
    
    
    @IBOutlet weak var lbl_p1: UILabel!
    @IBOutlet weak var lbl_p2: UILabel!
    @IBOutlet weak var lbl_op: UILabel!
    
    @IBOutlet weak var btn_p1: UIButton!
    @IBOutlet weak var btn_p2: UIButton!
    @IBOutlet weak var btn_p3: UIButton!
    
    @IBOutlet weak var lbl_True: UILabel!
    @IBOutlet weak var lbl_Fall: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    
    
    var count = 0
    var timer = NSTimer()
    
    var True: Int = 0
    var Fall: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(athView.counter), userInfo: nil, repeats: true)
        setRandom()
    }
    
    @IBAction func btn_action(sender: AnyObject) {
        let p1 = Int(lbl_p1.text!)!
        let p2 = Int(lbl_p2.text!)!
        let op = lbl_op.text!
        
        let choose = Int(sender.currentTitle!!)!
        
        if choose == result(p1, p2: p2, op: op) {
            True += 1
        } else {
            Fall += 1
        }
        
        lbl_True.text = String(True)
        lbl_Fall.text = String(Fall)
        
        setRandom()

    }
    
    
    func setRandom() {
        let random1 = Int(arc4random_uniform(4)) + 1
        let random2 = Int(arc4random_uniform(4)) + 1
        let randomOperator = Int(arc4random_uniform(4)) //0 : cong; 1: tru; 2: nhan; 3: chia
        
        lbl_p1.text = String(random1)
        lbl_p2.text = String(random2)
        lbl_op.text = tranOperatorToString(randomOperator)
        
        setResult(random1, randomB: random2, op: randomOperator)
    }
    
    func setResult(randomA: Int, randomB: Int, op: Int)  {
        let randomLocation = Int(arc4random_uniform(3)) //random vi tri cua ket qua
        let Operator = tranOperatorToString(op)
        
        if randomLocation == 0 {
            btn_p1.setTitle(String(result(randomA, p2: randomB, op: Operator)), forState: .Normal)
            btn_p2.setTitle(String(randomA), forState: .Normal)
            btn_p3.setTitle(String(randomB), forState: .Normal)
            
        } else if randomLocation == 1 {
            btn_p1.setTitle(String(randomB), forState: .Normal)
            btn_p2.setTitle(String(result(randomA, p2: randomB, op: Operator)), forState: .Normal)
            btn_p3.setTitle(String(randomA), forState: .Normal)
            
        } else {
            btn_p1.setTitle(String(randomA), forState: .Normal)
            btn_p2.setTitle(String(randomB), forState: .Normal)
            btn_p3.setTitle(String(result(randomA, p2: randomB, op: Operator)), forState: .Normal)
            
        }
    }
    
    func result(p1: Int, p2: Int, op: String) -> Int {
        if op == "+" {
            return p1 + p2
            
        } else if op == "-" {
            return p1 - p2
            
        } else if op == "*" {
            return p1 * p2
            
        } else {
            return Int(p1 / p2)
            
        }
        
    }
    
    func tranOperatorToInt(Operator: String) -> Int {
        if Operator == "+" {
            return 0
            
        } else if Operator == "-" {
            return 1
            
        } else if Operator == "*" {
            return 2
            
        } else {
            return 3
            
        }
    }
    
    func tranOperatorToString(Operator: Int) -> String {
        if Operator == 0 {
            return "+"
            
        } else if Operator == 1 {
            return "-"
            
        } else if Operator == 2 {
            return "*"
            
        } else {
            return "/"
            
        }
    }
    
    func counter() {
        
        count += 1
        
        counterLabel.text = "\(count)"
        
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
