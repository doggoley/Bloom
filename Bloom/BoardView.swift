//
//  BoardView.swift
//  Bloom
//
//  Created by zxyz on 24/03/2020.
//  Copyright © 2020 zxyz. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    //@Binding var isActive: Bool
    @State var board: String
    
    var body: some View {
        WebView(request: URLRequest(url: URL(string: "https://4chan.org/\(board)/")!))
            
        .navigationBarTitle(Text(board))
        /*.navigationBarItems(
            leading: Button(action: { self.isActive = false },
                            label: { HStack {
                                Image(systemName: "chevron.left")
                                Text("Back")} }
                    ))*/
    }
    
}

/*
struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
*/
