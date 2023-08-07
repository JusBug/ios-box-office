//
//  CalendarViewController.swift
//  BoxOffice
//
//  Created by 박종화 on 2023/08/07.
//

import UIKit

class CalendarViewController: UIViewController {
    var calendarView: UICalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showCalendarView()
        
    }
    
    private func showCalendarView() {
        // UICalendarView 생성 및 구성
        calendarView = UICalendarView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        calendarView.backgroundColor = UIColor.white
        view.addSubview(calendarView)
    }
}

extension CalendarViewController: UICalendarViewDelegate {
    
}
