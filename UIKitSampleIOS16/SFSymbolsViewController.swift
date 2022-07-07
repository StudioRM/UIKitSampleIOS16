//
//  SFSymbolsViewController.swift
//  UIKitSampleIOS16
//
//  Created by 村岡龍治 on 2022/07/05.
//

import Foundation
import UIKit

class SFSymbolsViewController: UIViewController {
    
    @IBOutlet weak var volumeImage: UIImageView?
    
    @IBOutlet weak var wifiImage: UIImageView?
    
    @IBOutlet weak var speakerVolumeSlider: UISlider?
    
    @IBOutlet weak var wifiVolumeSlider: UISlider?
    
    override func viewDidLoad() {
        self.title = "SF Symbols"
    }
    
    @IBAction func speakerVolumeSliderChanged(_ sender: UISlider) {
        volumeImage?.image = UIImage(__systemName: "speaker.wave.3.fill",
                                     variableValue: Double(sender.value),
                                     with: nil)
    }

    @IBAction func wifiVolumeSliderChanged(_ sender: UISlider) {
        wifiImage?.image = UIImage(__systemName: "wifi",
                                   variableValue: Double(sender.value),
                                   with: UIImage.SymbolConfiguration(hierarchicalColor: .red))
    }
}
