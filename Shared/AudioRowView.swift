//
//  AudioRowView.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct AudioRowView: View {
    
    private static var durationFormatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        return formatter
    }
    
    @State var title: String
    @State var artist: String
    @State var duration: Int
    @State var isPlaying = false
    
    var body: some View {
        HStack {
            Button(action: {
                isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.circle" : "play.circle")
            }
            .buttonStyle(BorderlessButtonStyle())
            .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text(title).bold()
                Text(artist).foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(formatDuration(duration)).foregroundColor(.gray)
        }
    }
    
    private func formatDuration(_ duration: Int) -> String {
        return Self.durationFormatter.string(from: TimeInterval(duration))!
    }
}

struct AudioRowView_Previews: PreviewProvider {
    static var previews: some View {
        AudioRowView(title: "title", artist: "artist", duration: 0)
    }
}
