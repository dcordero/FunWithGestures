import UIKit

extension NSNumber {
    
    public static var direct: NSNumber {
        return NSNumber(touchType: .direct)
    }
    
    public static var indirect: NSNumber {
        return NSNumber(touchType: .indirect)
    }
    
    // MARK: - Private
    
    private convenience init(touchType: UITouchType) {
        self.init(integerLiteral: touchType.rawValue)
    }
}

extension NSNumber {
    
    public static var menu: NSNumber {
        return NSNumber(pressType: .menu)
    }
    
    public static var playPause: NSNumber {
        return NSNumber(pressType: .playPause)
    }
    
    public static var select: NSNumber {
        return NSNumber(pressType: .select)
    }
    
    public static var upArrow: NSNumber {
        return NSNumber(pressType: .upArrow)
    }
    
    public static var downArrow: NSNumber {
        return NSNumber(pressType: .downArrow)
    }
    
    public static var leftArrow: NSNumber {
        return NSNumber(pressType: .leftArrow)
    }
    
    public static var rightArrow: NSNumber {
        return NSNumber(pressType: .rightArrow)
    }
    
    // MARK: - Private
    
    private convenience init(pressType: UIPressType) {
        self.init(integerLiteral: pressType.rawValue)
    }
}
