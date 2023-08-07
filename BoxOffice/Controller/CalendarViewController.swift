//
//  CalendarViewController.swift
//  BoxOffice
//
//  Created by 박종화 on 2023/08/07.
//

import UIKit

class CalendarViewController: UIViewController, UICalendarViewDelegate {
    var calendarView: UICalendarView!
    var selectedDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showCalendarView()
        
    }
    
    private func showCalendarView() {
        // UICalendarView 생성 및 구성
        calendarView = UICalendarView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        calendarView.backgroundColor = UIColor.white
        calendarView.calendar = .current
        
        let currentDate = Date()
        guard let pastDate = Calendar.current.date(byAdding: .year,  value: -3, to: currentDate) else {
            return
        }
        calendarView.availableDateRange = DateInterval(start: pastDate, end: currentDate)
        
        calendarView.selectionBehavior = UICalendarSelectionSingleDate(delegate: self)
        calendarView.delegate = self
        view.addSubview(calendarView)
    }
}

extension CalendarViewController: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        if let date = dateComponents?.date {
            print(date)
        }else {print("empty date")}

    }
}
