//
//  ContentView.swift
//  Bloom
//
//  Created by zxyz on 2/15/20.
//  Copyright © 2020 zxyz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(
        entity: Board.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Board.short, ascending: false)
        ]
    ) var boards: FetchedResults<Board>
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: AddBoardView()) {
                        Text("Add Board")
                    }
                }
                
                Section {
                    ForEach (boards) { board in
                        Text("/\(board.short ?? "Placeholder")/ - \(board.title ?? "Placeholder")")
                        Text("Test")
                    }
                }
            }
        }
        .navigationBarTitle(Text("Bloom"))
        .listStyle(GroupedListStyle())
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
