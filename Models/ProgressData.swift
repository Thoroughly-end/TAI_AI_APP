//
//  Stage.swift
//  TAI_AI_APP
//
//  Created by 郭家駿 on 2026/10/22.
//

import SwiftUI
import Combine

struct Stage: Identifiable {
    let id = UUID()
    let msg: String
    let detail: String
    let symbolImage: String
    var status: StageStatus
    
    init(msg: String, detail: String, symbolImage: String, status: StageStatus = .pending) {
        self.msg = msg
        self.detail = detail
        self.symbolImage = symbolImage
        self.status = status
    }
}

enum StageStatus {
    case done
    case inProgress
    case pending
}

extension Stage {
    static let samples: [Stage] = [
        Stage(msg: "接待與工單確認", detail: "09:10 已確認本次服務內容",
              symbolImage: "list.clipboard", status: .done),
        Stage(msg: "全車檢查與診斷", detail: "09:25 已完成檢查，整理維修建議",
              symbolImage: "magnifyingglass", status: .done),
        Stage(msg: "確認維修項目與報價", detail: "原訂項目已確認；追加項目另行詢問",
              symbolImage: "doc.text", status: .inProgress),
        Stage(msg: "維修煞車片", detail: "前煞車來令片 • 零件與工資已說明",
              symbolImage: "steeringwheel", status: .pending),
        Stage(msg: "更換機油與濾芯", detail: "原訂保養 • 依工單規格施工",
              symbolImage: "oilcan", status: .pending),
    ]
}

@MainActor
class ProgressData: ObservableObject {
    @Published var stages: [Stage]
    
    init(stages: [Stage]) {
        self.stages = stages
    }
    
    func complete(idx: Int) {
        if(idx < stages.count && idx >= 0) {
            self.stages[idx].status = .done
        }
    }
    
    func doing(idx: Int) {
        if(idx < stages.count && idx >= 0) {
            self.stages[idx].status = .inProgress
        }
    }
}
