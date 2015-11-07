//
//  UIView+LayoutGuideDebug.swift
//  LayoutGuide
//
//  Created by Karthik Keyan on 11/7/15.
//  Copyright © 2015 Karthik Keyan. All rights reserved.
//

import UIKit

extension UIView {
    
    func showLayoutGuides() {
        
#if DEBUG
        // You sub may contain layout guides
        // so recursively add guides
        for sub in subviews {
            sub.showLayoutGuides()
        }
        
        guard let layoutGuides = self.layer.sublayers else {
            return
        }
        
        // Clear previous layers
        for layer in layoutGuides {
            if layer is LayoutGuideLayer {
                layer.removeFromSuperlayer()
            }
        }
        
        // Add new layers for guides
        for guide in self.layoutGuides {
            let layoutGuideLayer = LayoutGuideLayer(guide: guide)
            self.layer.addSublayer(layoutGuideLayer)
        }
        
#endif
    }
    
}

class LayoutGuideLayer: CAShapeLayer {
    
    init(guide:UILayoutGuide) {
        super.init()
        
        self.path = UIBezierPath(rect: guide.layoutFrame).CGPath
        self.lineWidth = 0.5
        self.lineDashPattern = [1, 1, 1, 1]
        self.fillColor = UIColor.clearColor().CGColor
        self.strokeColor = UIColor.redColor().CGColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
