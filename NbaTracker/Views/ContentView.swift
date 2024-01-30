//
//  ContentView.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelData.self) var modelData

    var body: some View {
        NavigationStack{
            NavigationLink{
                TabbedView()
            } label: {
                Text("Enter")
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
