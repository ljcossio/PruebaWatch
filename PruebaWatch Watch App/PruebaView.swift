//
//  PruebaView.swift
//  PruebaWatch Watch App
//
//  Created by Luis Cossío on 10/12/23.
//

import SwiftUI

struct PruebaView: View {
    @State var scrollAmount = 0.0

        var body: some View {
            Text("Scroll: \(scrollAmount)")
                .focusable(true)
                .digitalCrownRotation($scrollAmount)
        }
}

#Preview {
    PruebaView()
}
