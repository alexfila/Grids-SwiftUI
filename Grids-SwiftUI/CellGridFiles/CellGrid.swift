//
//  CellGrid.swift
//  Grids-SwiftUI
//
//  Created by Alex Fila on 13/10/24.
//

import SwiftUI

struct CellGrid: View {
    @State private var isAddCell = false
    @State private var isEdit = false
    private static let columns = 4
    @State private var selectedCell: Cell?
    @State private var numberofcolumns = columns
    @State private var columnsGrid = Array(repeating: GridItem(.flexible()), count: columns)

    @State private var symbols = [
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
        Cell(name: "moon.stars"),
    ]
    
    var body: some View {
        VStack {
            if isEdit {
                Stepper(columnsText, value: $numberofcolumns, in: 1...6, step: 1) { _ in
                    withAnimation { columnsGrid = Array(repeating: GridItem(.flexible()), count: numberofcolumns) }
                }
                .padding()
            }
            ScrollView {
                LazyVGrid(columns: columnsGrid) {
                    ForEach(symbols) { symbol in
                        NavigationLink {
                            CellDetails(cell: symbol)
                        } label: {Image(systemName: symbol.name)
                                .resizable()
                                .scaledToFit()
                                .symbolRenderingMode(.hierarchical)
                                .foregroundColor(.accentColor)
                                .padding()
                        }
                        
                        .overlay(alignment: .topTrailing) {
                            if isEdit {
                                Button {
                                    remove(cell: symbol)
                                } label: {
                                    Image(systemName: "xmark.square.fill")
                                        .font(.title)
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white, Color.red)
                                }
                            }
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isAddCell = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEdit ? "Done" : "Edit") {
                    withAnimation {
                        isEdit.toggle()
                    }
                }
            }

        }
        .sheet(isPresented: $isAddCell, onDismiss: addSymbol) {
            CellPicker(cell: $selectedCell)
        }
    }
    
    func addSymbol() {
        guard let name = selectedCell else { return }
        withAnimation {
            symbols.insert(name, at: 0)
        }
    }
    
    func remove(cell: Cell) {
        guard let index = symbols.firstIndex(of: cell) else { return }
        withAnimation {
            _ = symbols.remove(at: index)
        }
    }
}

extension CellGrid {
    var columnsText: String {
        numberofcolumns > 1 ? "\(numberofcolumns) Columns" : "1 Column"
    }
}

#Preview { CellGrid() }
