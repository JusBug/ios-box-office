//
//  DateProvider.swift
//  BoxOffice
//
//  Created by redmango, Jusbug on 2023/08/02.
//

import Foundation

struct DateProvider {
    
    func updateYesterday(_ form: DateForm) -> String? {
        let yesterday = try! reciveDate(to: -1)
        
        return modifyDate(with: yesterday, by: form)
    }
    
    func modifyDate(with date: Date,by form: DateForm) -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = form.rawValue
        
        return dateFormatter.string(from: date)
    }
    
    func reciveDate(to value: Int, from date: Date = Date()) throws -> Date {
        guard let reciveDate = Calendar.current.date(byAdding: .day, value: value, to: date) else {
            throw DateProviderError.wrongDate
        }
        
        return reciveDate
    }
}

enum DateForm: String {
    case urlDate = "YYYYMMdd"
    case viewTitle = "YYYY-MM-dd"
}
