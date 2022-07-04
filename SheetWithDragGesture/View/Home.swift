//
//  Home.swift
//  SheetWithDragGesture
//
//  Created by Furkan Aykut on 4.07.2022.
//

import SwiftUI

struct Home: View {
    
    // Search Text Properties
    
    @State var searchText : String = ""

    //Gesture Properties ...

    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0

    var body: some View {
        ZStack {

            GeometryReader { proxy in

                let frame = proxy.frame(in: .global)

                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
            }
            .blur(radius: getBlurRadius())
            .ignoresSafeArea()
            

            // Bottom Sheet

            // For getting Height for drag gesture

            GeometryReader { proxy -> AnyView in

                let height = proxy.frame(in: .global).height

                return AnyView(
                    ZStack {
                        BlurView(style: .systemThinMaterialDark)
                            .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 30))

                            VStack {
                              
                                VStack{
                                    Capsule()
                                        .fill(.white)
                                        .frame(width: 60, height: 4)
                                        //.padding(.top)
                                    
                                    TextField("Search", text: $searchText)
                                        .padding(.vertical,10)
                                        .padding(.horizontal)
                                        .background(BlurView(style: .dark))
                                        .cornerRadius(10)
                                        .colorScheme(.dark)
                                        .padding(.top,10)
                                }
                                .frame(height: 100)
                                
                                //ScrollView Content..
                                
                                ScrollView(.vertical, showsIndicators: false) {
                                    BottomContent()
                                }
                            }
                            .padding(.horizontal)
                            .frame(maxHeight: .infinity, alignment: .top)
                    }
                        .offset(y: height - 100)
                        .offset(y: -offset > 0 ? -offset <= (height - 100) ? offset : -(height - 100) : 0)
                        .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in

                            out = value.translation.height
                            onChange()
                        })
                            .onEnded({ value in
                                
                                let maxHeight = height - 100
                            withAnimation {
                                
                                //Logic conditions for moving states...
                                //Up down or mid...
                                if -offset > 100 && -offset < maxHeight / 2 {
                                    // Mid...
                                    offset = -(maxHeight / 3)
                                }
                                else if -offset > maxHeight / 2 {
                                    offset = -maxHeight
                                }
                                else {
                                    offset = 0
                                }
                            }
                                
                                // Storing last offset
                                // So that the gesture can continue from the last position ...
                                lastOffset = offset
                        })
                    )
                )
            }
                .ignoresSafeArea(.all, edges: .bottom)
        }
    }
    func onChange() {
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    
    // Blur radius for BG
    func getBlurRadius()->CGFloat{
        let progress = -offset / (UIScreen.main.bounds.height - 100)
        
        return progress * 30
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
