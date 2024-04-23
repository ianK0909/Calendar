//
//  CalendarView.swift
//  Calendar2
//
//  Created by MAC2020 on 4/23/24.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var currentMonth: Date = Date()
    @State private var selectedDate: Date = Date()
    
    var body: some View {
        let daysInMonth = Calendar.current.range(of: .day, in: .month, for: selectedDate)?.count ?? 0
        let MonthInYear = Calendar.current.range(of: .month, in: .year, for: selectedDate)?.count ?? 0
        let firstDayOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: selectedDate))!
        let weekdayOfFirstDay = Calendar.current.component(.weekday, from: firstDayOfMonth)
        
        
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 0, content: {
            ForEach(1..<weekdayOfFirstDay,id: \.self) { _ in
                Text("")
            }
            ForEach(1...daysInMonth,id: \.self) { day in
                Button(action: {
                    selectedDate = Calendar.current.date(byAdding: .day, value: day, to: firstDayOfMonth)!
                }) {
                    Text("\(day)")
                        .minimumScaleFactor(0.5)
                        .frame(width: 40, height: 40)
                }
            }
        }).foregroundStyle(.black)
    }
}

#Preview {
    CalendarView()
}
