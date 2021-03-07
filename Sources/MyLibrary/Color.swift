import UIKit
extension MyLibrary {
    public class Color {
        /// convert HexaDecimal to UIColor
        /// - Parameters:
        ///   - hexString: Hexa Decimal value
        ///   - alpha: alpha colro
        /// - Returns: UIColor
        internal class func fromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
            let r, g, b: CGFloat
            let offset = hexString.hasPrefix("#") ? 1 : 0
            let start = hexString.index(hexString.startIndex, offsetBy: offset)
            let hexColor = String(hexString[start...])
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0xff0000) >> 8) / 255
                b = CGFloat((hexNumber & 0xff0000)) / 255
                return UIColor(red: r, green: g, blue: b, alpha: alpha)
            }
            return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
        }
        
        
        /// test variable
        public static var myColor: UIColor {
            return self.fromHexString("006736")
        }
        
        
        /// test variable 2
        public static var secondaryMyColor: UIColor {
            return self.fromHexString("FCFFFD")
        }
    }
}
