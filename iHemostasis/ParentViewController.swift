//
//  ParentViewController.swift
//  iHemostasis
//
//  Created by Zo Rajaonarivony on 29/01/2016.
//  Copyright © 2016 Diagnostica Stago S.A.S. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    func setScreenTitle(title: String) {
        let titleLabel: UILabel = UILabel(frame: CGRect(x: 700, y: 0, width: 800, height: 40))
        titleLabel.text = title
        titleLabel.font  = UIFont(name: Utils.SCREEN_TITLE_FONT_NAME, size: Utils.SCREEN_TITLE_FONT_SIZE)
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .right
        self.navigationItem.titleView = titleLabel;
    }
    func setScreenTitle(title: String,fontsize:CGFloat) {
        let titleLabel: UILabel = UILabel(frame: CGRect(x: 700, y: 0, width: 40, height: 200))
        titleLabel.text = title
        titleLabel.font  = UIFont(name: Utils.SCREEN_TITLE_FONT_NAME, size: fontsize)
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .right
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        
        
        self.navigationItem.titleView = titleLabel;
    }
    
    @objc func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
}


extension UINavigationController {
    open override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if visibleViewController is CoagulationCascadeListViewController || visibleViewController is CoagulationCascadePlayerViewController/* || visibleViewController is ClinicalCasesListViewController */{
            super.supportedInterfaceOrientations
            return UIInterfaceOrientationMask.landscapeLeft
        }
        return UIInterfaceOrientationMask.all
    }
/*
    public override func shouldAutorotate() -> Bool {
        if visibleViewController is CoagulationCascadeListViewController || visibleViewController is CoagulationCascadePlayerViewController {
            let value = UIInterfaceOrientation.LandscapeLeft.rawValue
            UIDevice.currentDevice().setValue(value, forKey: "orientation")
            return false
        }
        return true
    }*/
}
