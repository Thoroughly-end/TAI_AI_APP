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
    
    var body: some View {
        VStack {
            headerSection
                .padding(.bottom, 20)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    statusSection
                }
                
            }
            
        }
        .padding()
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
                .foregroundStyle(Color.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color(cardColor))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            
            VStack(alignment: .center) {
                Text("1 項待確認：查看電瓶追加")
            }
            .frame(maxWidth: .infinity, maxHeight: 46)
            .background(Color(buttonColor))
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .frame(maxWidth: .infinity, minHeight: 170)
    }
    
    @ViewBuilder
    func mainSection(for: ProgressData) -> some View {
        VStack() {
            
        }
    }
}

#Preview {
    Progress()
}
