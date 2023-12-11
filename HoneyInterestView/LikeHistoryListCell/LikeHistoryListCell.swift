//
//  LikeHistoryListCell.swift
//  HoneyInterestView
//
//  Created by Gab on 2023/12/06.
//

import SwiftUI

struct LikeHistoryListCell: View {
    public var isConnected: Bool = false
    public var count: Int = 0
    
    var body: some View {
        ZStack {
            HStack {
                
                ZStack(alignment: .topLeading) {
                 
                    Image("안돼")
                        .resizable()
                        .frame(width: 49, height: 49)
                        .cornerRadius(49 / 2)
                        .overlay {
                            Circle().stroke(lineWidth: 1).foregroundColor(.gray)
                        }
                        .padding(.leading, 12.5)
                        .padding(.top, 20.5)
                    
                    if count > 0 {
                        Circle()
                            .fill(.green)
                            .overlay {
                                Circle().stroke(lineWidth: 1).foregroundColor(.white)
                            }
                            .overlay {
                                Text("\(count)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 10))
                            }
                            .frame(width: 17, height: 17)
                            .padding(.leading, 45.5)
                            .padding(.top, 15.5)
                    }
                    
                    if isConnected {
                        Image("icoWifi")
                            .padding(.leading, 20)
                            .padding(.top, 58)
                    }
                }
                .frame(width: 61.5)
                .frame(maxHeight: .infinity, alignment: .topLeading)
                .background(.red)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Image("icoMarriage")
                        .padding(.leading, 0)
                        .padding(.top, 12)
                        .frame(alignment: .topLeading)
                    
                    HStack {
                        Text("Alex PopeAlex PopeAlex PopeAlex PopeAlex PopeAlex Pope")
                            .foregroundColor(.blue)
                            .font(.system(size: 15))
                            .lineLimit(1)

                        Divider()
                            .frame(height: 8)
                            .foregroundColor(.gray)

                        Text("27")
                            .foregroundColor(.black)
                            .font(.system(size: 13))
                            .lineLimit(1)
                    }
                    .padding(.top, 2)

                    HStack(alignment: .center) {
                        Image("flagUSA")

                        Text("New York, USANew York, USANew York, USANew York, USANew York, USANew York, USA")
                            .font(.system(size: 13))
                            .foregroundColor(.black)
                            .lineLimit(1)
                    }
                    .padding(.top, 4)
                    
                    Text("PM 03:50")
                        .font(.system(size: 13))
                        .foregroundStyle(.black)
                        .padding(.top, 4)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(.green)
                .padding(.horizontal, 15)
                
                ZStack(alignment: .topTrailing) {
                    
                    Rectangle()
                        .fill(.red)
                        .frame(width: 54, height: 54)
                        .overlay {
                            Image("btnVChat")
                                .resizable()
                                .frame(width: 42, height: 42)
                        }
                        .padding(.top, 12)
                        .padding(.trailing, 8)
                        .onTapGesture {
                            print("통화 드가자")
                        }
                    
                }
                .frame(width: 62)
                .frame(maxHeight: .infinity, alignment: .topTrailing)
                .background(.blue)
                
            }
        }
        .frame(height: 115)
        .frame(maxWidth: .infinity)
        .background(.yellow)
    }
}

struct LikeHistoryListCell_Previews: PreviewProvider {
    static var previews: some View {
        LikeHistoryListCell(isConnected: true, count: 3)
    }
}
