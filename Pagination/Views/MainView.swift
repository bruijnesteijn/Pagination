//
//  MainView.swift
//  SwiftUIAdvancedUIKit
//
//  Created by Bart Bruijnesteijn on 11/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var currentPage: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        Text("Page ")
                        Text(String(self.currentPage))
                    }
                    .font(.largeTitle)
                    
                    
                    PageControllerView(dot: "klm_dark_grey", numberOfPages: 10, currentPage: self.$currentPage)
                }
                .foregroundColor(Color.labelFontColor)
                    
                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 200, alignment: .center)
                .background(Color.rectangleAccentColor)
                
                HStack {
                    Button(action: {
                        if(self.currentPage > 0) {
                            self.currentPage -= 1
                        }
                    }) {
                        Text("Previous")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.buttonBackgroundColorDefault)
                    
                    Button(action: {
                        if(self.currentPage < 10) {
                            self.currentPage += 1
                        }
                    }) {
                        Text("Next")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.buttonBackgroundColor)
                }

            }
            .edgesIgnoringSafeArea(.all)

            .navigationTitle("Pages")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
