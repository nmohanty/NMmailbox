//
//  ComposeViewController.swift
//  NMmailboxdemo
//
//  Created by Namrata Mohanty on 10/31/16.
//  Copyright © 2016 MOS360. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapsend(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapbackhome(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
