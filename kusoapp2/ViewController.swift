//
//  ViewController.swift
//  kusoapp2
//
//  Created by reiji kobayashi on 2019/05/27.
//  Copyright © 2019 reud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func segueButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "segueByCallValue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueByCallValue" {
            
            let segueByCallValue:SegueValueViewController = segue.destination as! SegueValueViewController
            
            // 変数:遷移先ViewController型 = segue.destinationViewController as 遷移先ViewController型
            // segue.destinationViewController は遷移先のViewController
            
            if let unwrrappedText = textField.text {
                if !unwrrappedText.isEmpty {
                    segueByCallValue.receivedText = unwrrappedText
                }
                else {
                    segueByCallValue.receivedText = "何も入ってないよ！"
                }
                
            }
            else {
                print("something error")
                segueByCallValue.receivedText = "nil inserted"
            }
            

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

