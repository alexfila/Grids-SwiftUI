//
//  BackgroundColor.swift
//  Grids-SwiftUI
//
//  Created by Alex Fila on 12/10/24.
//

import SwiftUI

struct BackgroundColor: View {
    @State private var colorCurrent = Color.white

    let columns = Array(repeating:  GridItem(.flexible(minimum: 15, maximum: 80)), count: 4)
    let columnCustom = [GridItem(.fixed(55)), GridItem(.fixed(90)), GridItem(.flexible(minimum: 55, maximum: 90))]
    let columnAdaptive = [GridItem(.adaptive(minimum: 100, maximum: 250))]

    let colors: [Color] = [.gray, .green, .blue, .teal, .yellow, .brown, .mint, .indigo, .purple, .pink, .orange, .red]

    var body: some View {
        ScrollView {
            Image("bear")
                .resizable()
                .scaledToFit()
                .colorMultiply(colorCurrent)
            LazyVGrid(columns: columnAdaptive) {
                ForEach(colors.indices, id: \.self) { index in
                    Button {
                        colorCurrent = colors[index]
                    } label: {
                        Circle()
                            .aspectRatio(1, contentMode: ContentMode.fit)
                            .foregroundColor(colors[index])
                    }
                }
            }
        }
        .padding()
    }
}

#Preview { BackgroundColor() }
