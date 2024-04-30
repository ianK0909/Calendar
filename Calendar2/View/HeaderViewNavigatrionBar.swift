//
//  HeaderViewNavigatrionBar.swift
//  Calendar2
//
//  Created by MAC2020 on 4/24/24.
//

import SwiftUI

struct HeaderViewNavigatrionBar: View {
    
    @Binding var selectedDate: Date
    
    init(selectedDate: Binding<Date>) {
        UINavigationBar.appearance().backgroundColor = .systemBlue
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        self._selectedDate = selectedDate
//        self._selectedDate = selectedDate
    }
    
//    init() {
//        
//        //statusbar
//        UINavigationBar.appearance().backgroundColor = .systemBlue
////        let navBarAppearance = UINavigationBarAppearance()
////        navBarAppearance.backgroundColor = UIColor.systemBlue
////        UINavigationBar.appearance().standardAppearance = navBarAppearance
////        UINavigationBar.appearance().compactAppearance = navBarAppearance
////        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    let a = Date()
    
    var body: some View {
        
        let formatterStringDate = DateFormatter.formattedDate(date: selectedDate)
        
        NavigationStack{
//                ScrollView{
                    Text("")
                        .navigationTitle(Text("\(formatterStringDate)"))
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Button {
                                    
                                } label: {
                                    Text("TODAY")
                                }
                                
                            }
                            ToolbarItem(placement: .topBarTrailing) {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "calendar")
                                }
                            }
                            ToolbarItem(placement: .topBarTrailing) {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "line.horizontal.3")
                                }
                                
                            }
                        }
//                }
        }.foregroundColor(.white)
    }
}

//#Preview {
//    HeaderViewNavigatrionBar()
//}
