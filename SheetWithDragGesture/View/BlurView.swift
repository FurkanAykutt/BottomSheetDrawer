//
//  BlurView.swift
//  SheetWithDragGesture
//
//  Created by Furkan Aykut on 4.07.2022.
//

import SwiftUI

struct BlurView: UIViewRepresentable {

    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {

        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))

        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {

    }
}

