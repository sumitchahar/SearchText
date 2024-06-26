//
//  ContentView.swift
//  SearchMenu
//
//  Created by Sumit on 22/06/24.

 import SwiftUI

 struct DetailsListView: View {
     
   @State var searchText: String = ""
   @ObservedObject var informationItemsMVVM = InformationItemsMVVM()
     
    var body: some View {
        NavigationStack {
            List(informationItemsMVVM.searchArr, id: \.self.id ) { items in
               VStack {
                 HStack {
                    Image(items.image)
                              .resizable()
                              .frame(width:56,height:50)
                              .clipped()
                              .cornerRadius(5)
                     Text(items.details)
                              .lineLimit(2)
                              .font(.callout)
                              .padding([.leading],4)
                    }
                }
            }.listStyle(.plain)
            .navigationTitle("Details")
        }.onAppear() {
            informationItemsMVVM.searchArr = informationItemsMVVM.items
        }
        .searchable(text: $searchText)
        .onChange(of: searchText, initial: true) { oldCount, newCount in
            informationItemsMVVM.filterData(searchText)
        }
     }
 }

#Preview {
    DetailsListView()
}
