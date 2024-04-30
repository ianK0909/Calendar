import SwiftUI

struct ContentView: View {
    
    var body: some View {
        MainView()
    }
    
    struct MainView: View {

        @State private var selectedDate: Date = Date()
        
        @State private var selectedTab = 0
        
        let now = Date()
        let testCalendar = Calendar.current
        
        let myDateComponents = DateComponents(year: 2024, month: 4, day: 22)
        

        init() {
            UITabBar.appearance().scrollEdgeAppearance = .init()
        }
        
        var body: some View {
            
            GeometryReader { geometry in
                let screenWidth = geometry.size.width
                let screenHeight = geometry.size.height
                NavigationStack {
                    HeaderViewNavigatrionBar(selectedDate: $selectedDate)
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0, content: {
                            ForEach(4..<13) { monthIndex in
                                VStack{
                                    Spacer().frame(height: 60)
                                    CalendarView(selectedDate: $selectedDate, monthIndex: monthIndex)
                                        .frame(height: screenHeight)
                                        .frame(width: screenWidth)

                                    }
                                }
                                
                                
                            }
                        ).scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    //                }.onAppear {
                    //                    UIScrollView.appearance().isPagingEnabled = true
                    //                }
                }
        }
            }
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
