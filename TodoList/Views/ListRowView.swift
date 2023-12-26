//
//  ListRowView.swift
//  TodoList
//
//  Created by Zaruhi Davtyan on 08.12.23.
//

import SwiftUI

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 
 */

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Rectangle()
                .fill(.white)
        }
    }
}

#Preview {
    
    ListRowView(item: ItemModel(title: "for preview", isCompleted: true))
    
}
