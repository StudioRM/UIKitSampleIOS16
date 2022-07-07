//
//  TopViewController.swift
//  UIKitSampleIOS16
//
//  Created by 村岡龍治 on 2022/06/30.
//

import UIKit

class TopViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    let categories = ["カレンダー", "ページコントロール", "カスタムサイズのシート", "SF Symbols", "UIKitとSwiftUI"]
    
    enum Category: Int {
        case calendar
        case pageControl
        case sheetSize
        case sfSymbols
        case withSwiftUi
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView?.rowHeight = 50
        tableView?.delegate = self
        tableView?.dataSource = self
    }
}

extension TopViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("")
        switch indexPath.row {
        case Category.calendar.rawValue:
            let storyboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "calendar")
            self.navigationController?.pushViewController(nextView, animated: true)
        case Category.pageControl.rawValue:
            let storyboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "pageControl")
            self.navigationController?.pushViewController(nextView, animated: true)
        case Category.sheetSize.rawValue:
            let storyboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "sheetSize")
            self.navigationController?.pushViewController(nextView, animated: true)
        case Category.sfSymbols.rawValue:
            let storyboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "sfSymbols")
            self.navigationController?.pushViewController(nextView, animated: true)
        case Category.withSwiftUi.rawValue:
            let storyboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "withSwiftUi")
            self.navigationController?.pushViewController(nextView, animated: true)
        default:
            break
        }
    }
}

extension TopViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
}
