//
//  PracticeView.swift
//  SnowSeeker
//
//  Created by QinY on 14/9/2024.
//




import SwiftUI


struct PracticeView: View {
    @State private var searchText = ""
    let allNames = ["zhangsan","lisi","wangwu","zhaoliu","tianqi"]
    
    var filteredNames:[String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter {
                $0.localizedStandardContains(searchText)
            }
        }
    }
    
//    @State private var player = Player()
    
    @Environment(Player.self) var player
    
    var body: some View {
        
        
        NavigationStack {
            
            List(filteredNames,id:\.self) {name in
                Text(name)
            }
            .searchable(text: $searchText,prompt: "Look For something")
            .navigationTitle("Searching")
            
            
            VStack {
                Text("nihao")
                HighScoreView()
            }
            .environment(player)
            
        }
            
//            Text("Searching for \(searchText)")
//                .searchable(text: $searchText,prompt: "Look for something")
//                .navigationTitle("Searching")
        
        
//        NavigationView {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                .navigationTitle("Promary")
//        }
        
//        NavigationSplitView(columnVisibility: .constant(.all)) {
//            NavigationLink("Primary"){
//                Text("New View")
//            }
//            
//        } detail: {
//            Text("Content")
//                .navigationTitle("ContentView")
//        }
//        .navigationSplitViewStyle(.balanced)
    }
}

struct HighScoreView:View {
    var body: some View {
        
        Text("your high score:")
    }
}

@Observable
class Player {
    var name = "Or"
    var highScore = 0
}





#Preview {
    PracticeView()
}
