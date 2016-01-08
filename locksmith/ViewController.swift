//
//  ViewController.swift
//  locksmith
//
//  Created by 黃健維 on 2015/12/30.
//  Copyright © 2015年 黃健維. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //login Situations
        if (PFUser.currentUser() == nil) {
           
            let loginViewController = PFLogInViewController()
            loginViewController.delegate = self
            
            loginViewController.fields =  [.UsernameAndPassword ]
            loginViewController.emailAsUsername = true
            loginViewController.signUpController?.delegate = self
            
            self.presentViewController(loginViewController, animated: false, completion: nil)
        }
        else
        {
        presentLoggedInAlert()
        
        }
    }
    
    
    //login proof
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        presentLoggedInAlert()
    }
    
    //sign up proof
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        presentLoggedInAlert()
    }
    
    
    
    // alert style
func presentLoggedInAlert() {
    let alertController = UIAlertController(title: "You're logged in", message: "Welcome to BSD test", preferredStyle: .Alert)
    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    alertController.addAction(OKAction)
    self.presentViewController(alertController, animated: true, completion: nil)
}


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


/*
override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    //login Situations
    if (PFUser.currentUser() == nil) {
        
        let loginViewController = PFLogInViewController()
        loginViewController.delegate = self
        
        loginViewController.fields =  [.UsernameAndPassword , .LogInButton , .PasswordForgotten , .SignUpButton , .Facebook  ]
        loginViewController.emailAsUsername = true
        loginViewController.signUpController?.delegate = self
        
        self.presentViewController(loginViewController, animated: false, completion: nil)
    }
    else
    {
        presentLoggedInAlert()
        
    }
}
*/
