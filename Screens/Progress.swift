//
//  SwiftUIView.swift
//  TAI_AI_APP
//
//  Created by 郭家駿 on 2026/10/10.
//

import SwiftUI

struct Progress: View {
    @State var cardColor = UIColor(named: "CardColor") ?? UIColor.secondaryLabel
    @State var buttonColor = UIColor(named: "ButtonColor") ?? UIColor.blue
    @State var textColor = UIColor(named: "TextColor") ?? UIColor.white
    @State var bgColor = UIColor(named: "BgColor") ?? UIColor.systemBackground
    @EnvironmentObject var progressData: ProgressData
    
    var body: some View {
        VStack {
            headerSection
                .padding(.bottom, 20)
                .foregroundStyle(Color.primary)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    statusSection
                        .foregroundStyle(Color(textColor))
                    mainSection(for: progressData)
                    VStack {} .frame(height: 50)
                }
            }
        }
        .padding()
        .background(Color(bgColor).ignoresSafeArea(.all))
    }
    
    var headerSection: some View {
        HStack {
            Text("維修進度")
                .font(.title.bold())
            Spacer()
        }
    }
    
    var statusSection: some View {
        VStack(spacing: 10) {
            VStack {
                VStack(alignment: .leading) {
                    Text("目前：原定項目施工")
                        .font(.caption)
                    Spacer()
                    Text("預估 11:40")
                        .font(.title.bold())
                    Spacer()
                    Text("1 項追加待您決定·原訂 NT$3200")
                        .font(.caption)
                }
                .padding()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color(cardColor))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            
            VStack(alignment: .center) {
                Text("1 項待確認：查看電瓶追加")
            }
            .frame(maxWidth: .infinity, maxHeight: 46)
            .background(Color(buttonColor))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .frame(maxWidth: .infinity, minHeight: 170)
    }
    
    @ViewBuilder
    private func mainSection(for progress: ProgressData) -> some View {
        VStack() {
            ForEach(progress.stages) { stage in
                card(for: stage, last: (stage.id == progress.stages.last?.id))
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    @ViewBuilder
    private func card(for stage: Stage, last: Bool) -> some View {
        HStack(alignment: .top) {
            VStack(spacing: 4) {
                Image(systemName: stage.symbolImage)
                    .font(.title2)
                if(!last) {
                    Capsule()
                        .frame(width: 3)
                }
            }
            .frame(width: 30)
            VStack(alignment: .leading) {
                Text(stage.msg)
                    .font(.body.bold())
                Text(stage.detail)
                    .font(.caption)
            }
            
            Spacer()
        }
        .foregroundStyle(Color(UIColor(named: stage.status.color) ?? UIColor.systemGray))
        .frame(maxWidth: .infinity, minHeight: last ? 40 : 100, alignment: .top)
        .padding(0)
    }
}

#Preview {
    Progress()
        .environmentObject(ProgressData(stages: Stage.samples))
}
