//
//  Timestamp.swift
//  RmineTwist
//
//  Created by minkyuLee on 8/14/24.
//

import Foundation
import Firebase

extension Int {
    func detailedTimestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.unitsStyle = .full
        formatter.maximumUnitCount = 2  // Show up to 2 units (e.g., "2 days and 1 hour")

        let duration = TimeInterval(self)
        let now = Date()
        let futureDate = now.addingTimeInterval(duration)
        
        let timeDifference = formatter.string(from: now, to: futureDate) ?? ""
        
        return timeDifference
    }
}

extension Timestamp {
    func timestampString() -> String {
        // 한국 시간대 (KST)를 설정합니다.
        let koreanTimeZone = TimeZone(identifier: "Asia/Seoul")!

        // Calendar 객체를 한국 시간대로 설정합니다.
        var calendar = Calendar.current
        calendar.timeZone = koreanTimeZone

        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated

        // 한국 시간대를 기준으로 날짜 계산을 합니다.
        let now = Date()
        let dateValueInKST = self.dateValue().addingTimeInterval(TimeInterval(koreanTimeZone.secondsFromGMT(for: self.dateValue())))
        let nowInKST = now.addingTimeInterval(TimeInterval(koreanTimeZone.secondsFromGMT(for: now)))

        return formatter.string(from: dateValueInKST, to: nowInKST) ?? ""
    }
    
}

extension Date {
    func toString(_ format: String)->String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func convertToTimeZone(initTimeZone: TimeZone, timeZone: TimeZone) -> Date {
         let delta = TimeInterval(timeZone.secondsFromGMT(for: self) - initTimeZone.secondsFromGMT(for: self))
         return addingTimeInterval(delta)
    }
}

