//
//  UIImageView+ImageSizeAfterAspectFit.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 21/03/2020.
//

import Foundation
import UIKit

extension UIImageView {

    var imageSizeAfterAspectFit: CGSize {
        var newWidth: CGFloat
        var newHeight: CGFloat

        guard let image = image else { return frame.size }

        if image.size.height >= image.size.width {
            newHeight = frame.size.height
            newWidth = ((image.size.width / (image.size.height)) * newHeight)

            if CGFloat(newWidth) > (frame.size.width) {
                let diff = (frame.size.width) - newWidth
                let modifiedHeight = newHeight + CGFloat(diff) / newHeight * newHeight
				newHeight = modifiedHeight
                newWidth = frame.size.width
            }
        } else {
            newWidth = frame.size.width
            newHeight = (image.size.height / image.size.width) * newWidth

            if newHeight > frame.size.height {
                let diff = Float((frame.size.height) - newHeight)
                let modifiedWidth = newWidth + CGFloat(diff) / newWidth * newWidth
				newWidth = modifiedWidth
                newHeight = frame.size.height
            }
        }
        return .init(width: newWidth, height: newHeight)
    }
}
