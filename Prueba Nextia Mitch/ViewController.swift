//
//  ViewController.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.logo.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn, animations: {
            self.logo.alpha = 1.0
        })
        animator.addCompletion { position in
            self.selectScreen()
        }
        animator.startAnimation()
    }
    
    private func selectScreen() {
        // LocalStorageManager.shared.removeJWT()
        LocalStorageManager.shared.getJWT { (jwt) in
            if jwt.count > 0 {
                self.goLogin()
            } else {
                self.goLogin()
            }
        }
    }
    
    private func goLogin() {
        if let viewController = LoginViewController.storyboardInstance() {
            // self.present(viewController, animated: true, completion: nil)
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
    }
    

}

