//
//  SectionDateCell.swift
//  HoneyInterestView
//
//  Created by Gab on 2023/12/15.
//

import SwiftUI

public struct SectionDateCell: View {
    
    public var date: String
    
    public var body: some View {
        ZStack(alignment: .center) {
            
            HStack(alignment: .center, spacing: 20) {
                
                Rectangle()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.red)
                
                Text(date)
                    .font(.system(size: 12))
                    .padding(.vertical, 3)
                    .padding(.horizontal, 13)
                    .background(.pink)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    .frame(height: 23)
                
                Rectangle()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.red)
                
            }
            .frame(maxWidth: .infinity)
            
        }
        .frame(height: 23)
        .frame(maxWidth: .infinity)
    }
}
