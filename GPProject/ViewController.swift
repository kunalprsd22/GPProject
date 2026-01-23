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
    
    var obj = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obj.name = "Kunal"
        obj.email = "qTq4t@example.com"
        animateText("hello")
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
    
    @IBAction func pushClick(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(
            withIdentifier: "SecondVC"
        ) as! SecondVC
        nextVC.obj = obj
        navigationController?.pushViewController(nextVC, animated: true)

    }
}
