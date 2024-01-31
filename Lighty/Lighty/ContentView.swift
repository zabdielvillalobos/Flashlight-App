//
//  ContentView.swift
//  Lighty
//
//  Created by Zabdiel Villalobos on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var flashlightIsOn = false // add boolean state variable called flashlightIsOn

    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea() // Ignore safe area
                .animation(.snappy, value: flashlightIsOn)

            Button {
                flashlightIsOn.toggle() // Toggle flashlight
            } label: {
                Image(systemName: flashlightIsOn ? "power" : "power") // "power" SF Symbol
                    .font(.system(size: 60)) // make the icon 60x60pts
                    .foregroundColor(buttonForeground) // use buttonForeground as the foreground style
                    .frame(width: 140, height: 140) // Set a fixed frame size
                    .background(buttonBackground) // use buttonBackground as the background
            }
        }
    }

    private var buttonForeground: Color {
        flashlightIsOn ? Color.black : Color.white // should be black when flashlight is on, white otherwise
    }

    private var backgroundColor: Color {
        flashlightIsOn ? Color.white : Color.black // should be white when flashlight is on, black otherwise
    }

    private var buttonBackground: some View {
        Circle()
            .fill(backgroundColor)
            .shadow(color: buttonForeground.opacity(0.5), radius: 5)
    }
}

#Preview {
    ContentView()
}
