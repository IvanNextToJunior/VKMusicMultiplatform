//
//  AudioRowView.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct AudioRowView: View {
    
    @State var title: String
    @State var artist: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            Text(artist)
        }
    }
}

struct AudioRowView_Previews: PreviewProvider {
    static var previews: some View {
        AudioRowView(title: "title", artist: "artist")
    }
}
