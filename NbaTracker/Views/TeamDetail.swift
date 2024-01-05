//
//  ContentView.swift
//  NbaTracker
//
//  Created by Viktor Sovyak on 1/5/24.
//

import SwiftUI

struct TeamDetail: View {
    @Environment(ModelData.self) var modelData

    
    var body: some View {
        ScrollView {
            ForEach(modelData.teams, id: \.self) { team in
                HStack(spacing: 50){
                    Text(team)
                        .padding([.vertical], 5)
                    Spacer()
                    Image(systemName: "heart.fill")
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    let modelData = ModelData()
    
    return TeamDetail()
            .environment(modelData)
}
