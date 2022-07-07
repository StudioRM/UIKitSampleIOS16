//
//  PageControlViewController.swift
//  UIKitSampleIOS16
//
//  Created by 村岡龍治 on 2022/07/03.
//

import Foundation

import UIKit

class PageControlViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView?
    
    @IBOutlet weak var pageControl: UIPageControl?
    
    @IBOutlet weak var pageControlDirectionButton: UISegmentedControl?
    
    var pageViewController: UIPageViewController?
    
    var controllers: [UIViewController] = []
    
    var pageIndex = 0
    
    override func viewDidLoad() {
        
        self.title = "ページコントロール"
        
        let firstViewController = UIViewController()
        firstViewController.view.tag = 0
        firstViewController.view.backgroundColor = .red
        
        let secondViewController = UIViewController()
        secondViewController.view.tag = 1
        secondViewController.view.backgroundColor = .blue
        
        let thirdViewController = UIViewController()
        thirdViewController.view.tag = 2
        thirdViewController.view.backgroundColor = .green
        
        pageViewController = children.first! as? UIPageViewController
        
        controllers = [firstViewController, secondViewController, thirdViewController]
        // 最初のViewControllerを赤色のViewControllerを設定
        self.pageViewController?.setViewControllers([controllers[0]], direction: .forward, animated: true, completion: nil)
        self.pageViewController?.dataSource = self
        self.pageViewController?.delegate = self
                
        pageControl?.numberOfPages = controllers.count
        pageControl?.currentPage = 0
    }
    
    @IBAction func pageControlDirectionButtonDidTap() {
        if pageControlDirectionButton?.selectedSegmentIndex == 0 {
            pageControl?.direction = .leftToRight
        } else {
            pageControl?.direction = .topToBottom
        }
    }
}

extension PageControlViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating: Bool, previousViewControllers: [UIViewController], transitionCompleted: Bool) {
        if (!transitionCompleted) {
            return
        }
        self.pageControl?.currentPage = pageViewController.viewControllers!.first!.view.tag //Page Index
    }
}

extension PageControlViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = self.controllers.firstIndex(of: viewController),
            index > 0 {
            return self.controllers[index - 1]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = self.controllers.firstIndex(of: viewController),
            index < self.controllers.count - 1 {
            return self.controllers[index + 1]
        } else {
            return nil
        }
    }
}
