import SwiftUI

struct ContentView: View {
    
    var body: some View {
        MainView()
    }
    
    struct MainView: View {

//        @State private var currentMonth: Date = Date()
//        @State private var selectedDate: Date = Date()
        @State private var selectedTab = 0
        
        let now = Date()
        let testCalendar = Calendar.current
        
        let myDateComponents = DateComponents(year: 2024, month: 4, day: 22)
        

  

        init() {
            UITabBar.appearance().scrollEdgeAppearance = .init()
        }
        
        var body: some View {
            
            
            let aaabbb = testCalendar.date(from: myDateComponents)


            let components = testCalendar.dateComponents([.month, .day], from: aaabbb!)
            

            
//            let daysInMonth = Calendar.current.range(of: .day, in: .month, for: selectedDate)?.count ?? 0
//            let MonthInYear = Calendar.current.range(of: .month, in: .year, for: selectedDate)?.count ?? 0
//            let firstDayOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: selectedDate))!
//            let weekdayOfFirstDay = Calendar.current.component(.weekday, from: firstDayOfMonth)

            
            
            GeometryReader { geometry in
                let screenWidth = geometry.size.width
                let screenHeight = geometry.size.height
                ScrollView(.horizontal) {
                    VStack {
                        HeaderView()
                            .frame(width: screenWidth)
                        CalendarView()
                            .frame(height: screenHeight)
                    }
                }
            }
//            VStack {
//                HeaderView()
//                CalendarView()
//                TabView(selection: $selectedTab)
//                {
//                    Text("\(now)")
//                        .tabItem {
//                            Image(systemName: "calendar")
//                            Text("Action")
//                        }
//                    Text("Memo")
//                        .tabItem {
//                            Image(systemName: "note")
//                            Text("Memo")
//                        }
//                }
//            }
        }
    }
}
        
        
//        GeometryReader { geo in
//            ScrollView(.horizontal) {
//                    VStack(content: {
//                        HStack(content: {
//                            ForEach(colors.indices) { index in
//                                colors[index]
//                            }
//                            .frame(width: geo.size.width,height: geo.size.height)
//  
//                        })
//                    })
//            }.onAppear{
//                UIScrollView.appearance().isPagingEnabled = true
//            }
//        }


//            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7),spacing: 100) {
//                ForEach(1..<weekdayOfFirstDay, id: \.self) { _ in
//                    Text("")
//                }
//                
//                ForEach(1...daysInMonth, id: \.self) { day in
//                    Button(action: {
//                        selectedDate = Calendar.current.date(bySetting: .day, value: day, of: firstDayOfMonth)!
//                    }) {
//                        Text("\(day)")
//                            .foregroundColor(day == selectedDate.day ? .blue : .primary)
//                            .padding(1)
//                            .frame(width: 40, height: 40)
//                            .background(
//                                Circle()
//                                    .fill(day == selectedDate.day ? Color.blue.opacity(0.3) : Color.clear)
//                            )
//                    }
//                }
//                Spacer()
//            }
//        }
//        
        

    //}

extension DateFormatter {
    static func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        return formatter.string(from: date)
    }
}

extension Date {
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func testPrint(_ vars: Any...) -> some View {
        for v in vars {
            print(v)
        }
        return EmptyView()
    }
}
