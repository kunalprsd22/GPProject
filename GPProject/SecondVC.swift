//
//  SecondVC.swift
//  GPProject
//
//  Created by Kunal Prasad on 14/01/26.
//

import UIKit

class SecondVC: UIViewController {
    
    var obj: UserModel?
    private var timer: Timer?
    var val = 1
    var completion: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: 0.50,
            target: self,
            selector: #selector(addNextCharacter),
            userInfo: nil,
            repeats: true
        )
        createCarAndDriver()
    }
    
    @objc private func addNextCharacter() {
        val = val + 1
        completion = {
            self.view.backgroundColor = self.val%2 == 0 ? .red : .blue
        }
        completion?()
        print("data ----->", val)
    }
    
    deinit {
        print("SecondVC deinit")
    }
}


class Car {
    var name: String
    var driver: Driver?

    init(name: String, driver: Driver? = nil) {
        self.name = name
        self.driver = driver
    }

    deinit {
      print("`Car` was deallocated")
    }
}


class Driver {
    var name: String
    var car: Car?

    init(name: String, car: Car? = nil) {
        self.name = name
        self.car = car
    }

    deinit {
      print("`Driver` was deallocated")
    }
}

func createCarAndDriver() {
   var car: Car? = Car(name: "Ferrari", driver: nil)
   var driver: Driver? = Driver(name: "Enzo", car: nil)

   car?.driver = driver
   driver?.car = car
}
