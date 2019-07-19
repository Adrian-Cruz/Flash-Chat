//
//  WelcomeViewController.swift
//  Flash Chat
//
//  This is the welcome view controller - the first thign the user sees
//

import UIKit
import Firebase


class WelcomeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        
        //If there is a logged in user, by pass this screen and go straight to ChatViewController
        
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "goToChat", sender: self)
        }
=======

>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
