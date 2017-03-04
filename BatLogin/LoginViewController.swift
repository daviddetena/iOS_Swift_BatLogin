//
//  LoginViewController.swift
//  BatLogin
//
//  Created by David de Tena on 04/03/2017.
//  Copyright © 2017 David de Tena. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var imgLogoBatman: UIImageView!
    @IBOutlet weak var imgBatLogin: UIImageView!
    @IBOutlet weak var labelUser: UILabel!
    @IBOutlet weak var labelPass: UILabel!
    @IBOutlet weak var textUser: UITextField!
    @IBOutlet weak var textPass: UITextField!
    @IBOutlet weak var btnEnter: UIButton!
    
    var headerAnimator : UIViewPropertyAnimator!

    override var prefersStatusBarHidden: Bool{
        return true
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide outlets initially
        imgLogoBatman.transform = CGAffineTransform(translationX: 0.0, y: -120.0)
        imgBatLogin.transform = CGAffineTransform(translationX: 0.0, y: -170.0)
        labelUser.transform = CGAffineTransform(translationX: -200.0, y: 0.0)
        labelPass.transform = CGAffineTransform(translationX: -200.0, y: 0.0)
        textUser.transform = CGAffineTransform(translationX: 350.0, y: 0.0)
        textPass.transform = CGAffineTransform(translationX: 350.0, y: 0.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViews()
        buildAnimations()
    }
    
    // MARK: - Utils
    func configureViews(){
        textUser.layer.cornerRadius = 3.0
        textPass.layer.cornerRadius = 3.0
        btnEnter.layer.cornerRadius = 3.0
    }
    
    func buildAnimations(){
        // Make the outlets appear with an animation to their default positions
        headerAnimator = UIViewPropertyAnimator(duration: 0.6, curve: .easeInOut, animations: nil)
        headerAnimator.addAnimations {
            self.imgLogoBatman.transform = CGAffineTransform.identity
            self.imgBatLogin.transform = CGAffineTransform.identity
            self.labelUser.transform = CGAffineTransform.identity
            self.labelPass.transform = CGAffineTransform.identity
            self.textUser.transform = CGAffineTransform.identity
            self.textPass.transform = CGAffineTransform.identity
        }
        headerAnimator.startAnimation()
    }
}
