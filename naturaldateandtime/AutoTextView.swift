//
//  AutoTextView.swift
//  naturaldateandtime
//
//  Created by Darko Sancanin on 11/07/2015.
//  Copyright (c) 2015 darkosancanin.com. All rights reserved.
//
import UIKit

class AutoTextView: UITextView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if(!(CGSizeEqualToSize(self.bounds.size, self.intrinsicContentSize()))){
            self.invalidateIntrinsicContentSize()
        }
        //self.layoutSubviews()
    }
    
    override func intrinsicContentSize() -> CGSize {
        var intrinsicContentSize = self.contentSize;
        //if(UIDevice.currentDevice().systemVersion.toInt() > 7){
            intrinsicContentSize.width += self.textContainerInset.left + self.textContainerInset.right / 2.0
            intrinsicContentSize.height += self.textContainerInset.top + self.textContainerInset.bottom / 2.0
        //}
        return intrinsicContentSize
    }
    
}
