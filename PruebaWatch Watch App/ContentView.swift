//
//  ContentView.swift
//  PruebaWatch Watch App
//
//  Created by Luis Cossío on 10/12/23.
//

//
//  ContentView.swift
//  SwiftUIBall8
//
//  Created by Luis Cossío on 10/12/23.
//

import SwiftUI
import AVFoundation


struct ContentView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    var vaticinios = Pronosticos()
    @State var text:String = ""
    @State private var player: AVAudioPlayer?
    @State private var aparecer = false
    @State private var startAnimation: Bool = false
    @State var rotaciones: Float = 0
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ZStack {
                    Image("fondo")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)

                    //Si verticalSizeClass es .regular entonces está en vertical
                    //Si está en compact está en landscape
                    Text(text)
                        .focusable(true)
                        .digitalCrownRotation($rotaciones).onChange(of: rotaciones, {
                            playSound()
                            text = vaticinios.pitonisa()
                            aparecer.toggle()
                            print(rotaciones)
                        })
                    
                    
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 1000))
                        .minimumScaleFactor(0.005)
                        .frame(
                            width: verticalSizeClass == .regular ? proxy.size.width/3 : proxy.size.height/3,
                            height: verticalSizeClass == .regular ? proxy.size.width/3 : proxy.size.height/3)
                        .opacity(0.7)
                        .phaseAnimator([1, 2, 3, 4, 5], trigger: aparecer) { content, phase in
                                    content
                                .blur(radius: phase == 3 ? 0 : 100)
                                        //.scaleEffect(phase == 2 ? 3 : 1)
                                } animation: { phase in
                                    switch phase {
                                    case 1,2: .easeIn
                                    case 3: .bouncy(duration: 8)
                                    case 4,5: .easeOut(duration: 5)
                                    default: .easeInOut
                                    }
                                }
                     
                    Image("bolaNegra")
                        .resizable()
                        .scaledToFill()
                    
                }
            }
        }
    }
    
    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "Shaking3", withExtension: "wav") else {
          return
        }

        do {
          player = try AVAudioPlayer(contentsOf: soundURL)
            print(soundURL)
        } catch {
          print("Failed to load the sound: \(error)")
        }
        player?.play()
        print("paly")
      }
}

#Preview {
    ContentView()
}
