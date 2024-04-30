
import SwiftUI

struct HeaderView: View {
    
    @Binding var selectedDate: Date
    
    var body: some View {
        
        let formatterStringDate = DateFormatter.formattedDate(date: selectedDate)
        
        VStack {
            HStack(spacing: 0, content: {
                Text("TODAY")
                    .font(.callout)
                Spacer()
                Text("\(formatterStringDate)")
                    .font(.title2.bold())
                Spacer()
                Image(systemName: "calendar")
                Image(systemName: "list.dash")
                
            })
            .padding(.horizontal)
            .padding(.top)
            .background(Color.blue)
            .foregroundColor(.white)
            
            Spacer().frame(height: 0)
            HStack {
                ForEach(1..<8, id: \.self) { index in
                    Text("\(weekDaySymbol(for: index))")
                        .font(.subheadline.bold())
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                }
            }.background(Color.blue)
        }
    }
    
    private func weekDaySymbol(for index: Int) -> String {
        let symbols = Calendar.current.shortWeekdaySymbols
        let startIndex = Calendar.current.firstWeekday - 1
        let correctedIndex = (startIndex + index - 1) % 7
        return symbols[correctedIndex]
    }
}

//#Preview {
//    HeaderView(selectedDate: )
//}
