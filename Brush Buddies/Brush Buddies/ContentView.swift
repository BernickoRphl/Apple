//
//  ContentView.swift
//  Brush Buddies
//
//  Created by MacBook Pro on 11/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            Text("Main Page")
                .foregroundColor(.white)
                .font(.system(size:30))
        }
    }
}

#Preview {
    ContentView()
}
