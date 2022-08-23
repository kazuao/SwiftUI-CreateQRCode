//
//  QRCreateView.swift
//  sample
//
//  Created by kazunori.aoki on 2022/06/22.
//

import SwiftUI

struct QRCreateView: View {

    @State private var qr: UIImage?

    var body: some View {
        VStack {
            Button(action: fetch) {
                Text("QR")
                    .font(.largeTitle)
            }

            if let qr = qr {
                Image(uiImage: qr)
                    .resizable()
                    .scaledToFit()
            }
        }
    }

    func fetch() {
        qr = QRCodeMaker.makeQR(message: "https://www.yahoo.co.jp/")
    }
}

struct QRCreateView_Previews: PreviewProvider {
    static var previews: some View {
        QRCreateView()
    }
}
