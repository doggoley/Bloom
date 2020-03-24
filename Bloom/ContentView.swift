//
//  ContentView.swift
//  Bloom
//
//  Created by zxyz on 2/15/20.
//  Copyright © 2020 zxyz. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //var boards: [Board] = []
    @State var isActive: Bool = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Board.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Board.dateAdded, ascending: true)
    ]) var boards: FetchedResults<Board>
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(
                        destination: AddBoardView(isActive: $isActive),
                        isActive: $isActive,
                        label: {
                            Button(action: {self.isActive = true},
                                label: {
                                    Text("Add boards")
                                }
                            )
                        }
                    )
                }
                
                Section {                    
                    ForEach (boards, id: \.self) {board in
                        NavigationLink(
                            destination: BoardView(board: board.short ?? "Unknown"),
                            //isActive: self.$isActive,
                            label: {
                                Button (action: {self.isActive = true},
                                        label: {
                                            Text("/\(board.short ?? "Unknown")/ - \(board.title ?? "Unknown")")
                                        })
                                .buttonStyle(DefaultButtonStyle())
                            }
                        )
                        
                    }
                    .onDelete(perform: deleteBoards)
                }
            }
            .navigationBarTitle(Text("Bloom"))
            .listStyle(GroupedListStyle())
        }
    }
    
    func deleteBoards(at offsets: IndexSet) {
        for offset in offsets {
            let board = boards[offset]
            moc.delete(board)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
