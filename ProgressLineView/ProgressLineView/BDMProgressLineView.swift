//
//  BDMProgressLineView.swift
//  ProgressLineView
//
//  Created by Victor Hugo Benitez Bosques on 06/01/19.
//  Copyright © 2019 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

@IBDesignable
class BDMProgressLineView: UIView {

    
    public var indicator : CALayer!
    
    public var animated = true
    
    // public values
    @IBInspectable public var indicatorLineColor : UIColor =  UIColor.red {
        didSet{
            indicator.backgroundColor = indicatorLineColor.cgColor
        }
    }
    
    @IBInspectable public var bgIndicator : UIColor = UIColor.brown{
        didSet{
            self.backgroundColor = bgIndicator
        }
    }
    
    @IBInspectable public var valueIndicator : CGFloat = 0.0{
        didSet{
            

            UIView.animate(withDuration: 0.8, delay: 1, options: .curveEaseIn, animations: {
                self.updateProgressLine(progress: self.valueIndicator)

            })

            
        }
    }

    override public func layoutSubviews() {  // Enter three times after aDecoder
         super.layoutSubviews()
        print("func layoutSubviews() {")
//        initialization()
//        updateProgressLine(progress: valueIndicator)
    }
    
    required public init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)

        print("init?(coder aDecoder: NSCoder)")
        
        // 1. Enter first time and  when set the color and value
        initialization()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("super.init(frame: frame)")
//        indicator = CALayer()

//        indicator.backgroundColor = indicatorLineColor.cgColor
//        updateProgressLine(progress: 0 )

        self.initialization()
        
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        print("super.prepareForInterfaceBuilder()")

        initialization()

    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        print("super.awakeFromNib()")
        self.initialization()
    }
    
    func initialization(){
        print("initialization")
        // Set the color in the uiview
        indicator = CALayer()
        indicator.backgroundColor = indicatorLineColor.cgColor
        layer.addSublayer(indicator)
        updateProgressLine(progress: self.valueIndicator)

    }
    
   
    
    // Update indicador
    public func updateProgressLine(progress : CGFloat){
        print("progress : CGFloat \(progress)")
  
        UIView.animate(withDuration: 1.0) {
            self.indicator.frame = CGRect(x: 0,
                                     y: 0,
                                     width: self.bounds.width * progress,
                                     height: self.bounds.height)
        }
        
    }
    
    
    
    
    /*
     1. nit?(coder aDecoder: NSCoder)
     initialization
     2. func layoutSubviews() {
     initialization
     3. func layoutSubviews() {
     initialization
     4. func layoutSubviews() {
     initialization

     
     */
    
    
    

}
