//
//  BasicGrids.swift
//  Grids-SwiftUI
//
//  Created by Alex Fila on 12/10/24.
//

import SwiftUI

struct BasicGrids: View {
    var body: some View {
        Grid(alignment: .top, horizontalSpacing: 15, verticalSpacing: 30)
        {
            GridRow {
                RoundedRectangle(cornerRadius: 40.0)
                    .foregroundColor(.green)
                Image("mark")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(35)
                Color.pink
            }
            GridRow {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .scaledToFit()
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 50, topTrailing: 50))
                    .fill(.orange)
            }
            GridRow(alignment: .bottom) {
                Text("Let's get it started")
                Circle()
                    .fill(.yellow)
            }
        }
        .padding()
    }
}

struct BasicGrid_Previews: PreviewProvider {
    static var previews: some View {
        BasicGrid()
    }
}

