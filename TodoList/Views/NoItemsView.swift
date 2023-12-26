//
//  NoItemsView.swift
//  TodoList
//
//  Created by Zaruhi Davtyan on 10.12.23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
        
    var body: some View {
            VStack {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.accentColor : secondaryAccentColor)
                            .cornerRadius(10)
                            .padding(.horizontal, animate ? 30 : 50)
                            .scaleEffect(animate ? 1.1 : 1.0)
                            .offset(y: animate ? -7 : 0)
                            .shadow(
                                color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                                radius: animate ? 30 : 10,
                                x: 0,
                                y: animate ? 50 : 30
                            )
                    })
                .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation())
                Spacer()
            }
            .frame(maxWidth: 400)
    }
    
    func addAnimation() -> () -> Void { {
        withAnimation(.easeInOut(duration: 2.0)
            .repeatForever()) {
           animate.toggle()
        }
    }
         
    }
}

#Preview {
    NavigationView {
        NoItemsView()
    }
}
