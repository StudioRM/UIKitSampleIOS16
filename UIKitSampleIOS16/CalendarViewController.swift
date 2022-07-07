//
//  CalendarViewController.swift
//  UIKitSampleIOS16
//
//  Created by 村岡龍治 on 2022/07/03.
//

import Foundation
import UIKit

class CalendarViewController: UIViewController {
    
    let dateComponents: [DateComponents] = []
    
    override func viewDidLoad() {
        
        self.title = "カレンダ"
        
        let calendarView = UICalendarView()
        calendarView.delegate = self
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarView)
        
        let multiDateSelection = UICalendarSelectionMultiDate(delegate: self)
        multiDateSelection.selectedDates = dateComponents
        calendarView.selectionBehavior = multiDateSelection
        
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: calendarView.topAnchor),
            self.view.leftAnchor.constraint(equalTo: calendarView.leftAnchor),
            self.view.rightAnchor.constraint(equalTo: calendarView.rightAnchor)
        ])
    }
}

extension CalendarViewController: UICalendarViewDelegate {

    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        switch dateComponents.day {
        case 1: return .default()
        case 2: return .default(color: .red)
        case 3: return .default(color: .blue)
        case 4: return .default(color: .green)
        case 5: return .image(UIImage.init(systemName: "figure.run"), color: .blue, size: .large)
        case 6: return .image(UIImage.init(systemName: "book"), color: .brown, size: .large)
        case 7: return .image(UIImage.init(systemName: "calendar"), color: .systemPink, size: .large)
        case 8: return .image(UIImage.init(systemName: "car"), color: .magenta, size: .large)
        case 9: return .image(UIImage.init(systemName: "airplane"), color: .orange, size: .large)
        case 10: return .customView {
            let label = UILabel()
            label.text = "休み"
            label.textColor = .red
            return label
        }
        case 27: return .image(UIImage.init(systemName: "yensign.square"), color: .systemPink, size: .large)
        default: return nil
        }
    }
}


extension CalendarViewController: UICalendarSelectionMultiDateDelegate {
    func multiDateSelection(
        _ selection: UICalendarSelectionMultiDate,
        didSelectDate dateComponents: DateComponents
    ) {}

    func multiDateSelection(
        _ selection: UICalendarSelectionMultiDate,
        didDeselectDate dateComponents: DateComponents
    ) {}
}
