//
//  ViewController.swift
//  BatLogin
//
//  Created by David de Tena on 04/03/2017.
//  Copyright © 2017 David de Tena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgLogoBatman: UIImageView!
    @IBOutlet weak var labelInstructions: UILabel!
    
    var viewAnimator : UIViewPropertyAnimator!
    private let unlockGesture = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set panGestureRecognizer to view
        unlockGesture.addTarget(self, action: #selector(handle(pan:)))
        self.view.addGestureRecognizer(unlockGesture)
        
        // Set view animator and add animations manually
        viewAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: nil)
        viewAnimator.addAnimations {
            // Hide label after animation finished, and make logo smaller
            self.labelInstructions.layer.opacity = 0
            self.imgLogoBatman.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    // MARK: - Utils
    
    /// Handle our gesture recognizer. What to do while pulling down
    ///
    /// - Parameter pan: the panGestureRecognizer
    func handle(pan: UIPanGestureRecognizer){
        
        let speed : CGFloat = 2.0
        
        switch pan.state {
        case .began:
            // State active, but w/o motion
            viewAnimator.pauseAnimation()
        case .changed:
            // Make the "pan" animation slower so we have time to view it
            let translation = pan.translation(in: pan.view).y / speed
            viewAnimator.fractionComplete = translation / 100
            
            // Animation completed => trigger next animation
            if viewAnimator.fractionComplete >= 0.99 {
                buildAnimation()
            }
        default:
            break
        }
    }
    
    
    /// Build an animation for the logo to scale, as Twitter animation. When finished, we want the login screen to be displayed
    func buildAnimation(){
        let logoAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) { 
            self.imgLogoBatman.transform = CGAffineTransform(scaleX: 25.0, y: 25.0)
        }
        logoAnimator.startAnimation()
        logoAnimator.addCompletion { (UIViewAnimatingPosition) in
            self.beginApp()
        }
    }
    
    /// Instanciate the loginVC
    func beginApp(){
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(loginVC!, animated: true, completion: nil)
    }
}


