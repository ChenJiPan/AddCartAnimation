//
//  AddCartAnimationView.swift
//  AddCartAnimation
//
//  Created by 陈良良 on 2020/7/22.
//  Copyright © 2020 陈良良. All rights reserved.
//

import UIKit

class AddCartAnimationView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = .red
        layer.cornerRadius = self.bounds.width / 2.0
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddCartAnimationView{
    func playAnimationView(startPoint:CGPoint, endPoint: CGPoint){

        let path =  CGMutablePath()

        path.move(to: startPoint)
        
        path.addQuadCurve(to:endPoint,  control: CGPoint(x: 100, y: startPoint.y))
        //获取贝塞尔曲线的路径
        let animationPath = CAKeyframeAnimation.init(keyPath: "position")
        animationPath.path = path
        animationPath.rotationMode = CAAnimationRotationMode.rotateAuto
        
        //缩小图片到0
        let scale:CABasicAnimation = CABasicAnimation()
        scale.keyPath = "transform.scale"
        scale.toValue = 0.5
        
        //组合动画
        let animationGroup:CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = [animationPath,scale]
        animationGroup.duration = 0.8
        animationGroup.fillMode = CAMediaTimingFillMode.forwards
        animationGroup.isRemovedOnCompletion = false
        animationGroup.delegate = self
        self.layer.add(animationGroup, forKey:nil)
    }
}

extension AddCartAnimationView:CAAnimationDelegate{
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.isHidden = true
    }
}
