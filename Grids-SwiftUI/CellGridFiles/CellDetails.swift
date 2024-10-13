//
//  CellDetails.swift
//  Grids-SwiftUI
//
//  Created by Alex Fila on 13/10/24.
//

import SwiftUI

struct CellDetails: View {
    var cell: Cell

    var body: some View {
        VStack {
            Text(cell.name)
                .font(.largeTitle)
            Image(systemName: cell.name)
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.orange)
        }
        .padding()
    }
}

#Preview {
    CellDetails(cell: Cell(name: "dot.arrowtriangles.up.right.down.left.circle"))
}
