//
//  LikeStickyHeaderView.swift
//  HoneyInterestView
//
//  Created by Gab on 2023/12/06.
//

import SwiftUI

struct LikeStickyHeaderView: View {
    @State private var dataList: [String] = ["ALL", "Near", "Online"]
    
    var body: some View {
        VStack(spacing: 0) {
            
            LikeHistoryToggleView()
                .frame(height: 40)
            
            HStack(spacing: 0) {
                LeadingAlignmnetView(features: TestFlowLayout(data: dataList, dataSpacing: 7, lineSpacing: 8.5, content: { text in
                    
                    Text(text)
                        .padding(.vertical, 3.5)
                        .padding(.horizontal, 11.5)
                        .foregroundColor(.black)
                        .background(.yellow)
                        .cornerRadius(10)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.black)
                        })
                        .onTapGesture {
                            print(text)
                        }
                }))
                .padding(.vertical, 8.5)

                Spacer()
                
                Button {
                    let randomString: [String] = ["안녕", "새로운 케이스", "오늘은 12월 8일 금요일", "12월11일 연차"]
                    print("웹뷰로 보내라")
                    
                    dataList.append(randomString.randomElement() ?? "")
                    
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

