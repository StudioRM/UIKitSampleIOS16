//
//  WithSwiftUIViewController.swift
//  UIKitSampleIOS16
//
//  Created by 村岡龍治 on 2022/07/06.
//

import Foundation
import UIKit
import SwiftUI

class WithSwiftUIViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView?
 
    override func viewDidLoad() {
        self.title = "UIKitとSwiftUI"
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 8.0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        collectionView?.collectionViewLayout = layout
    }
}

extension WithSwiftUIViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select")
    }
}

extension WithSwiftUIViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        cell.contentConfiguration = UIHostingConfiguration {
            VStack {
                Image(systemName: "car.fill").foregroundStyle(.red)
                Text("my car")
            }
            .foregroundStyle(Color.red)
        }
        return cell
    }
}
