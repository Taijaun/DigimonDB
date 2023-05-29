//
//  IntroViewController.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import UIKit
import SwiftUI

class IntroViewController: UIViewController {
    
    
    
    var coordinator: Coordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
//    func fadeInOut() {
//        if buttonStart.alpha == 0 {
//            UIView.animate(withDuration: 1.7, delay: 0.4, options:[.allowUserInteraction, .autoreverse, .repeat]){
//                self.buttonStart.alpha = 0.8
//            }
//        }
//    }
    
    
    @IBAction func startTapped(_ sender: Any) {
        coordinator?.goToTabView()
    }
    
    

}
