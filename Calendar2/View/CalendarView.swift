

import SwiftUI

struct CalendarView: View {
    
    @State private var currentMonth: Date = Date()
    @Binding var selectedDate: Date
    
    let monthIndex: Int
    
    let newCalendar = Calendar.current
    
    let scheduleList = [
        Schedule(name: "일정 테스트1", startDate: "2024-05-01".toDate() ?? Date(), endDate: "2024-05-10".toDate() ?? Date()),
        Schedule(name: "일정 테스트2", startDate: "2024-05-02".toDate() ?? Date(), endDate: "2024-05-09".toDate() ?? Date()),
        Schedule(name: "일정 테스트3", startDate: "2024-05-03".toDate() ?? Date(), endDate: "2024-05-08".toDate() ?? Date()),
        Schedule(name: "일정 테스트4", startDate: "2024-05-02".toDate() ?? Date(), endDate: "2024-05-05".toDate() ?? Date()),
        Schedule(name: "일정 테스트5", startDate: "2024-05-13".toDate() ?? Date(), endDate: "2024-05-13".toDate() ?? Date())
    ]
    
    @State private var addDate: Date = Date()
    
    @State var currentDate = Date()
    
    
    var body: some View {
        
        let myDateComponents = DateComponents(year: 2024, month: monthIndex, day: 22)
        
        
        let a = newCalendar.date(from: myDateComponents)!
        
        let daysInMonth = Calendar.current.range(of: .day, in: .month, for: a)?.count ?? 0
        let MonthInYear = Calendar.current.range(of: .month, in: .year, for: a)?.count ?? 0
        let firstDayOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: a))!
        let weekdayOfFirstDay = Calendar.current.component(.weekday, from: firstDayOfMonth)
        
        let fontSize = 10
        
        GeometryReader { geometry in
            let a = geometry.size.height / 7
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 0, content: {
                    ForEach(1..<weekdayOfFirstDay,id: \.self) { _ in
                        Text("")
                    }
                    ForEach(1...daysInMonth,id: \.self) { day in
                        Button(action: {
                            selectedDate = Calendar.current.date(byAdding: .day, value: day, to: firstDayOfMonth)!
                        }) {
//                            let testDay = DateComponents(year: 2024, month: monthIndex, day: day)
//                            let c = newCalendar.date(from: testDay)!
//                            Text("\(day)")
//                               .foregroundColor(.black)
//                               .background(Color.yellow)
                            VStack{
                                let testDay = DateComponents(year: 2024, month: monthIndex, day: day)
                                let c = newCalendar.date(from: testDay)!
                                Text("\(day)")
                                    .foregroundColor(.black)

                                ForEach(scheduleList.indices, id:\.self) { list in
                                    if scheduleList[list].startDate.withOutTime() <= c && c <= scheduleList[list].endDate.withOutTime() {
                                        if scheduleList[list].startDate.day == day {
                                            Spacer().frame(height: 1)
                                            Rectangle()
                                                .frame(width: UIScreen.main.bounds.width / 7 + 2, height: a / 6 )
                                                .foregroundColor(.red)
                                                .overlay(
                                                    Text("\(scheduleList[list].name)")
                                                        .font(.system(size: CGFloat(fontSize)))
                                                        .frame(maxWidth: .infinity)
                                                        .fontWidth(Font.Width(.infinity))
                                                        .foregroundColor(.black)
                                                        .lineLimit(1)
                                                )
                                        } else {
                                            Spacer().frame(height: 1)
                                            Rectangle()
                                                .frame(width: UIScreen.main.bounds.width / 7 + 2 , height: a / 6 )
                                                .foregroundColor(.red)
                                            
                                        }
                                        
                                    }
                                }
                                Spacer()
                            }
                            
                        }.frame(height: a)
                    }
                })
                .foregroundStyle(.black)
            }
    }
    func numberOfWeeksInMonth(year: Int, month: Int) -> Int {
        let calendar = Calendar.current
        let firstDayOfMonth = calendar.date(from:DateComponents(year: year, month: month))!
        let rangeOfWeeks = calendar.range(of: .weekOfMonth, in: .month, for: firstDayOfMonth)!
        
        
        return rangeOfWeeks.count
    }
    
}

//#Preview {
//    CalendarView(monthIndex: Int)
//}
