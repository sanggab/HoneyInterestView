//
//  ContentView.swift
//  HoneyInterestView
//
//  Created by Gab on 2023/12/05.
//

import SwiftUI

public struct ContentView: View {
    
    @State private var uiscrollView: UIScrollView?
    
    @State private var offsetY: CGFloat = 0
    @State private var scrollViewFrame: CGSize = CGSize(width: 0, height: 0)
    
    private var maxHeight: CGFloat = 137
    private var minHeight: CGFloat = 87
    
    private var data: [String] = ["안뇽","안뇽2","안뇽3","안뇽4","안뇽5","안뇽6","안뇽7","안뇽8","안뇽9","안뇽10","안뇽11","안뇽12","안뇽13","안뇽14","안뇽15","안뇽16","안뇽17","안뇽18","안뇽19","안뇽20"]
    
    private var sectionList = ["14-10-2022", "10-10-2022", "30-09-2022", "12-10-2022",]
    
    @State private var diclist: [String : [String]] = [:]
    
    public var body: some View {
        StickyScrollView(header: {
            VStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    Text("honey")
                        .padding(.top, 6)
                        .padding(.leading, 10)
                }
                .frame(height: 50, alignment: .top)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.blue)

                LikeStickyHeaderView()
            }
        }, content: {
            LazyVStack(spacing: 12) {
                ForEach(Array(diclist.keys), id: \.self) { key in
                    Section {
                        ForEach(diclist[key] ?? [], id: \.self) { value in
                            LikeHistoryListCell(name: value)
                                .cornerRadius(12)
                                .shadow(color: Color(r: 0, g: 0, b: 0, a: 0.08), radius: 12, x: 0, y: 2)
                                .onTapGesture {
                                    print("value -> \(value)")
                                }
                        }
                    } header: {
                        SectionDateCell(date: key)
                    }
                }
            }
            .padding(.top, 16)
            .padding(.horizontal, 12)
        })
        .height(min: minHeight, max: maxHeight)
        .background(Color(r: 245, g: 245, b: 245, a: 1.0))
        .padding(.vertical)
        .onAppear {
            test()
        }
    }
    
    func test() {
        diclist.updateValue(["안뇽","안뇽2","안뇽3","안뇽4","안뇽5"], forKey: "14-10-2022")
        diclist.updateValue(["안뇽6","안뇽7","안뇽8"], forKey: "12-10-2022")
        diclist.updateValue(["안뇽9","안뇽10","안뇽11","안뇽12","안뇽13","안뇽14"], forKey: "10-10-2022")
        diclist.updateValue(["안뇽15","안뇽16","안뇽17","안뇽18","안뇽19","안뇽20"], forKey: "30-09-2022")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
