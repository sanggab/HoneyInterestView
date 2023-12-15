//
//  StickyScrollView.swift
//  HoneyInterestView
//
//  Created by Gab on 2023/12/13.
//

import SwiftUI

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

public struct StickyScrollView<Header: View, Content: View>: View {
    
    public var header: Header
    public var content: Content
    
    public var maxHeight: CGFloat = 137
    public var minHeight: CGFloat = 87
    
    @State private var offsetY: CGFloat = 0
    
    public init(
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder content: @escaping () -> Content) {
            self.header = header()
            self.content = content()
        }
    
    
    public var body: some View {
        GeometryReader { mainGeometry in
            ScrollView {
                Group {
                    content
                        .offset(y: getContentOffsetY())
                    
                    GeometryReader { headerGeometry in
                        ZStack(alignment: .topLeading) {
                            header
                                .frame(height: maxHeight)
                                .offset(y: getHeaderOffsetY())
                        }
                        .offset(y: getHeaderZStackOffsetY(mainGeometry: mainGeometry, headerGeometry: headerGeometry))
                    }
                    .frame(height: maxHeight)
                }
                .overlay {
                    GeometryReader { proxy in
                        let stickOffsetY = proxy.frame(in: .named("StickyScrollView")).minY
                        Color.clear.preference(key: ScrollOffsetKey.self, value: stickOffsetY)
                    }
                }
            }
            .coordinateSpace(name: "StickyScrollView")
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                offsetY = value
            }
        }
    }
    
    private func getContentOffsetY() -> CGFloat {
        return maxHeight
    }
    
    public func getScrollViewOffset() -> CGFloat {
        return offsetY
    }
    
    private func getHeaderOffsetY() -> CGFloat {
        let offset = getScrollViewOffset()
        
        let stickyPoint = maxHeight - minHeight
        
        if offset < -stickyPoint {
            return (minHeight - maxHeight) - offset
        } else if offset > 0 {
            return -offset
        } else {
            return 0
        }
    }
    
    private func getHeaderZStackOffsetY(mainGeometry: GeometryProxy, headerGeometry: GeometryProxy) -> CGFloat {
        let offset = getScrollViewOffset()
        let mainFrame = mainGeometry.frame(in: .global)
        let headerFrame = headerGeometry.frame(in: .global)
        let headerOffsetY = (offset - headerFrame.minY) + mainFrame.minY

        return headerOffsetY
    }
    
    public func height(min: CGFloat = 87, max: CGFloat = 137) -> StickyScrollView {
        var scrollView = self
        scrollView.maxHeight = max
        scrollView.minHeight = min
        return scrollView
    }
}
