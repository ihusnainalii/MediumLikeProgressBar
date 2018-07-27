//
//  MediumProgressViewManager.swift
//  MediumProgressView
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

public let MEDIUM_COLOR = UIColor.white

open class MediumProgressViewManager {
    public enum Position {
        case top
        case bottom
        case viewBottom
        case viewTop
    }
    
    open var position: Position = .bottom
    open var color: UIColor = MEDIUM_COLOR
    open var height: CGFloat = 4.0
    open var isLeftToRight: Bool = false
    open var duration: CFTimeInterval = 1.5
    open var repeatCount = Float.infinity
    open var progressView: MediumProgressView?
    
    public init() {}

    open static let sharedInstance = MediumProgressViewManager()

    // MARK: function
    open func showProgress(window:UIView) {
        if progressView == nil {
            progressView = createMediumProgressView(window.frame)
            window.addSubview(progressView!)
        }
    }
    
    open func show() {
        if progressView == nil {
            guard let window = UIApplication.shared.keyWindow else {return}
            progressView = createMediumProgressView(window.frame)
            window.addSubview(progressView!)
        }
    }
    
    open func hide() {
        progressView?.removeFromSuperview()
        progressView = nil
    }
    
    // MARK: Helpers
    
    fileprivate func createMediumProgressView(_ frame: CGRect) -> MediumProgressView {
        let newWidth  = frame.size.width
        let newHeight = frame.size.height
        let newFrame: CGRect

        switch position {
            case .top:
                newFrame = CGRect(x: 0, y: 0, width: newWidth, height: height)
            case .viewBottom:
                newFrame = CGRect(x: 0, y: height, width: newWidth, height: height)
            case .viewTop:
                newFrame = CGRect(x: 0, y: height, width: newWidth, height: height)
            case .bottom:
                newFrame = CGRect(x: 0, y: newHeight - height, width: newWidth, height: height)
        }

        let progressView = MediumProgressView(
            frame: newFrame,
            isLeftToRight: isLeftToRight,
            duration: duration,
            repeatCount: repeatCount
        )
        progressView.delegate = self
        progressView.backgroundColor = color
        return progressView
    }
}

extension MediumProgressViewManager: MediumProgressViewDelegate {
    func mediumProgressViewDidFinishAnimation(_ view: MediumProgressView) {
        hide()
    }
}
