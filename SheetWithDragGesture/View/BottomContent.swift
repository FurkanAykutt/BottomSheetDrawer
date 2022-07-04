//
//  BottomContent.swift
//  SheetWithDragGesture
//
//  Created by Furkan Aykut on 4.07.2022.
//

import SwiftUI

struct BottomContent: View {
    var body: some View {
        VStack {
            HStack {
                Text("Favourites")
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer()

                Button(action: {

                }, label: {
                        Text("See All")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    })
            }
                .padding(.top, 20)

            Divider()
                .foregroundColor(.white)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {

                    VStack(spacing: 8) {
                        Button(action: { }) {
                            Image(systemName: "house.fill")
                                .font(.title)
                                .frame(width: 65, height: 65)
                                .background(BlurView(style: .dark))
                                .clipShape(Circle())
                        }
                        Text("Home")
                            .foregroundColor(.white)
                    }

                    VStack(spacing: 8) {
                        Button(action: { }) {
                            Image(systemName: "briefcase.fill")
                                .font(.title)
                                .frame(width: 65, height: 65)
                                .background(BlurView(style: .dark))
                                .clipShape(Circle())
                        }
                        Text("Work")
                            .foregroundColor(.white)
                    }

                    VStack(spacing: 8) {
                        Button(action: { }) {
                            Image(systemName: "plus")
                                .font(.title)
                                .frame(width: 65, height: 65)
                                .background(BlurView(style: .dark))
                                .clipShape(Circle())
                        }
                        Text("Add")
                            .foregroundColor(.white)
                    }
                }
            }
                .padding(.top)

            HStack {
                Text("Editor's Pick")
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer()

                Button(action: { }) {
                    Text("See All")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }

            }
                .padding(.top, 25)

            Divider()
                .foregroundColor(.red)

            ForEach (1...6, id: \.self) { index in
                Image("p\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                    .cornerRadius(15)
                    .padding(.top)
            }
        }
    }
}

struct BottomContent_Previews: PreviewProvider {
    static var previews: some View {
        BottomContent()
    }
}
