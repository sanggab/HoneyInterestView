//
//  LeadingAlignmnetView.swift
//  FlowLayout
//
//  Created by Gab on 2023/12/05.
//

import SwiftUI

public protocol FlowLayoutFeatures {
    associatedtype Element
    associatedtype ContentView: View
    
    var data: [Element] { get }
//    var direction: FlowDirection { get }
    var dataSpacing: CGFloat { get }
    var lineSpacing: CGFloat { get }
    
    @ViewBuilder var content: (Element) -> ContentView { get }
}

public struct SizePreferenceKey: PreferenceKey {
    public static var defaultValue: CGSize = .zero

    public static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

public struct LeadingAlignmnetView<FlowFeatures: FlowLayoutFeatures>: View {
    @State private var frameSize: CGSize = CGSize(width: 0, height: 0)
    
    public var features: FlowFeatures
    
    public var body: some View {
        VStack {
            
            ZStack(alignment: .topLeading) {
                var width: CGFloat = 0
                var height: CGFloat = 0
                
                ForEach(Array(features.data.enumerated()), id: \.offset) { index, item in
                    features.content(item)
                        .alignmentGuide(.leading) { d in

                            if abs(width) + d.width > frameSize.width {
                                /// 이제 해당 width에 더이상 배치할 수 없을 경우, 맨 처음에 붙어야 하므로 width를 0으로 바꿔준다
                                width = 0
                                height -= d.height
                                height -= features.lineSpacing
                            }

                            let result: CGFloat = width

                            if index == 0 {

                                width = -d.width
                                width -= features.dataSpacing
                                height = 0
                                
                                return d[.leading]
                            } else {
                                
                                width -= d.width
                                width -= features.dataSpacing
                            }

                            return result

                        }
                        .alignmentGuide(.top) { d in

                            return height
                        }

                }
            }
            .frame(width: frameSize.width, alignment: .topLeading)
            
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .overlay(
            GeometryReader { proxy in
                Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self) { size in
            frameSize = size
        }
            
    }
}

struct TestFlowLayout<ContentView: View>: FlowLayoutFeatures {
    typealias Element = LikeFilterCase

    var data: [LikeFilterCase]
    var dataSpacing: CGFloat
    var lineSpacing: CGFloat
    var content: (LikeFilterCase) -> ContentView

    init(data: [LikeFilterCase],
         dataSpacing: CGFloat = 0,
         lineSpacing: CGFloat = 0,
         @ViewBuilder content: @escaping (LikeFilterCase) -> ContentView) {
        self.data = data
        self.dataSpacing = dataSpacing
        self.lineSpacing = lineSpacing
        self.content = content
    }
}

//struct LeftAlignmnetView_Previews: PreviewProvider {
//    static var previews: some View {
//        LeftAlignmnetView(features: TestFlowLayout(data: ["hoho"], direction: .left, content: { text in
//            Text(text)
//        }))
//    }
//}
