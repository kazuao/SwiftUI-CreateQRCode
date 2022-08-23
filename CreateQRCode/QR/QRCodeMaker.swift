//
//  QRCodeMaker.swift
//  sample
//
//  Created by kazunori.aoki on 2022/06/22.
//

import UIKit
import SwiftUI

final class QRCodeMaker {

    /// 文字列からQRコードを作成する
    ///
    /// - Parameter message: URL文字列
    /// - Returns:UIImageのQRコード
    static func makeQR(message: String) -> UIImage? {
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)

        guard let data = message.data(using: .utf8),
              let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "H"]),
              let ci = qr.outputImage?.transformed(by: sizeTransform),
              let cg = CIContext().createCGImage(ci, from: ci.extent) else { return nil }

        return UIImage(cgImage: cg)
    }
}


