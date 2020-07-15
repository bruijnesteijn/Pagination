//
//  PageControllerView.swift
//  SwiftUIAdvancedUIKit
//
//  Created by Bart Bruijnesteijn on 11/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI
import UIKit

struct PageControllerView: UIViewRepresentable {
    var dot: String
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.pageIndicatorTintColor = UIColor(named: self.dot)
        pageControl.currentPageIndicatorTintColor = UIColor(named: "klm_orange")
        pageControl.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return pageControl
    }
    
    func updateUIView(_ pageControl: UIPageControl, context: Context) {
        pageControl.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var pageControl: PageControllerView
        
        init(_ pageControl: PageControllerView) {
            self.pageControl = pageControl
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            pageControl.currentPage = sender.currentPage
        }
    }
}

struct PageControllerView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
