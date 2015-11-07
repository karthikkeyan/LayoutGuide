//
//  ViewController.swift
//  LayoutGuide
//
//  Created by Karthik Keyan on 11/7/15.
//  Copyright © 2015 Karthik Keyan. All rights reserved.
//

import UIKit


private let footerButtonSpacing: CGFloat = 5.0

private let footerButtonWidth: CGFloat = 140

private let footerButtonHeight: CGFloat = 50


class ViewController: UIViewController {
    
    @IBOutlet var footerView: UIView?
    
    lazy var checkoutButtonSeparatorGuide = UILayoutGuide()
    
    lazy var checkoutButton: UIButton = UIButton(type: .Custom)
    
    lazy var applePayButton: UIButton = UIButton(type: .Custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Separator Layout Guid
        footerView?.addLayoutGuide(checkoutButtonSeparatorGuide)
        
        
        // Checkout Button
        checkoutButton.translatesAutoresizingMaskIntoConstraints = false
        checkoutButton.setTitle("Add To Cart", forState: .Normal)
        checkoutButton.layer.cornerRadius = 6
        checkoutButton.layer.masksToBounds = true
        checkoutButton.setBackgroundImage(UIImage(named: "bg_blue"), forState: .Normal)
        footerView?.addSubview(checkoutButton)
        
        
        // Apple Pay Button
        applePayButton.translatesAutoresizingMaskIntoConstraints = false
        applePayButton.setImage(UIImage(named: "applepay"), forState: .Normal)
        footerView?.addSubview(applePayButton)
        
        
        var constraints = [NSLayoutConstraint]()
        
        // Separator Guide
        constraints.append(checkoutButtonSeparatorGuide.centerXAnchor.constraintEqualToAnchor(footerView?.centerXAnchor))
        constraints.append(checkoutButtonSeparatorGuide.centerYAnchor.constraintEqualToAnchor(footerView?.centerYAnchor))
        constraints.append(checkoutButtonSeparatorGuide.widthAnchor.constraintEqualToConstant(10))
        constraints.append(checkoutButtonSeparatorGuide.heightAnchor.constraintEqualToConstant(10))
        
        // Checkout Button
        constraints.append(checkoutButton.rightAnchor.constraintEqualToAnchor(checkoutButtonSeparatorGuide.leftAnchor, constant: -footerButtonSpacing))
        constraints.append(checkoutButton.centerYAnchor.constraintEqualToAnchor(checkoutButtonSeparatorGuide.centerYAnchor))
        constraints.append(checkoutButton.widthAnchor.constraintEqualToConstant(footerButtonWidth))
        constraints.append(checkoutButton.heightAnchor.constraintEqualToConstant(footerButtonHeight))
        
        // Apple Pay Button
        constraints.append(applePayButton.leftAnchor.constraintEqualToAnchor(checkoutButtonSeparatorGuide.rightAnchor, constant: footerButtonSpacing))
        constraints.append(applePayButton.centerYAnchor.constraintEqualToAnchor(checkoutButtonSeparatorGuide.centerYAnchor))
        constraints.append(applePayButton.widthAnchor.constraintEqualToConstant(footerButtonWidth))
        constraints.append(applePayButton.heightAnchor.constraintEqualToConstant(footerButtonHeight))
        
        NSLayoutConstraint.activateConstraints(constraints)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.showLayoutGuides()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

