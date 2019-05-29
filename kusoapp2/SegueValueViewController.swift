//
//  segueValueViewController.swift
//  kusoapp2
//
//  Created by reiji kobayashi on 2019/05/29.
//  Copyright © 2019 reud. All rights reserved.
//

import UIKit

class SegueValueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text=receivedText
        // Do any additional setup after loading the view.
    }
   
    var receivedText:String?
   
    @IBOutlet weak var textLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
