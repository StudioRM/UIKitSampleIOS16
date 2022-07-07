//
//  EditMenuViewController.swift
//  UIKitSampleIOS16
//
//  Created by 村岡龍治 on 2022/07/01.
//

import Foundation
import UIKit
import WebKit

class EditMenuViewController: UIViewController, UIEditMenuInteractionDelegate {
    
    @IBOutlet weak var webView : WKWebView?
    
    var editMenuInteraction: UIEditMenuInteraction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView?.loadHTMLString("https://developer.apple.com/wwdc22/", baseURL: nil)
        
        // Add the edit menu interaction.
        editMenuInteraction = UIEditMenuInteraction(delegate: self)
        webView?.addInteraction(editMenuInteraction!)

        // Create the gesture recognizer.
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(_:)))
        longPress.allowedTouchTypes = [UITouch.TouchType.direct.rawValue as NSNumber]
        webView?.addGestureRecognizer(longPress)
    }
    
    @objc func didLongPress(_ recognizer: UIGestureRecognizer) {
        let location = recognizer.location(in: self.view)
        let configuration = UIEditMenuConfiguration(identifier: nil, sourcePoint: location)

        if let interaction = editMenuInteraction {
            // Present the edit menu interaction.
            interaction.presentEditMenu(with: configuration)
        }
    }
}
