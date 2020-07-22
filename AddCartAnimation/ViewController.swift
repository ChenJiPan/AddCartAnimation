//
//  ViewController.swift
//  AddCartAnimation
//
//  Created by 陈良良 on 2020/7/22.
//  Copyright © 2020 陈良良. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var viewArray:[UIView] = {
        let viewArray = [UIView]()
        return viewArray
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickBtnm(_ sender: Any) {
        print("觉得放寒假")
        
        let animaView = AddCartAnimationView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        
        self.view.addSubview(animaView)
        
        
        animaView.playAnimationView(startPoint: CGPoint(x: 0, y: 100), endPoint: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height))
    }
}


