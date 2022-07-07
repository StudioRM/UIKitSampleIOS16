//
//  SheetSizeViewController.swift
//  UIKitSampleIOS16
//
//  Created by 村岡龍治 on 2022/07/04.
//

import Foundation
import UIKit

extension UISheetPresentationController.Detent.Identifier {
    static let twentyFive = UISheetPresentationController.Detent.Identifier("twentyFive")
    static let fifty = UISheetPresentationController.Detent.Identifier("fifty")
    static let seventyFive = UISheetPresentationController.Detent.Identifier("seventyFive")
}

class SheetSizeViewController: UIViewController {
    
    @IBOutlet weak var sheetSizeSelectButton: UISegmentedControl?
    
    @IBOutlet weak var twentyFivePercentButton: UIButton?
    
    @IBOutlet weak var fiftyPercentButton: UIButton?
    
    @IBOutlet weak var seventyFivePercentButton: UIButton?
    
    override func viewDidLoad() {
        self.title = "カスタムサイズのシート"
    }
    
    @IBAction func twentyFivePercentButtonDidTap() {
        let vc =  self.storyboard!.instantiateViewController(withIdentifier: "sheet")
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [
                .large(),
                .custom (identifier: .twentyFive) { context in
                    0.25 * context.maximumDetentValue
                }
            ]
        }
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func fiftyPercentButtonDidTap() {
        let vc =  self.storyboard!.instantiateViewController(withIdentifier: "sheet")
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [
                .large(),
                .custom (identifier: .fifty) { context in
                    0.5 * context.maximumDetentValue
                }
            ]
        }
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func seventyFivePercentButtonDidTap() {
        let vc =  self.storyboard!.instantiateViewController(withIdentifier: "sheet")
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [
                .large(),
                .custom (identifier: .seventyFive) { context in
                    0.75 * context.maximumDetentValue
                }
            ]
        }
        present(vc, animated: true, completion: nil)
    }
}
