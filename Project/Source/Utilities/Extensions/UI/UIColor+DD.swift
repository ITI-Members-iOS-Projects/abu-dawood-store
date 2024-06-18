//
//  ColorExtension.swift
//

import UIKit

public typealias Color = UIColor

// MARK: - Properties

public extension Color {
    static var random: Color {
        let red = Int(arc4random_uniform(255))
        let green = Int(arc4random_uniform(255))
        let blue = Int(arc4random_uniform(255))
        return Color(red: red, green: green, blue: blue)!
    }
}

// MARK: - Initializers

public extension Color {
    
    convenience init?(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
        guard red >= 0 && red <= 255 else { return nil }
        guard green >= 0 && green <= 255 else { return nil }
        guard blue >= 0 && blue <= 255 else { return nil }
        
        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
    
    convenience init?(hex: Int, transparency: CGFloat = 1) {
        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        let red = (hex >> 16) & 0xff
        let green = (hex >> 8) & 0xff
        let blue = hex & 0xff
        self.init(red: red, green: green, blue: blue, transparency: trans)
    }
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}
// MARK: - Social

public extension Color {
    
    struct Social {
        // https://www.lockedowndesign.com/social-media-colors/
        
        static let facebook = Color(red: 59, green: 89, blue: 152)
        static let twitter = Color(red: 0, green: 182, blue: 241)
        static let googlePlus = Color(red: 223, green: 74, blue: 50)
        static let linkedIn = Color(red: 0, green: 123, blue: 182)
        static let vimeo = Color(red: 69, green: 187, blue: 255)
        static let youtube = Color(red: 179, green: 18, blue: 23)
        static let instagram = Color(red: 195, green: 42, blue: 163)
        static let pinterest = Color(red: 203, green: 32, blue: 39)
        static let flickr = Color(red: 244, green: 0, blue: 131)!
        static let yahoo = Color(red: 67, green: 2, blue: 151)!
        static let soundCloud = Color(red: 67, green: 2, blue: 151)!
        static let tumblr = Color(red: 44, green: 71, blue: 98)!
        static let foursquare = Color(red: 252, green: 69, blue: 117)!
        static let swarm = Color(red: 255, green: 176, blue: 0)!
        static let dribbble = Color(red: 234, green: 76, blue: 137)!
        static let reddit = Color(red: 255, green: 87, blue: 0)!
        static let devianArt = Color(red: 74, green: 93, blue: 78)!
        static let pocket = Color(red: 238, green: 64, blue: 86)!
        static let quora = Color(red: 170, green: 34, blue: 182)!
        static let slideShare = Color(red: 247, green: 146, blue: 30)!
        static let px500 = Color(red: 0, green: 153, blue: 229)!
        static let listly = Color(red: 223, green: 109, blue: 70)!
        static let vine = Color(red: 0, green: 180, blue: 137)!
        static let skype = Color(red: 0, green: 175, blue: 240)!
        static let stumbleUpon = Color(red: 235, green: 73, blue: 36)!
        static let snapchat = Color(red: 255, green: 252, blue: 0)!
    }
    
}

// MARK: - Material colors
public extension Color {
    
    struct Material {
        // https://material.google.com/style/color.html
        static let red                    = red500
        static let red50                    = Color(hex: 0xFFEBEE)
        static let red100                = Color(hex: 0xFFCDD2)
        static let red200                = Color(hex: 0xEF9A9A)
        static let red300                = Color(hex: 0xE57373)
        static let red400                = Color(hex: 0xEF5350)
        static let red500                = Color(hex: 0xF44336)
        static let red600                = Color(hex: 0xE53935)
        static let red700                = Color(hex: 0xD32F2F)
        static let red800                = Color(hex: 0xC62828)
        static let red900                = Color(hex: 0xB71C1C)
        static let redA100                = Color(hex: 0xFF8A80)
        static let redA200                = Color(hex: 0xFF5252)
        static let redA400                = Color(hex: 0xFF1744)
        static let redA700                = Color(hex: 0xD50000)
        static let pink                    = pink500
        static let pink50                = Color(hex: 0xFCE4EC)
        static let pink100                = Color(hex: 0xF8BBD0)
        static let pink200                = Color(hex: 0xF48FB1)
        static let pink300                = Color(hex: 0xF06292)
        static let pink400                = Color(hex: 0xEC407A)
        static let pink500                = Color(hex: 0xE91E63)
        static let pink600                = Color(hex: 0xD81B60)
        static let pink700                = Color(hex: 0xC2185B)
        static let pink800                = Color(hex: 0xAD1457)
        static let pink900                = Color(hex: 0x880E4F)
        static let pinkA100                = Color(hex: 0xFF80AB)
        static let pinkA200                = Color(hex: 0xFF4081)
        static let pinkA400                = Color(hex: 0xF50057)
        static let pinkA700                = Color(hex: 0xC51162)
        static let purple                = purple500
        static let purple50                = Color(hex: 0xF3E5F5)
        static let purple100                = Color(hex: 0xE1BEE7)
        static let purple200                = Color(hex: 0xCE93D8)
        static let purple300                = Color(hex: 0xBA68C8)
        static let purple400                = Color(hex: 0xAB47BC)
        static let purple500                = Color(hex: 0x9C27B0)
        static let purple600                = Color(hex: 0x8E24AA)
        static let purple700                = Color(hex: 0x7B1FA2)
        static let purple800                = Color(hex: 0x6A1B9A)
        
        ///   hex #4A148C
        static let purple900                = Color(hex: 0x4A148C)
        
        ///   hex #EA80FC
        static let purpleA100            = Color(hex: 0xEA80FC)
        
        ///   hex #E040FB
        static let purpleA200            = Color(hex: 0xE040FB)
        
        ///   hex #D500F9
        static let purpleA400            = Color(hex: 0xD500F9)
        
        ///   hex #AA00FF
        static let purpleA700            = Color(hex: 0xAA00FF)
        
        ///   color deepPurple500
        static let deepPurple            = deepPurple500
        
        ///   hex #EDE7F6
        static let deepPurple50            = Color(hex: 0xEDE7F6)
        
        ///   hex #D1C4E9
        static let deepPurple100            = Color(hex: 0xD1C4E9)
        
        ///   hex #B39DDB
        static let deepPurple200            = Color(hex: 0xB39DDB)
        
        ///   hex #9575CD
        static let deepPurple300            = Color(hex: 0x9575CD)
        
        ///   hex #7E57C2
        static let deepPurple400            = Color(hex: 0x7E57C2)
        
        ///   hex #673AB7
        static let deepPurple500            = Color(hex: 0x673AB7)
        
        ///   hex #5E35B1
        static let deepPurple600            = Color(hex: 0x5E35B1)
        
        ///   hex #512DA8
        static let deepPurple700            = Color(hex: 0x512DA8)
        
        ///   hex #4527A0
        static let deepPurple800            = Color(hex: 0x4527A0)
        
        ///   hex #311B92
        static let deepPurple900            = Color(hex: 0x311B92)
        
        ///   hex #B388FF
        static let deepPurpleA100        = Color(hex: 0xB388FF)
        
        ///   hex #7C4DFF
        static let deepPurpleA200        = Color(hex: 0x7C4DFF)
        
        ///   hex #651FFF
        static let deepPurpleA400        = Color(hex: 0x651FFF)
        
        ///   hex #6200EA
        static let deepPurpleA700        = Color(hex: 0x6200EA)
        
        ///   color indigo500
        static let indigo                = indigo500
        
        ///   hex #E8EAF6
        static let indigo50                = Color(hex: 0xE8EAF6)
        
        ///   hex #C5CAE9
        static let indigo100                = Color(hex: 0xC5CAE9)
        
        ///   hex #9FA8DA
        static let indigo200                = Color(hex: 0x9FA8DA)
        
        ///   hex #7986CB
        static let indigo300                = Color(hex: 0x7986CB)
        
        ///   hex #5C6BC0
        static let indigo400                = Color(hex: 0x5C6BC0)
        
        ///   hex #3F51B5
        static let indigo500                = Color(hex: 0x3F51B5)
        
        ///   hex #3949AB
        static let indigo600                = Color(hex: 0x3949AB)
        
        ///   hex #303F9F
        static let indigo700                = Color(hex: 0x303F9F)
        
        ///   hex #283593
        static let indigo800                = Color(hex: 0x283593)
        
        ///   hex #1A237E
        static let indigo900                = Color(hex: 0x1A237E)
        
        ///   hex #8C9EFF
        static let indigoA100            = Color(hex: 0x8C9EFF)
        
        ///   hex #536DFE
        static let indigoA200            = Color(hex: 0x536DFE)
        
        ///   hex #3D5AFE
        static let indigoA400            = Color(hex: 0x3D5AFE)
        
        ///   hex #304FFE
        static let indigoA700            = Color(hex: 0x304FFE)
        
        ///   color blue500
        static let blue                    = blue500
        
        ///   hex #E3F2FD
        static let blue50                = Color(hex: 0xE3F2FD)
        
        ///   hex #BBDEFB
        static let blue100                = Color(hex: 0xBBDEFB)
        
        ///   hex #90CAF9
        static let blue200                = Color(hex: 0x90CAF9)
        
        ///   hex #64B5F6
        static let blue300                = Color(hex: 0x64B5F6)
        
        ///   hex #42A5F5
        static let blue400                = Color(hex: 0x42A5F5)
        
        ///   hex #2196F3
        static let blue500                = Color(hex: 0x2196F3)
        
        ///   hex #1E88E5
        static let blue600                = Color(hex: 0x1E88E5)
        
        ///   hex #1976D2
        static let blue700                = Color(hex: 0x1976D2)
        
        ///   hex #1565C0
        static let blue800                = Color(hex: 0x1565C0)
        
        ///   hex #0D47A1
        static let blue900                = Color(hex: 0x0D47A1)
        
        ///   hex #82B1FF
        static let blueA100                = Color(hex: 0x82B1FF)
        
        ///   hex #448AFF
        static let blueA200                = Color(hex: 0x448AFF)
        
        ///   hex #2979FF
        static let blueA400                = Color(hex: 0x2979FF)
        
        ///   hex #2962FF
        static let blueA700                = Color(hex: 0x2962FF)
        
        ///   color lightBlue500
        static let lightBlue                = lightBlue500
        
        ///   hex #E1F5FE
        static let lightBlue50            = Color(hex: 0xE1F5FE)
        
        ///   hex #B3E5FC
        static let lightBlue100            = Color(hex: 0xB3E5FC)
        
        ///   hex #81D4FA
        static let lightBlue200            = Color(hex: 0x81D4FA)
        
        ///   hex #4FC3F7
        static let lightBlue300            = Color(hex: 0x4FC3F7)
        
        ///   hex #29B6F6
        static let lightBlue400            = Color(hex: 0x29B6F6)
        
        ///   hex #03A9F4
        static let lightBlue500            = Color(hex: 0x03A9F4)
        
        ///   hex #039BE5
        static let lightBlue600            = Color(hex: 0x039BE5)
        
        ///   hex #0288D1
        static let lightBlue700            = Color(hex: 0x0288D1)
        
        ///   hex #0277BD
        static let lightBlue800            = Color(hex: 0x0277BD)
        
        ///   hex #01579B
        static let lightBlue900            = Color(hex: 0x01579B)
        
        ///   hex #80D8FF
        static let lightBlueA100            = Color(hex: 0x80D8FF)
        
        ///   hex #40C4FF
        static let lightBlueA200            = Color(hex: 0x40C4FF)
        
        ///   hex #00B0FF
        static let lightBlueA400            = Color(hex: 0x00B0FF)
        
        ///   hex #0091EA
        static let lightBlueA700            = Color(hex: 0x0091EA)
        
        ///   color cyan500
        static let cyan                    = cyan500
        
        ///   hex #E0F7FA
        static let cyan50                = Color(hex: 0xE0F7FA)
        
        ///   hex #B2EBF2
        static let cyan100                = Color(hex: 0xB2EBF2)
        
        ///   hex #80DEEA
        static let cyan200                = Color(hex: 0x80DEEA)
        
        ///   hex #4DD0E1
        static let cyan300                = Color(hex: 0x4DD0E1)
        
        ///   hex #26C6DA
        static let cyan400                = Color(hex: 0x26C6DA)
        
        ///   hex #00BCD4
        static let cyan500                = Color(hex: 0x00BCD4)
        
        ///   hex #00ACC1
        static let cyan600                = Color(hex: 0x00ACC1)
        
        ///   hex #0097A7
        static let cyan700                = Color(hex: 0x0097A7)
        
        ///   hex #00838F
        static let cyan800                = Color(hex: 0x00838F)
        
        ///   hex #006064
        static let cyan900                = Color(hex: 0x006064)
        
        ///   hex #84FFFF
        static let cyanA100                = Color(hex: 0x84FFFF)
        
        ///   hex #18FFFF
        static let cyanA200                = Color(hex: 0x18FFFF)
        
        ///   hex #00E5FF
        static let cyanA400                = Color(hex: 0x00E5FF)
        
        ///   hex #00B8D4
        static let cyanA700                = Color(hex: 0x00B8D4)
        
        ///   color teal500
        static let teal                    = teal500
        
        ///   hex #E0F2F1
        static let teal50                = Color(hex: 0xE0F2F1)
        
        ///   hex #B2DFDB
        static let teal100                = Color(hex: 0xB2DFDB)
        
        ///   hex #80CBC4
        static let teal200                = Color(hex: 0x80CBC4)
        
        ///   hex #4DB6AC
        static let teal300                = Color(hex: 0x4DB6AC)
        
        ///   hex #26A69A
        static let teal400                = Color(hex: 0x26A69A)
        
        ///   hex #009688
        static let teal500                = Color(hex: 0x009688)
        
        ///   hex #00897B
        static let teal600                = Color(hex: 0x00897B)
        
        ///   hex #00796B
        static let teal700                = Color(hex: 0x00796B)
        
        ///   hex #00695C
        static let teal800                = Color(hex: 0x00695C)
        
        ///   hex #004D40
        static let teal900                = Color(hex: 0x004D40)
        
        ///   hex #A7FFEB
        static let tealA100                = Color(hex: 0xA7FFEB)
        
        ///   hex #64FFDA
        static let tealA200                = Color(hex: 0x64FFDA)
        
        ///   hex #1DE9B6
        static let tealA400                = Color(hex: 0x1DE9B6)
        
        ///   hex #00BFA5
        static let tealA700                = Color(hex: 0x00BFA5)
        
        ///   color green500
        static let green                    = green500
        
        ///   hex #E8F5E9
        static let green50                = Color(hex: 0xE8F5E9)
        
        ///   hex #C8E6C9
        static let green100                = Color(hex: 0xC8E6C9)
        
        ///   hex #A5D6A7
        static let green200                = Color(hex: 0xA5D6A7)
        
        ///   hex #81C784
        static let green300                = Color(hex: 0x81C784)
        
        ///   hex #66BB6A
        static let green400                = Color(hex: 0x66BB6A)
        
        ///   hex #4CAF50
        static let green500                = Color(hex: 0x4CAF50)
        
        ///   hex #43A047
        static let green600                = Color(hex: 0x43A047)
        
        ///   hex #388E3C
        static let green700                = Color(hex: 0x388E3C)
        
        ///   hex #2E7D32
        static let green800                = Color(hex: 0x2E7D32)
        
        ///   hex #1B5E20
        static let green900                = Color(hex: 0x1B5E20)
        
        ///   hex #B9F6CA
        static let greenA100                = Color(hex: 0xB9F6CA)
        
        ///   hex #69F0AE
        static let greenA200                = Color(hex: 0x69F0AE)
        
        ///   hex #00E676
        static let greenA400                = Color(hex: 0x00E676)
        
        ///   hex #00C853
        static let greenA700                = Color(hex: 0x00C853)
        
        ///   color lightGreen500
        static let lightGreen            = lightGreen500
        
        ///   hex #F1F8E9
        static let lightGreen50            = Color(hex: 0xF1F8E9)
        
        ///   hex #DCEDC8
        static let lightGreen100            = Color(hex: 0xDCEDC8)
        
        ///   hex #C5E1A5
        static let lightGreen200            = Color(hex: 0xC5E1A5)
        
        ///   hex #AED581
        static let lightGreen300            = Color(hex: 0xAED581)
        
        ///   hex #9CCC65
        static let lightGreen400            = Color(hex: 0x9CCC65)
        
        ///   hex #8BC34A
        static let lightGreen500            = Color(hex: 0x8BC34A)
        
        ///   hex #7CB342
        static let lightGreen600            = Color(hex: 0x7CB342)
        
        ///   hex #689F38
        static let lightGreen700            = Color(hex: 0x689F38)
        
        ///   hex #558B2F
        static let lightGreen800            = Color(hex: 0x558B2F)
        
        ///   hex #33691E
        static let lightGreen900            = Color(hex: 0x33691E)
        
        ///   hex #CCFF90
        static let lightGreenA100        = Color(hex: 0xCCFF90)
        
        ///   hex #B2FF59
        static let lightGreenA200        = Color(hex: 0xB2FF59)
        
        ///   hex #76FF03
        static let lightGreenA400        = Color(hex: 0x76FF03)
        
        ///   hex #64DD17
        static let lightGreenA700        = Color(hex: 0x64DD17)
        
        ///   color lime500
        static let lime                    = lime500
        
        ///   hex #F9FBE7
        static let lime50                = Color(hex: 0xF9FBE7)
        
        ///   hex #F0F4C3
        static let lime100                = Color(hex: 0xF0F4C3)
        
        ///   hex #E6EE9C
        static let lime200                = Color(hex: 0xE6EE9C)
        
        ///   hex #DCE775
        static let lime300                = Color(hex: 0xDCE775)
        
        ///   hex #D4E157
        static let lime400                = Color(hex: 0xD4E157)
        
        ///   hex #CDDC39
        static let lime500                = Color(hex: 0xCDDC39)
        
        ///   hex #C0CA33
        static let lime600                = Color(hex: 0xC0CA33)
        
        ///   hex #AFB42B
        static let lime700                = Color(hex: 0xAFB42B)
        
        ///   hex #9E9D24
        static let lime800                = Color(hex: 0x9E9D24)
        
        ///   hex #827717
        static let lime900                = Color(hex: 0x827717)
        
        ///   hex #F4FF81
        static let limeA100                = Color(hex: 0xF4FF81)
        
        ///   hex #EEFF41
        static let limeA200                = Color(hex: 0xEEFF41)
        
        ///   hex #C6FF00
        static let limeA400                = Color(hex: 0xC6FF00)
        
        ///   hex #AEEA00
        static let limeA700                = Color(hex: 0xAEEA00)
        
        ///   color yellow500
        static let yellow                = yellow500
        
        ///   hex #FFFDE7
        static let yellow50                = Color(hex: 0xFFFDE7)
        
        ///   hex #FFF9C4
        static let yellow100                = Color(hex: 0xFFF9C4)
        
        ///   hex #FFF59D
        static let yellow200                = Color(hex: 0xFFF59D)
        
        ///   hex #FFF176
        static let yellow300                = Color(hex: 0xFFF176)
        
        ///   hex #FFEE58
        static let yellow400                = Color(hex: 0xFFEE58)
        
        ///   hex #FFEB3B
        static let yellow500                = Color(hex: 0xFFEB3B)
        
        ///   hex #FDD835
        static let yellow600                = Color(hex: 0xFDD835)
        
        ///   hex #FBC02D
        static let yellow700                = Color(hex: 0xFBC02D)
        
        ///   hex #F9A825
        static let yellow800                = Color(hex: 0xF9A825)
        
        ///   hex #F57F17
        static let yellow900                = Color(hex: 0xF57F17)
        
        ///   hex #FFFF8D
        static let yellowA100            = Color(hex: 0xFFFF8D)
        
        ///   hex #FFFF00
        static let yellowA200            = Color(hex: 0xFFFF00)
        
        ///   hex #FFEA00
        static let yellowA400            = Color(hex: 0xFFEA00)
        
        ///   hex #FFD600
        static let yellowA700            = Color(hex: 0xFFD600)
        
        ///   color amber500
        static let amber                    = amber500
        
        ///   hex #FFF8E1
        static let amber50                = Color(hex: 0xFFF8E1)
        
        ///   hex #FFECB3
        static let amber100                = Color(hex: 0xFFECB3)
        
        ///   hex #FFE082
        static let amber200                = Color(hex: 0xFFE082)
        
        ///   hex #FFD54F
        static let amber300                = Color(hex: 0xFFD54F)
        
        ///   hex #FFCA28
        static let amber400                = Color(hex: 0xFFCA28)
        
        ///   hex #FFC107
        static let amber500                = Color(hex: 0xFFC107)
        
        ///   hex #FFB300
        static let amber600                = Color(hex: 0xFFB300)
        
        ///   hex #FFA000
        static let amber700                = Color(hex: 0xFFA000)
        
        ///   hex #FF8F00
        static let amber800                = Color(hex: 0xFF8F00)
        
        ///   hex #FF6F00
        static let amber900                = Color(hex: 0xFF6F00)
        
        ///   hex #FFE57F
        static let amberA100                = Color(hex: 0xFFE57F)
        
        ///   hex #FFD740
        static let amberA200                = Color(hex: 0xFFD740)
        
        ///   hex #FFC400
        static let amberA400                = Color(hex: 0xFFC400)
        
        ///   hex #FFAB00
        static let amberA700                = Color(hex: 0xFFAB00)
        
        ///   color orange500
        static let orange                = orange500
        
        ///   hex #FFF3E0
        static let orange50                = Color(hex: 0xFFF3E0)
        
        ///   hex #FFE0B2
        static let orange100                = Color(hex: 0xFFE0B2)
        
        ///   hex #FFCC80
        static let orange200                = Color(hex: 0xFFCC80)
        
        ///   hex #FFB74D
        static let orange300                = Color(hex: 0xFFB74D)
        
        ///   hex #FFA726
        static let orange400                = Color(hex: 0xFFA726)
        
        ///   hex #FF9800
        static let orange500                = Color(hex: 0xFF9800)
        
        ///   hex #FB8C00
        static let orange600                = Color(hex: 0xFB8C00)
        
        ///   hex #F57C00
        static let orange700                = Color(hex: 0xF57C00)
        
        ///   hex #EF6C00
        static let orange800                = Color(hex: 0xEF6C00)
        
        ///   hex #E65100
        static let orange900                = Color(hex: 0xE65100)
        
        ///   hex #FFD180
        static let orangeA100            = Color(hex: 0xFFD180)
        
        ///   hex #FFAB40
        static let orangeA200            = Color(hex: 0xFFAB40)
        
        ///   hex #FF9100
        static let orangeA400            = Color(hex: 0xFF9100)
        
        ///   hex #FF6D00
        static let orangeA700            = Color(hex: 0xFF6D00)
        
        ///   color deepOrange500
        static let deepOrange            = deepOrange500
        
        ///   hex #FBE9E7
        static let deepOrange50            = Color(hex: 0xFBE9E7)
        
        ///   hex #FFCCBC
        static let deepOrange100            = Color(hex: 0xFFCCBC)
        
        ///   hex #FFAB91
        static let deepOrange200            = Color(hex: 0xFFAB91)
        
        ///   hex #FF8A65
        static let deepOrange300            = Color(hex: 0xFF8A65)
        
        ///   hex #FF7043
        static let deepOrange400            = Color(hex: 0xFF7043)
        
        ///   hex #FF5722
        static let deepOrange500            = Color(hex: 0xFF5722)
        
        ///   hex #F4511E
        static let deepOrange600            = Color(hex: 0xF4511E)
        
        ///   hex #E64A19
        static let deepOrange700            = Color(hex: 0xE64A19)
        
        ///   hex #D84315
        static let deepOrange800            = Color(hex: 0xD84315)
        
        ///   hex #BF360C
        static let deepOrange900            = Color(hex: 0xBF360C)
        
        ///   hex #FF9E80
        static let deepOrangeA100        = Color(hex: 0xFF9E80)
        
        ///   hex #FF6E40
        static let deepOrangeA200        = Color(hex: 0xFF6E40)
        
        ///   hex #FF3D00
        static let deepOrangeA400        = Color(hex: 0xFF3D00)
        
        ///   hex #DD2C00
        static let deepOrangeA700        = Color(hex: 0xDD2C00)
        
        ///   color brown500
        static let brown                    = brown500
        
        ///   hex #EFEBE9
        static let brown50                = Color(hex: 0xEFEBE9)
        
        ///   hex #D7CCC8
        static let brown100                = Color(hex: 0xD7CCC8)
        
        ///   hex #BCAAA4
        static let brown200                = Color(hex: 0xBCAAA4)
        
        ///   hex #A1887F
        static let brown300                = Color(hex: 0xA1887F)
        
        ///   hex #8D6E63
        static let brown400                = Color(hex: 0x8D6E63)
        
        ///   hex #795548
        static let brown500                = Color(hex: 0x795548)
        
        ///   hex #6D4C41
        static let brown600                = Color(hex: 0x6D4C41)
        
        ///   hex #5D4037
        static let brown700                = Color(hex: 0x5D4037)
        
        ///   hex #4E342E
        static let brown800                = Color(hex: 0x4E342E)
        
        ///   hex #3E2723
        static let brown900                = Color(hex: 0x3E2723)
        
        ///   color grey500
        static let grey                    = grey500
        
        ///   hex #FAFAFA
        static let grey50                = Color(hex: 0xFAFAFA)
        
        ///   hex #F5F5F5
        static let grey100                = Color(hex: 0xF5F5F5)
        
        ///   hex #EEEEEE
        static let grey200                = Color(hex: 0xEEEEEE)
        
        ///   hex #E0E0E0
        static let grey300                = Color(hex: 0xE0E0E0)
        
        ///   hex #BDBDBD
        static let grey400                = Color(hex: 0xBDBDBD)
        
        ///   hex #9E9E9E
        static let grey500                = Color(hex: 0x9E9E9E)
        
        ///   hex #757575
        static let grey600                = Color(hex: 0x757575)
        
        ///   hex #616161
        static let grey700                = Color(hex: 0x616161)
        
        ///   hex #424242
        static let grey800                = Color(hex: 0x424242)
        
        ///   hex #212121
        static let grey900                = Color(hex: 0x212121)
        
        ///   color blueGrey500
        static let blueGrey                = blueGrey500
        
        ///   hex #ECEFF1
        static let blueGrey50            = Color(hex: 0xECEFF1)
        
        ///   hex #CFD8DC
        static let blueGrey100            = Color(hex: 0xCFD8DC)
        
        ///   hex #B0BEC5
        static let blueGrey200            = Color(hex: 0xB0BEC5)
        
        ///   hex #90A4AE
        static let blueGrey300            = Color(hex: 0x90A4AE)
        
        ///   hex #78909C
        static let blueGrey400            = Color(hex: 0x78909C)
        
        ///   hex #607D8B
        static let blueGrey500            = Color(hex: 0x607D8B)
        
        ///   hex #546E7A
        static let blueGrey600            = Color(hex: 0x546E7A)
        
        ///   hex #455A64
        static let blueGrey700            = Color(hex: 0x455A64)
        
        ///   hex #37474F
        static let blueGrey800            = Color(hex: 0x37474F)
        
        ///   hex #263238
        static let blueGrey900            = Color(hex: 0x263238)
        
        ///   hex #000000
        static let black                    = Color(hex: 0x000000)
        
        ///   hex #FFFFFF
        static let white                    = Color(hex: 0xFFFFFF)
    }
    
}

// MARK: - CSS colors
public extension Color {
    
    ///   CSS colors.
    struct CSS {
        // http://www.w3schools.com/colors/colors_names.asp
        
        ///   hex #F0F8FF
        static let aliceBlue                = Color(hex: 0xF0F8FF)
        
        ///   hex #FAEBD7
        static let antiqueWhite            = Color(hex: 0xFAEBD7)
        
        ///   hex #00FFFF
        static let aqua                    = Color(hex: 0x00FFFF)
        
        ///   hex #7FFFD4
        static let aquamarine            = Color(hex: 0x7FFFD4)
        
        ///   hex #F0FFFF
        static let azure                    = Color(hex: 0xF0FFFF)
        
        ///   hex #F5F5DC
        static let beige                    = Color(hex: 0xF5F5DC)
        
        ///   hex #FFE4C4
        static let bisque                = Color(hex: 0xFFE4C4)
        
        ///   hex #000000
        static let black                    = Color(hex: 0x000000)
        
        ///   hex #FFEBCD
        static let blanchedAlmond        = Color(hex: 0xFFEBCD)
        
        ///   hex #0000FF
        static let blue                    = Color(hex: 0x0000FF)
        
        ///   hex #8A2BE2
        static let blueViolet            = Color(hex: 0x8A2BE2)
        
        ///   hex #A52A2A
        static let brown                    = Color(hex: 0xA52A2A)
        
        ///   hex #DEB887
        static let burlyWood                = Color(hex: 0xDEB887)
        
        ///   hex #5F9EA0
        static let cadetBlue                = Color(hex: 0x5F9EA0)
        
        ///   hex #7FFF00
        static let chartreuse            = Color(hex: 0x7FFF00)
        
        ///   hex #D2691E
        static let chocolate                = Color(hex: 0xD2691E)
        
        ///   hex #FF7F50
        static let coral                    = Color(hex: 0xFF7F50)
        
        ///   hex #6495ED
        static let cornflowerBlue        = Color(hex: 0x6495ED)
        
        ///   hex #FFF8DC
        static let cornsilk                = Color(hex: 0xFFF8DC)
        
        ///   hex #DC143C
        static let crimson                = Color(hex: 0xDC143C)
        
        ///   hex #00FFFF
        static let cyan                    = Color(hex: 0x00FFFF)
        
        ///   hex #00008B
        static let darkBlue                = Color(hex: 0x00008B)
        
        ///   hex #008B8B
        static let darkCyan                = Color(hex: 0x008B8B)
        
        ///   hex #B8860B
        static let darkGoldenRod            = Color(hex: 0xB8860B)
        
        ///   hex #A9A9A9
        static let darkGray                = Color(hex: 0xA9A9A9)
        
        ///   hex #A9A9A9
        static let darkGrey                = Color(hex: 0xA9A9A9)
        
        ///   hex #006400
        static let darkGreen                = Color(hex: 0x006400)
        
        ///   hex #BDB76B
        static let darkKhaki                = Color(hex: 0xBDB76B)
        
        ///   hex #8B008B
        static let darkMagenta            = Color(hex: 0x8B008B)
        
        ///   hex #556B2F
        static let darkOliveGreen        = Color(hex: 0x556B2F)
        
        ///   hex #FF8C00
        static let darkOrange            = Color(hex: 0xFF8C00)
        
        ///   hex #9932CC
        static let darkOrchid            = Color(hex: 0x9932CC)
        
        ///   hex #8B0000
        static let darkRed                = Color(hex: 0x8B0000)
        
        ///   hex #E9967A
        static let darkSalmon            = Color(hex: 0xE9967A)
        
        ///   hex #8FBC8F
        static let darkSeaGreen            = Color(hex: 0x8FBC8F)
        
        ///   hex #483D8B
        static let darkSlateBlue            = Color(hex: 0x483D8B)
        
        ///   hex #2F4F4F
        static let darkSlateGray            = Color(hex: 0x2F4F4F)
        
        ///   hex #2F4F4F
        static let darkSlateGrey            = Color(hex: 0x2F4F4F)
        
        ///   hex #00CED1
        static let darkTurquoise            = Color(hex: 0x00CED1)
        
        ///   hex #9400D3
        static let darkViolet            = Color(hex: 0x9400D3)
        
        ///   hex #FF1493
        static let deepPink                = Color(hex: 0xFF1493)
        
        ///   hex #00BFFF
        static let deepSkyBlue            = Color(hex: 0x00BFFF)
        
        ///   hex #696969
        static let dimGray                = Color(hex: 0x696969)
        
        ///   hex #696969
        static let dimGrey                = Color(hex: 0x696969)
        
        ///   hex #1E90FF
        static let dodgerBlue            = Color(hex: 0x1E90FF)
        
        ///   hex #B22222
        static let fireBrick                = Color(hex: 0xB22222)
        
        ///   hex #FFFAF0
        static let floralWhite            = Color(hex: 0xFFFAF0)
        
        ///   hex #228B22
        static let forestGreen            = Color(hex: 0x228B22)
        
        ///   hex #FF00FF
        static let fuchsia                = Color(hex: 0xFF00FF)
        
        ///   hex #DCDCDC
        static let gainsboro                = Color(hex: 0xDCDCDC)
        
        ///   hex #F8F8FF
        static let ghostWhite            = Color(hex: 0xF8F8FF)
        
        ///   hex #FFD700
        static let gold                    = Color(hex: 0xFFD700)
        
        ///   hex #DAA520
        static let goldenRod                = Color(hex: 0xDAA520)
        
        ///   hex #808080
        static let gray                    = Color(hex: 0x808080)
        
        ///   hex #808080
        static let grey                    = Color(hex: 0x808080)
        
        ///   hex #008000
        static let green                    = Color(hex: 0x008000)
        
        ///   hex #ADFF2F
        static let greenYellow            = Color(hex: 0xADFF2F)
        
        ///   hex #F0FFF0
        static let honeyDew                = Color(hex: 0xF0FFF0)
        
        ///   hex #FF69B4
        static let hotPink                = Color(hex: 0xFF69B4)
        
        ///   hex #CD5C5C
        static let indianRed                = Color(hex: 0xCD5C5C)
        
        ///   hex #4B0082
        static let indigo                = Color(hex: 0x4B0082)
        
        ///   hex #FFFFF0
        static let ivory                    = Color(hex: 0xFFFFF0)
        
        ///   hex #F0E68C
        static let khaki                    = Color(hex: 0xF0E68C)
        
        ///   hex #E6E6FA
        static let lavender                = Color(hex: 0xE6E6FA)
        
        ///   hex #FFF0F5
        static let lavenderBlush            = Color(hex: 0xFFF0F5)
        
        ///   hex #7CFC00
        static let lawnGreen                = Color(hex: 0x7CFC00)
        
        ///   hex #FFFACD
        static let lemonChiffon            = Color(hex: 0xFFFACD)
        
        ///   hex #ADD8E6
        static let lightBlue                = Color(hex: 0xADD8E6)
        
        ///   hex #F08080
        static let lightCoral            = Color(hex: 0xF08080)
        
        ///   hex #E0FFFF
        static let lightCyan                = Color(hex: 0xE0FFFF)
        
        ///   hex #FAFAD2
        static let lightGoldenRodYellow    = Color(hex: 0xFAFAD2)
        
        ///   hex #D3D3D3
        static let lightGray                = Color(hex: 0xD3D3D3)
        
        ///   hex #D3D3D3
        static let lightGrey                = Color(hex: 0xD3D3D3)
        
        ///   hex #90EE90
        static let lightGreen            = Color(hex: 0x90EE90)
        
        ///   hex #FFB6C1
        static let lightPink                = Color(hex: 0xFFB6C1)
        
        ///   hex #FFA07A
        static let lightSalmon            = Color(hex: 0xFFA07A)
        
        ///   hex #20B2AA
        static let lightSeaGreen            = Color(hex: 0x20B2AA)
        
        ///   hex #87CEFA
        static let lightSkyBlue            = Color(hex: 0x87CEFA)
        
        ///   hex #778899
        static let lightSlateGray        = Color(hex: 0x778899)
        
        ///   hex #778899
        static let lightSlateGrey        = Color(hex: 0x778899)
        
        ///   hex #B0C4DE
        static let lightSteelBlue        = Color(hex: 0xB0C4DE)
        
        ///   hex #FFFFE0
        static let lightYellow            = Color(hex: 0xFFFFE0)
        
        ///   hex #00FF00
        static let lime                    = Color(hex: 0x00FF00)
        
        ///   hex #32CD32
        static let limeGreen                = Color(hex: 0x32CD32)
        
        ///   hex #FAF0E6
        static let linen                    = Color(hex: 0xFAF0E6)
        
        ///   hex #FF00FF
        static let magenta                = Color(hex: 0xFF00FF)
        
        ///   hex #800000
        static let maroon                = Color(hex: 0x800000)
        
        ///   hex #66CDAA
        static let mediumAquaMarine        = Color(hex: 0x66CDAA)
        
        ///   hex #0000CD
        static let mediumBlue            = Color(hex: 0x0000CD)
        
        ///   hex #BA55D3
        static let mediumOrchid            = Color(hex: 0xBA55D3)
        
        ///   hex #9370DB
        static let mediumPurple            = Color(hex: 0x9370DB)
        
        ///   hex #3CB371
        static let mediumSeaGreen        = Color(hex: 0x3CB371)
        
        ///   hex #7B68EE
        static let mediumSlateBlue        = Color(hex: 0x7B68EE)
        
        ///   hex #00FA9A
        static let mediumSpringGreen        = Color(hex: 0x00FA9A)
        
        ///   hex #48D1CC
        static let mediumTurquoise        = Color(hex: 0x48D1CC)
        
        ///   hex #C71585
        static let mediumVioletRed        = Color(hex: 0xC71585)
        
        ///   hex #191970
        static let midnightBlue            = Color(hex: 0x191970)
        
        ///   hex #F5FFFA
        static let mintCream                = Color(hex: 0xF5FFFA)
        
        ///   hex #FFE4E1
        static let mistyRose                = Color(hex: 0xFFE4E1)
        
        ///   hex #FFE4B5
        static let moccasin                = Color(hex: 0xFFE4B5)
        
        ///   hex #FFDEAD
        static let navajoWhite            = Color(hex: 0xFFDEAD)
        
        ///   hex #000080
        static let navy                    = Color(hex: 0x000080)
        
        ///   hex #FDF5E6
        static let oldLace                = Color(hex: 0xFDF5E6)
        
        ///   hex #808000
        static let olive                    = Color(hex: 0x808000)
        
        ///   hex #6B8E23
        static let oliveDrab                = Color(hex: 0x6B8E23)
        
        ///   hex #FFA500
        static let orange                = Color(hex: 0xFFA500)
        
        ///   hex #FF4500
        static let orangeRed                = Color(hex: 0xFF4500)
        
        ///   hex #DA70D6
        static let orchid                = Color(hex: 0xDA70D6)
        
        ///   hex #EEE8AA
        static let paleGoldenRod            = Color(hex: 0xEEE8AA)
        
        ///   hex #98FB98
        static let paleGreen                = Color(hex: 0x98FB98)
        
        ///   hex #AFEEEE
        static let paleTurquoise            = Color(hex: 0xAFEEEE)
        
        ///   hex #DB7093
        static let paleVioletRed            = Color(hex: 0xDB7093)
        
        ///   hex #FFEFD5
        static let papayaWhip            = Color(hex: 0xFFEFD5)
        
        ///   hex #FFDAB9
        static let peachPuff                = Color(hex: 0xFFDAB9)
        
        ///   hex #CD853F
        static let peru                    = Color(hex: 0xCD853F)
        
        ///   hex #FFC0CB
        static let pink                    = Color(hex: 0xFFC0CB)
        
        ///   hex #DDA0DD
        static let plum                    = Color(hex: 0xDDA0DD)
        
        ///   hex #B0E0E6
        static let powderBlue            = Color(hex: 0xB0E0E6)
        
        ///   hex #800080
        static let purple                = Color(hex: 0x800080)
        
        ///   hex #663399
        static let rebeccaPurple            = Color(hex: 0x663399)
        
        ///   hex #FF0000
        static let red                    = Color(hex: 0xFF0000)
        
        ///   hex #BC8F8F
        static let rosyBrown                = Color(hex: 0xBC8F8F)
        
        ///   hex #4169E1
        static let royalBlue                = Color(hex: 0x4169E1)
        
        ///   hex #8B4513
        static let saddleBrown            = Color(hex: 0x8B4513)
        
        ///   hex #FA8072
        static let salmon                = Color(hex: 0xFA8072)
        
        ///   hex #F4A460
        static let sandyBrown            = Color(hex: 0xF4A460)
        
        ///   hex #2E8B57
        static let seaGreen                = Color(hex: 0x2E8B57)
        
        ///   hex #FFF5EE
        static let seaShell                = Color(hex: 0xFFF5EE)
        
        ///   hex #A0522D
        static let sienna                = Color(hex: 0xA0522D)
        
        ///   hex #C0C0C0
        static let silver                = Color(hex: 0xC0C0C0)
        
        ///   hex #87CEEB
        static let skyBlue                = Color(hex: 0x87CEEB)
        
        ///   hex #6A5ACD
        static let slateBlue                = Color(hex: 0x6A5ACD)
        
        ///   hex #708090
        static let slateGray                = Color(hex: 0x708090)
        
        ///   hex #708090
        static let slateGrey                = Color(hex: 0x708090)
        
        ///   hex #FFFAFA
        static let snow                    = Color(hex: 0xFFFAFA)
        
        ///   hex #00FF7F
        static let springGreen            = Color(hex: 0x00FF7F)
        
        ///   hex #4682B4
        static let steelBlue                = Color(hex: 0x4682B4)
        
        ///   hex #D2B48C
        static let tan                    = Color(hex: 0xD2B48C)
        
        ///   hex #008080
        static let teal                    = Color(hex: 0x008080)
        
        ///   hex #D8BFD8
        static let thistle                = Color(hex: 0xD8BFD8)
        
        ///   hex #FF6347
        static let tomato                = Color(hex: 0xFF6347)
        
        ///   hex #40E0D0
        static let turquoise                = Color(hex: 0x40E0D0)
        
        ///   hex #EE82EE
        static let violet                = Color(hex: 0xEE82EE)
        
        ///   hex #F5DEB3
        static let wheat                    = Color(hex: 0xF5DEB3)
        
        ///   hex #FFFFFF
        static let white                    = Color(hex: 0xFFFFFF)
        
        ///   hex #F5F5F5
        static let whiteSmoke            = Color(hex: 0xF5F5F5)
        
        ///   hex #FFFF00
        static let yellow                = Color(hex: 0xFFFF00)
        
        ///   hex #9ACD32
        static let yellowGreen            = Color(hex: 0x9ACD32)
    }
    
}

// MARK: - Flat UI colors
public extension Color {
    
    ///   Flat UI colors
    struct FlatUI {
        // http://flatuicolors.com.
        
        ///   hex #1ABC9C
        static let turquoise             = Color(hex: 0x1abc9c)
        
        ///   hex #16A085
        static let greenSea              = Color(hex: 0x16a085)
        
        ///   hex #2ECC71
        static let emerald               = Color(hex: 0x2ecc71)
        
        ///   hex #27AE60
        static let nephritis             = Color(hex: 0x27ae60)
        
        ///   hex #3498DB
        static let peterRiver            = Color(hex: 0x3498db)
        
        ///   hex #2980B9
        static let belizeHole            = Color(hex: 0x2980b9)
        
        ///   hex #9B59B6
        static let amethyst              = Color(hex: 0x9b59b6)
        
        ///   hex #8E44AD
        static let wisteria              = Color(hex: 0x8e44ad)
        
        ///   hex #34495E
        static let wetAsphalt            = Color(hex: 0x34495e)
        
        ///   hex #2C3E50
        static let midnightBlue          = Color(hex: 0x2c3e50)
        
        ///   hex #F1C40F
        static let sunFlower             = Color(hex: 0xf1c40f)
        
        ///   hex #F39C12
        static let flatOrange            = Color(hex: 0xf39c12)
        
        ///   hex #E67E22
        static let carrot                = Color(hex: 0xe67e22)
        
        ///   hex #D35400
        static let pumkin                = Color(hex: 0xd35400)
        
        ///   hex #E74C3C
        static let alizarin              = Color(hex: 0xe74c3c)
        
        ///   hex #C0392B
        static let pomegranate           = Color(hex: 0xc0392b)
        
        ///   hex #ECF0F1
        static let clouds                = Color(hex: 0xecf0f1)
        
        ///   hex #BDC3C7
        static let silver                = Color(hex: 0xbdc3c7)
        
        ///   hex #7F8C8D
        static let asbestos              = Color(hex: 0x7f8c8d)
        
        ///   hex #95A5A6
        static let concerte              = Color(hex: 0x95a5a6)
    }
}

// Extension to convert hex strings to UIColor
public extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }

        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}
