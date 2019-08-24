//
//  BDMLineProgressView.swift
//  ProgressLineView
//
//  Created by Victor Hugo Benitez Bosques on 06/01/19.
//  Copyright © 2019 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

class BDMLineProgressView: UIView {

    let shpPathLayer = CAShapeLayer()
    func createLineProgress(iTotalScreen : Int, iLastScreen : Int, iCurrentScreen : Int, with bAnimated: Bool) {
        
        let fValueStart : CGFloat = (iLastScreen == 0) ? 0 : CGFloat(Float(iLastScreen) / Float(iTotalScreen))
        let fValueEnd : CGFloat = CGFloat(Float(iCurrentScreen) / Float(iTotalScreen))
        
        let bzpDrawLine = UIBezierPath()
        bzpDrawLine.move(to: CGPoint(x: self.bounds.origin.x, y: self.bounds.height / 2)) // Init position
        bzpDrawLine.addLine(to: CGPoint(x: self.frame.size.width, y: self.bounds.height / 2))
        
        let shlTrackLine = CAShapeLayer()
        shlTrackLine.path = bzpDrawLine.cgPath
        shlTrackLine.strokeColor = UIColor.red.cgColor
        shlTrackLine.lineWidth =  CGFloat(self.frame.size.height)
        shlTrackLine.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shlTrackLine)
        
        shpPathLayer.path = bzpDrawLine.cgPath
        shpPathLayer.frame = self.bounds
        shpPathLayer.strokeColor = UIColor.brown.cgColor
        
        shpPathLayer.fillColor = nil
        shpPathLayer.lineWidth = CGFloat(self.frame.size.height)
        shpPathLayer.strokeEnd = (bAnimated) ? fValueStart : fValueEnd
        shpPathLayer.lineJoin = kCALineJoinBevel
        self.layer.addSublayer(shpPathLayer)
        
        if bAnimated {
            let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
            pathAnimation.toValue = fValueEnd
            pathAnimation.duration = 1.0
            
            pathAnimation.fillMode = kCAFillModeForwards
            // kCAFillModeBoth
            pathAnimation.isRemovedOnCompletion = false
            shpPathLayer.add(pathAnimation, forKey: "stroke")
        }
        
    }

}
