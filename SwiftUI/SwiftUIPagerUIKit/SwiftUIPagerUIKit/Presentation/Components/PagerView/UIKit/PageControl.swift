//
//  PageControl.swift
//  SwiftUIPagerUIKit
//
//  Created by David Jardon on 1/12/23.
//

import UIKit
import SwiftUI

struct PageControl: UIViewRepresentable {
    var numOfPages: Int
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numOfPages
        pageControl.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )

        return pageControl
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }

    class Coordinator: NSObject {
        private var parent: PageControl

        init(parent: PageControl) {
            self.parent = parent
        }

        @objc
        func updateCurrentPage(sender: UIPageControl) {
            parent.currentPage = sender.currentPage
        }
    }
}
