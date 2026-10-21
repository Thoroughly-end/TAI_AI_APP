//
//  ContentView.swift
//  TAI_AI_APP
//
//  Created by 郭家駿 on 2026/10/10.
//

import SwiftUI

enum APPTab: String {
    case progress = "Progress"
    case TAI = "TAI"
    case detail = "Detail"
    
    var symbolImage: String {
        return switch self {
            case .progress: "car"
            case .TAI: "icloud"
            case .detail: "info"
        }
    }
}

struct ContentView: View {
    @State var selected: APPTab = .progress
    
    
    var body: some View {
        TabView(selection: $selected) {
            Tab("Progress", systemImage: APPTab.progress.symbolImage, value: APPTab.progress) {
                Progress()
                    .environmentObject(ProgressData(stages: Stage.samples))
                    .ignoresSafeArea(.container, edges: .bottom)
            }
            Tab("TAI", systemImage: APPTab.TAI.symbolImage, value: APPTab.TAI) {
                
            }
            Tab("Detail", systemImage: APPTab.detail.symbolImage, value: APPTab.detail) {
                
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
