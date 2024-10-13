//
//  CellPicker.swift
//  Grids-SwiftUI
//
//  Created by Alex Fila on 13/10/24.
//

import SwiftUI

struct CellPicker: View {
    @Environment(\.presentationMode) var modePresentation
    @Binding var cell: Cell?

    let columns = Array(repeating: GridItem(.flexible()), count: 4)

    let pickableSymbols = [
        Cell(name: "tshirt"),
        Cell(name: "eyes"),
        Cell(name: "eyebrow"),
        Cell(name: "nose"),
        Cell(name: "mustache"),
        Cell(name: "mouth"),
        Cell(name: "eyeglasses"),
        Cell(name: "facemask"),
        Cell(name: "brain.head.profile"),
        Cell(name: "brain"),
        Cell(name: "icloud"),
        Cell(name: "theatermasks.fill"),
        Cell(name: "house.fill"),
        Cell(name: "sun.max.fill"),
        Cell(name: "cloud.rain.fill"),
        Cell(name: "pawprint.fill"),
        Cell(name: "lungs.fill"),
        Cell(name: "face.smiling"),
        Cell(name: "gear"),
        Cell(name: "allergens"),
        Cell(name: "bolt.heart"),
        Cell(name: "ladybug.fill"),
        Cell(name: "bus.fill"),
        Cell(name: "bicycle.circle"),
        Cell(name: "faceid"),
        Cell(name: "gamecontroller.fill"),
        Cell(name: "timer"),
        Cell(name: "eye.fill"),
        Cell(name: "person.icloud"),
        Cell(name: "tortoise.fill"),
        Cell(name: "hare.fill"),
        Cell(name: "leaf.fill"),
        Cell(name: "wand.and.stars"),
        Cell(name:"globe.americas.fill"),
        Cell(name: "globe.europe.africa.fill"),
        Cell(name: "globe.asia.australia.fill"),
        Cell(name: "hands.sparkles.fill"),
        Cell(name: "hand.draw.fill"),
        Cell(name: "waveform.path.ecg.rectangle.fill"),
        Cell(name: "gyroscope"),
        
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(pickableSymbols) { symbol in
                    Button {
                        self.cell = symbol
                        modePresentation.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: symbol.name)
                            .resizable()
                            .scaledToFit()
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.orange)
                            .ignoresSafeArea(.container, edges: .bottom)
                    }
                    .padding()
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview { CellPicker(cell: .constant(nil)) }

