//
//  ContactView.swift
//  Resume_App
//
//  Created by hububble on 2023/9/12.
//
//
import SwiftUI

struct DotlineShape: Shape {
    
    var dotSize : CGFloat = 20
    var lineWidth : CGFloat = 5
    enum lineStyle { case bottomHalf, full, topHalf }
    var style : lineStyle = .full
    var dotPosition : CGFloat {
        switch style{
        case .bottomHalf:
            return 0.2
        case .full:
            return 0.5
        case .topHalf:
            return 0.8

        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in: CGRect(x:rect.midX - dotSize / 2,
                                   y: rect.maxY * dotPosition - dotSize * 0.5,
                                   width:dotSize,
                                   height:dotSize))

        path.addRect(CGRect(x:rect.midX - lineWidth / 2,
                            y:style == .bottomHalf ? rect.maxY * 0.2 : rect.minY,
                            width: lineWidth,
                            height: style == .full ? rect.height: rect.height * 0.8))

        
        return path
    }
}

struct DotLineShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0){
            DotlineShape(style: .bottomHalf).background(.yellow)
            DotlineShape(style: .full).background(.blue)
            DotlineShape(style:.topHalf).background(.yellow)
        }
    }
}
