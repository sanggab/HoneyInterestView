//
//  ContentView.swift
//  HoneyInterestView
//
//  Created by Gab on 2023/12/05.
//

import SwiftUI

struct ScrollOffsetKey: PreferenceKey {
       static var defaultValue: CGFloat = 0
       static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
           value += nextValue()
       }
   }

public struct ContentView: View {
    
    @State private var offsetY: CGFloat = 0
    @State private var scrollViewFrame: CGSize = CGSize(width: 0, height: 0)
    
    private var data: [String] = ["안뇽","안뇽2","안뇽3","안뇽4","안뇽5","안뇽6","안뇽7","안뇽8","안뇽9","안뇽10","안뇽11","안뇽12","안뇽13","안뇽14","안뇽15","안뇽16","안뇽17","안뇽18","안뇽19","안뇽20"]
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 0) {

                ZStack(alignment: .topLeading) {
                    Text("honey")
                        .padding(.top, 6)
                        .padding(.leading, 10)
                }
                .frame(height: 50 - abs(offsetY))
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(.blue)

                LikeStickyHeaderView()

                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 12) {
                        ForEach(data, id: \.self) { data in
                            LikeHistoryListCell()
                        }
                    }
                    .overlay {
                        GeometryReader { proxy in
                            let offsetY = proxy.frame(in: .named("MyScrollView")).origin.y
                            
                            Color.clear.preference(key: ScrollOffsetKey.self, value: offsetY)
                                .onAppear {
                                    scrollViewFrame = proxy.frame(in: .named("MyScrollView")).size
                                }
                        }
                    }
                }
                .coordinateSpace(name: "MyScrollView")
                .padding(.horizontal, 12)
                .background {
                    Color(uiColor: UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1.0))
                }
                .onPreferenceChange(ScrollOffsetKey.self) { value in
                    print("offsetY -> \(offsetY)")
                    if value <= 0 {
                        let newOffsetY = min(abs(value), 50)
                        offsetY = -newOffsetY
                    } else {
                        offsetY = 0
                    }
                }
            }
            .background(.white)
            .padding(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
