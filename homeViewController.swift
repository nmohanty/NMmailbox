//
//  homeViewController.swift
//  NMmailboxdemo
//
//  Created by Namrata Mohanty on 10/27/16.
//  Copyright © 2016 MOS360. All rights reserved.
//

import UIKit

class homeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var messagepageView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var messageParentview: UIView!
    @IBOutlet weak var reddeleteImageview: UIImageView!
    @IBOutlet weak var greenarchiveImageview: UIImageView!
    @IBOutlet weak var yellowlaterImageview: UIImageView!
    @IBOutlet weak var brownlistImageview: UIImageView!
    @IBOutlet weak var messageImageview: UIImageView!
    
    @IBOutlet weak var segmentedButtons: UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet var screenedgepan: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    var messageOriginalCenter: CGPoint!
    var greenarchiveOriginalCenter: CGPoint!
    var reddeleteOriginalCenter: CGPoint!
    var yellowlaterOriginalCenter: CGPoint!
    var brownlistOriginalCenter: CGPoint!
    var messageOffset: CGFloat!
    var nexticon: CGPoint!
    var messageReturn: CGPoint!
    var messageGoawayright: CGPoint!
    var messageGoawayleft: CGPoint!
    var segment: CGFloat!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        
        scrollView.delegate = self
        firstView.alpha = 0
        thirdView.alpha = 0
        //use offset to set messageIview to its original or go away
        messageReturn = messageImageview.center
        messageGoawayright = CGPoint(x: messageImageview.center.x + 375,y: messageImageview.center.y )
        messageGoawayleft = CGPoint(x: messageImageview.center.x - 375,y: messageImageview.center.y )
       
        /*  let screenedgepan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didScreenEdgePan(_:)),
            
            //#selector(didScreenEdgePan(sender: )))
        
        // Configure the screen edges you want to detect.
        self.screenedgepan.edges = UIRectEdge.left,
        
        // Attach the screen edge pan gesture recognizer to some view.
        messagepageView.isUserInteractionEnabled = true,
        messagepageView.addGestureRecognizer(self.screenedgepan)*/
        
        if self.segmentedButtons.selectedSegmentIndex == 0 {
            self.view.addGestureRecognizer(self.swipeGesture)
        }
        else if self.segmentedButtons.selectedSegmentIndex == 1{
            self.view.addGestureRecognizer(self.swipeGesture)
        }
        else if self.segmentedButtons.selectedSegmentIndex == 2{
            self.view.addGestureRecognizer(self.swipeGesture)
        }
            else {
                self.view.removeGestureRecognizer(self.swipeGesture)
        }        // Do any additional setup after loading the view.
    }// end of viewdidload
    
    @IBAction func didScreenEdgePan(_ sender: UIScreenEdgePanGestureRecognizer) {
    }
    @IBAction func didPanmessage(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        //let velocity = sender.velocity(in: view)
        
        
        
        if sender.state == .began {
            //this is called only once
            messageOriginalCenter = messageImageview.center
            greenarchiveOriginalCenter = greenarchiveImageview.center
            reddeleteOriginalCenter = reddeleteImageview.center
            yellowlaterOriginalCenter = yellowlaterImageview.center
            brownlistOriginalCenter = brownlistImageview.center
            
        }//end of .began state
            
        else if sender.state == .changed {
            let translation = sender.translation(in: view)
            
            //code that follows called cont as we pan
            messageImageview.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
          
            
            
           // let velocity = sender.velocity(in: view)
           // if velocity.x < 0 {
                if translation.x < 0 && translation.x > -60{
                    
                    self.reddeleteImageview.alpha = 0
                    self.greenarchiveImageview.alpha = 0
                    self.brownlistImageview.alpha = 0
                    self.messageParentview.backgroundColor = UIColor.gray
                    self.yellowlaterImageview.alpha = 0.3
                    UIView.animate(withDuration: 0.6, animations: {
                        //perform bkgdcolor change and move icon imageview
                        self.yellowlaterImageview.alpha = 1
                        //add code for icon to translate with translate x
                    })//end of animate
                }
                else if translation.x < -60 && translation.x > -260 {
                    self.reddeleteImageview.alpha = 0
                    self.greenarchiveImageview.alpha = 0
                    self.yellowlaterImageview.alpha = 1
                    self.brownlistImageview.alpha = 0
                    
                    let messageOffset = translation.x + 60
                    
                    self.yellowlaterImageview.center.x = self.yellowlaterOriginalCenter.x + messageOffset
                    self.brownlistImageview.center.x = self.brownlistOriginalCenter.x + messageOffset
                
                    UIView.animate(withDuration: 0.4, animations: {
                        //perform bkgdcolor change and move icon imageview
                        self.messageParentview.backgroundColor = UIColor.yellow
                        
                        
                    })//end of animate
                }//end of translate
                else if translation.x < -260 {
                    
                        let messageOffset = translation.x + 60
                        //perform bkgdcolor change and move icon imageview
                    
                        self.yellowlaterImageview.alpha = 0
                        self.brownlistImageview.alpha = 1
                        self.reddeleteImageview.alpha = 0
                        self.greenarchiveImageview.alpha = 0
                        
                        //add code for icon to translate with translate x
                        self.brownlistImageview.center.x = self.brownlistOriginalCenter.x + messageOffset
                    
                    UIView.animate(withDuration: 0.4, animations: {
                        self.messageParentview.backgroundColor = UIColor.brown
                    })//end of animate
                    
                    if  self.brownlistImageview.center.x == 330 {
                        self.thirdView.alpha = 0
                        self.thirdView.center.x = messageOriginalCenter.x
                    }
                }//end of translate
      //      }//end of velocity function
           // else if velocity.x > 0 {
              else  if translation.x > 0 && translation.x < 60{
                    self.reddeleteImageview.alpha = 0
                    self.yellowlaterImageview.alpha = 0
                    self.brownlistImageview.alpha = 0
                    self.messageParentview.backgroundColor = UIColor.gray
                    self.greenarchiveImageview.alpha = 0.3
                    UIView.animate(withDuration: 0.4, animations: {
                        //perform bkgdcolor change and move icon imageview
                        self.greenarchiveImageview.alpha = 1
                        //add code for icon to translate with translate x
                    })//end of animate
                     print("messageImageview.center.x is \(self.messageImageview.center.x)")
                }
                else if translation.x > 60 && translation.x < 260{
                        self.reddeleteImageview.alpha = 0
                        self.yellowlaterImageview.alpha = 0
                        self.brownlistImageview.alpha = 0
                        self.greenarchiveImageview.alpha = 1
                    
                        let messageOffset = translation.x - 60
                        print("translation.x is \(translation.x)")
                        print("greenarchiveImageview.center.x is\(self.greenarchiveImageview.center.x)")
                        print("messageImageview.center.x is \(self.messageImageview.center.x)")
                        //perform bkgdcolor change and move icon imageview
                    
                    
                        //self.greenarchiveImageview.transform = self.greenarchiveImageview.transform.translatedBy (x: self.messageOffset, y: 0)
                        self.greenarchiveImageview.center.x = self.greenarchiveOriginalCenter.x + messageOffset
                    self.reddeleteImageview.center.x = self.reddeleteOriginalCenter.x + messageOffset

                    
                        //add code for icon to translate with translate x
                    UIView.animate(withDuration: 0.4, animations: {
                        self.messageParentview.backgroundColor = UIColor.green
                    })//end of animate
                }//end of translate
                    
                else if translation.x > 260 {
                      let messageOffset = translation.x - 60
               
                        self.reddeleteImageview.alpha = 1
                        self.greenarchiveImageview.alpha = 0
                        self.yellowlaterImageview.alpha = 0
                        self.brownlistImageview.alpha = 0
                    
                        //add code for icon to translate with translate x
                       self.reddeleteImageview.center.x = self.reddeleteOriginalCenter.x + messageOffset
                    
                    //perform bkgdcolor change and move icon imageview

                   UIView.animate(withDuration: 0.4, animations: {
                    self.messageParentview.backgroundColor = UIColor.red
                   })//end of animate
                    
                }//end of translate
                
        //    }//end of velocity
        }//end of .changed
            
            
            
        else if sender.state == .ended {
            //called once
           // let velocity = sender.velocity(in: view)
            //if velocity.x > 0 {
                //moving down/moving left, animate to messageLeft/trayDown point
            //self.greenarchiveImageview.center.x = self.greenarchiveOriginalCenter.x
            
                if translation.x > -60 && translation.x < 60 {
                    UIView.animate(withDuration: 0.4, animations: { 
                        self.messageImageview.center = self.messageReturn
                        }, completion: nil)
                   //end of animate
                }//end of translate
            
           // }//end of velocity
                
           
                //moving up/moving right, animate to messageRighttrayUp point
               else if translation.x > 60 && translation.x < 260
                {
                    
                    UIView.animate(withDuration: 0.4, animations: {                                    self.messageImageview.center = self.messageGoawayright
                                    self.greenarchiveImageview.center.x = 330
                        }, completion: nil)//end of animate
                    
                        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
                            self.messageImageview.center = self.messageReturn
                            self.greenarchiveImageview.center = self.greenarchiveOriginalCenter
                            self.reddeleteImageview.center = self.reddeleteOriginalCenter
                            }, completion: nil)                    //end of animate
                }//end of translate
                    
            
            
                else if translation.x > 260
                {
                    UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                                   animations: { () -> Void in
                                    self.messageImageview.center = self.messageGoawayright
                                    self.reddeleteImageview.center.x = 330
                        }, completion: nil)//end of animate
                    UIView.animate(withDuration: 0.4, delay: 0.4, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: { 
                        self.messageImageview.center = self.messageReturn
                        self.greenarchiveImageview.center = self.greenarchiveOriginalCenter
                        self.reddeleteImageview.center = self.reddeleteOriginalCenter
                        }, completion: nil)
                }//end of translate
            
        else if translation.x < -60 && translation.x > -260
        {
            UIView.animate(withDuration: 0.4, animations: {                                    self.messageImageview.center = self.messageGoawayleft
                self.yellowlaterImageview.center.x = 45
                
                }, completion: { done in
                    UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
                        self.firstView.alpha = 1
                        
                        }, completion: { done in
                           
                    })//end of animate
            })//end of animate
            
                }//end of translate
            
                else if translation.x < -260
                {
                    UIView.animate(withDuration: 0.4, animations: {
                                    self.messageImageview.center = self.messageGoawayleft
                                    self.brownlistImageview.center.x = 45
                        }, completion: { done in
                            UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
                                self.thirdView.alpha = 1
                                
                                }, completion: { done in
                            })//end of animate
                    })//end of animate

                                }//end of translate
            
        }//end of .ended
    }
    
    @IBAction func didTapcompose(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.4, animations: { 
            self.performSegue(withIdentifier: "composeSegue", sender: nil)
            }, completion: nil)
    }
    
    @IBAction func onTapsegments(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            segment == 0.0
            firstView.isHidden = false
            messagepageView.isHidden = true
            thirdView.isHidden = true
            
        case 1:
            segment == 1.0
            firstView.isHidden = true
            messagepageView.isHidden = false
            thirdView.isHidden = true
        case 2:
            segment == 2.0
            firstView.isHidden = true
            messagepageView.isHidden = true
            thirdView.isHidden = false
        default:
            break;
        }
    }
 
    @IBAction func onTapReschedule(_ sender: AnyObject) {
        self.messageImageview.center = self.messageReturn
        self.yellowlaterImageview.center = self.yellowlaterOriginalCenter
        self.brownlistImageview.center = self.brownlistOriginalCenter
        UIView.animate(withDuration: 0.33, animations: {
            self.firstView.alpha = 0
            self.messageImageview.center = self.messageReturn

        }) { done in
            // Nothing.
        }
    }
    
    @IBAction func onTapList(_ sender: AnyObject) {
        //self.messageImageview.center = self.messageReturn
        self.yellowlaterImageview.center = self.yellowlaterOriginalCenter
        self.brownlistImageview.center = self.brownlistOriginalCenter
        UIView.animate(withDuration: 0.33, animations: {
            self.thirdView.alpha = 0
            self.messageImageview.center = self.messageReturn

        }) { done in
            // Nothing.
        }

    }

    @IBAction func onSwipe(_ sender: UISwipeGestureRecognizer) {
        let OriginalfirstCenter = self.firstView.center.x
        let OriginalthirdCenter = self.thirdView.center.x
        if segment == 0.0 {
            
            UIView.animate(withDuration: 0.3, animations: {
                self.firstView.center.x = self.firstView.center.x + 375
                self.messagepageView.alpha = 0
                }, completion: nil)
        }
        else if segment == 1.0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.firstView.center.x = OriginalfirstCenter
                self.messagepageView.alpha = 1
                }, completion: nil)
    }
        else if segment == 2.0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.thirdView.center.x = self.thirdView.center.x - 375
                self.messagepageView.alpha = 0
                }, completion: nil)
            
        }
    }// end of onSwipe
    
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
