//
//  LikeStickyHeaderView.swift
//  HoneyInterestView
//
//  Created by Gab on 2023/12/06.
//

import SwiftUI

public enum LikeFilterCase: String {
    case all = "ALL"
    case near = "Near"
    case online = "Online"
}

struct LikeStickyHeaderView: View {
    @State private var dataList: [LikeFilterCase] = [.all, .near, .online, .all, .all, .near]
    @State private var filterCase: LikeFilterCase = .all
    
    var body: some View {
        VStack(spacing: 0) {
            
            LikeHistoryToggleView()
                .frame(height: 40)
            
            HStack(spacing: 0) {
                LeadingAlignmnetView(features: TestFlowLayout(data: dataList, dataSpacing: 7, lineSpacing: 8.5, content: { data in
                    
                    Text(data.rawValue)
                        .padding(.vertical, 3.5)
                        .padding(.horizontal, 11.5)
                        .foregroundColor(data == filterCase ? .black : .gray)
                        .background(data == filterCase ? .yellow : .white)
                        .cornerRadius(10)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .foregroundColor(data == filterCase ? .black : .gray)
                        })
                        .onTapGesture {
                            print("filter touch -> \(data)")
                            filterCase = data
                        }
                }))
                .padding(.vertical, 8.5)

                Spacer()
                
                Button {
                    print("알림설정 드가자")
                } label: {
                    Image("icoNoDisturb")
                }
            }
            .padding(.horizontal, 12)
            .background(.brown)
        }
    }
}

struct LikeStickyHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LikeStickyHeaderView()
    }
}

