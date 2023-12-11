//
//  LikeHistoryToggleView.swift
//  HoneyInterestView
//
//  Created by Gab on 2023/12/06.
//

import SwiftUI

public enum LikeType {
    case match
    case received
}

public struct LikeHistoryToggleView: View {
    @State private var type: LikeType = .match
    
    
    public var body: some View {
        GeometryReader { proxy in
            
            ZStack(alignment: .bottomLeading) {
                
                HStack(spacing: 2) {
                    
                    Image(type == .match ? "icoLikeMatchOn" : "icoLikeMatchOff")
                    
                    Text("Match")
                }
                .frame(width: proxy.size.width / 2, height: 40)
                .background(.red)
                .onTapGesture {
                    type = .match
                }
                
                HStack(spacing: 2) {
                    
                    Image(type == .received ? "icoLikeReceiveOn" : "icoLikeReceiveOff")
                    
                    Text("Received")
                }
                .frame(width: proxy.size.width / 2, height: 40)
                .background(.pink)
                .alignmentGuide(.leading, computeValue: { d in
                    return -proxy.size.width / 2
                })
                .onTapGesture {
                    type = .received
                }
                
                
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(.gray)
                        .frame(maxWidth: .infinity, maxHeight: 1)
                    
                    ZStack {
                        
                        Rectangle()
                            .fill(.black)
                            .frame(width: proxy.size.width / 2, height: 3)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: type == .match ? .bottomLeading : .bottomTrailing)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: proxy.size.height, alignment: .bottom)
            .background(.yellow)
            
        }
    }
}

struct LikeHistoryToggleView_Previews: PreviewProvider {
    static var previews: some View {
        LikeHistoryToggleView()
    }
}
