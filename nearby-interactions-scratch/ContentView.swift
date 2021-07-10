//
//  ContentView.swift
//  nearby-interactions-scratch
//
//  Created by David Charles Morse on 2021-07-09.
//

import SwiftUI

struct ContentView: View {
    let colorService = ColorService()
    @State private var connectedDevices: [String]?
    @State private var backgroundColor: Color = .accentColor;
    var body: some View {
        VStack() {
            Text("Connections:\n\((self.connectedDevices ?? ["0"]).joined(separator: "\n"))")
            HStack() {
                Button(action: { colorService.send(Color.yellow.description) }) {
                    Text("  LEFT ").bold()
                }.background(Rectangle().foregroundColor(.yellow))
                Button(action: { colorService.send(Color.red.description) }) {
                    Text(" RIGHT ").bold()
                }.background(Rectangle().foregroundColor(.red))
            }
        }
        .onAppear(perform: { self.colorService.delegate = self })
        .background(Rectangle().foregroundColor(backgroundColor))
    }
}

extension ContentView: ColorServiceDelegate {
    func connectedDevicesChanged(manager: ColorService, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectedDevices = connectedDevices
        }
    }
    func colorChanged(manager: ColorService, colorString: String) {
        OperationQueue.main.addOperation {
            switch colorString {
                case Color.red.description:
                    self.backgroundColor = .red
                case Color.yellow.description:
                    self.backgroundColor = .yellow
                default:
                    NSLog("%@", "Unknown color value received: \(colorString)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().previewInterfaceOrientation(.portrait)
        }
    }
}
