//
//  LIstView.swift
//  TodoList
//
//  Created by Zaruhi Davtyan on 08.12.23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
            ZStack {
                if listViewModel.items.isEmpty {
                    NoItemsView()
                        .padding(.init(top: 20, leading: 0, bottom: 0, trailing: 0))
                } else {
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Todo List")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

#Preview {
    
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}


