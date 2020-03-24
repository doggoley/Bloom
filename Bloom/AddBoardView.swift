//
//  AddBoardView.swift
//  Bloom
//
//  Created by zxyz on 23/03/2020.
//  Copyright © 2020 zxyz. All rights reserved.
//

import SwiftUI

struct AddBoardView: View {
    @Binding var isActive: Bool
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Board.entity(), sortDescriptors: []) var boards: FetchedResults<Board>
    @ObservedObject var fetcher = BoardFetcher()
    
    var body: some View {
        List (fetcher.fetchedBoards) { fetchedBoard in
            Button (
                action: {self.addBoard(board: fetchedBoard)},
                label: {HStack {
                    VStack (alignment: .leading) {
                        Text("/\(fetchedBoard.board)/ - \(fetchedBoard.title)")
                        Text(fetchedBoard.metaDescription.decodingHTMLEntities())
                            .font(.footnote)
                    }
                    Spacer()
                    Image(systemName: "plus")
                    }}
            )
            .buttonStyle(PlainButtonStyle())
        }
            
    .navigationBarItems(
        leading: Button(action: { self.isActive = false },
                        label: { HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")} }
                ))
        
    }
    
    func addBoard(board: FetchedBoard) {
        print("Add /\(board.board)/!")
        let boardToSave = Board(context: self.moc)
        boardToSave.short = board.board
        boardToSave.title = board.title
        boardToSave.dateAdded = Date()
        
        try? self.moc.save()
    }

}

/*
#if DEBUG
struct AddBoardView_Previews: PreviewProvider {
    static var previews: some View {
        AddBoardView()
    }
}
#endif
*/
