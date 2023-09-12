//
//  Constant.swift
//  MyResumeApp
//
//  Created by Jane Chao on 22/04/20.
//

import Foundation

typealias Experience = (title: String, company: String, start: String, end: String)

struct Resume {
    static let shared = Resume()
    let name     = "Alan Chou"
    let title    = "Product Manger"
    let location = "位置：台北"
    let bio      = "與 swift 熱戀中，經營 swift 教學頻道，希望讓更多人加入 coding 的美好世界 😊"
    let skills   = ["jira", "notion", "figma", "github"]
    let experiences: [Experience] = [("Project Manager",
                                      "Hububble",
                                      "2022 年 12 月",
                                      "現在"),
                                     ("Product Manager",
                                      "台邦企業股份有限公司",
                                      "2021 年 3 月",
                                      "2022 年 1 月"),]
    let phoneUrl = "tel://0912693650"
    let socialMedia: [(name: String, url: String)] = [("LinkedIn","www.linkedin.com/in/cty0305"),
                                                      ("Github","https://github.com/Cty0305"),
                                                      ("Instagram","https://www.instagram.com/cty0305/")]
}

