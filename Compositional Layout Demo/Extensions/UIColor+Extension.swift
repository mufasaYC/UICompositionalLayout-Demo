//
//  Created by Mustafa Yusuf on 15/01/22.
//

import UIKit.UIColor

fileprivate let colors: [UIColor] = [.systemBlue, .systemRed, .systemMint, .systemPink, .systemTeal, .systemBrown, .systemGreen, .systemIndigo, .systemOrange, .systemPurple, .systemYellow]

extension UIColor {
    
    static var randomColor: UIColor {
        guard let color = colors.randomElement() else {
            assertionFailure()
            return .systemPink
        }
        return color
    }
}
