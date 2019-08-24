//
//  ViewController.swift
//  ProgressLineView
//
//  Created by Victor Hugo Benitez Bosques on 06/01/19.
//  Copyright © 2019 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lineProgress: BDMProgressLineView!
    @IBOutlet weak var secondLineProgress: BDMLineProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        lineProgress.valueIndicator = 4/8
        lineProgress.updateProgressLine(progress: 2/3)
        
        secondLineProgress.createLineProgress(iTotalScreen: 3, iLastScreen: 1, iCurrentScreen: 2, with: true)
        
    }


}

