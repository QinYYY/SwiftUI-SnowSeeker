//
//  ContentView.swift
//  SnowSeeker
//
//  Created by QinY on 14/9/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedUser:User? = nil
    
    @State private var isShowingUser = false
    
    @State private var layoutVertically = false
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        Section {
            ViewThatFits {
                Rectangle()
                    .frame(width: 500,height: 200)
                    .background(.yellow)
                Circle()
                    .frame(width: 200,height: 200)
                    .background(.green)
            }
        }
        
        Section {
            if horizontalSizeClass == .compact {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
        }
        
        Section {
            Button {
                layoutVertically.toggle()
            } label: {
                if layoutVertically {
                    VStack {
                        UserView()
                    }
                } else {
                    HStack {
                        UserView()
                    }
                }
            }
        }
    }
}


struct UserView:View {
    var body: some View {
        Group {
            Text("Name:Paul")
            Text("Country:England")
            Text("Pets:Luna and arya")
        }
        .font(.title)
    }
}

#Preview {
    ContentView()
}
