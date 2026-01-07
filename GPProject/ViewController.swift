//
//  ViewController.swift
//  GPProject
//
//  Created by Appinventiv on 15/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myName: UILabel!
    
    private var textToAnimate = ""
    private var currentIndex = 0
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func animateText(_ text: String) {
        myName.text = ""
        textToAnimate = text
        currentIndex = 0
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(addNextCharacter),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc private func addNextCharacter() {
        guard currentIndex < textToAnimate.count else {
            timer?.invalidate()
            return
        }
        
        let index = textToAnimate.index(
            textToAnimate.startIndex,
            offsetBy: currentIndex
        )
        myName.text?.append(textToAnimate[index])
        currentIndex += 1
    }
}

