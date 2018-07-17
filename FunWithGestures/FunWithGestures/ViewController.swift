import UIKit
import GameController

class ViewController: UIViewController {

    @IBOutlet private weak var gestureLabel: UILabel!
    
    private var swipeUpGestureRecognizer: UISwipeGestureRecognizer!
    private var swipeDownGestureRecognizer: UISwipeGestureRecognizer!
    private var swipeLeftGestureRecognizer: UISwipeGestureRecognizer!
    private var swipeRightGestureRecognizer: UISwipeGestureRecognizer!

    private var playPauseGestureRecognizer: UITapGestureRecognizer!
    private var menuGestureRecognizer: UITapGestureRecognizer!
    
    private var upTapGestureRecognizer: UITapGestureRecognizer!
    private var downTapGestureRecognizer: UITapGestureRecognizer!
    private var leftTapGestureRecognizer: UITapGestureRecognizer!
    private var rightTapGestureRecognizer: UITapGestureRecognizer!
    
    private var longTouchGestureRecognizer: UILongPressGestureRecognizer!
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses {
            switch press.type {
            case .select where dPadState == .up:
                selectUpWasPressed()
            case .select where dPadState == .down:
                selectDownWasPressed()
            case .select where dPadState == .left:
                selectLeftWasPressed()
            case .select where dPadState == .right:
                selectRightWasPressed()
            case .select:
                selectWasReceived()
            default:()
            }
        }
        super.pressesBegan(presses, with: event)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .magenta
        view.isUserInteractionEnabled = true
        
        swipeUpGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeUpWasReceived))
        swipeUpGestureRecognizer.direction = .up
        
        swipeDownGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeDownWasReceived))
        swipeDownGestureRecognizer.direction = .down

        swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeLeftWasReceived))
        swipeLeftGestureRecognizer.direction = .left
        
        swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeRightWasReceived))
        swipeRightGestureRecognizer.direction = .right
        
        playPauseGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.playPauseWasReceived))
        playPauseGestureRecognizer.allowedPressTypes = [.playPause]
        playPauseGestureRecognizer.allowedTouchTypes = [.indirect]
        
        menuGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.menuWasReceived))
        menuGestureRecognizer.allowedPressTypes = [.menu]
        menuGestureRecognizer.allowedTouchTypes = [.indirect]

        upTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(upTapWasReceived))
        upTapGestureRecognizer.allowedPressTypes = [.upArrow]
        upTapGestureRecognizer.allowedTouchTypes = [.indirect]
        
        downTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(downTapWasReceived))
        downTapGestureRecognizer.allowedPressTypes = [.downArrow]
        downTapGestureRecognizer.allowedTouchTypes = [.indirect]
        
        leftTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(leftTapWasReceived))
        leftTapGestureRecognizer.allowedPressTypes = [.leftArrow]
        leftTapGestureRecognizer.allowedTouchTypes = [.indirect]

        rightTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rightTapWasReceived))
        rightTapGestureRecognizer.allowedPressTypes = [.rightArrow]
        rightTapGestureRecognizer.allowedTouchTypes = [.indirect]
        
        longTouchGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longTouchWasReceived))
        longTouchGestureRecognizer.allowedPressTypes = []
        longTouchGestureRecognizer.allowedTouchTypes = [.indirect]
        
        view.addGestureRecognizer(swipeUpGestureRecognizer)
        view.addGestureRecognizer(swipeDownGestureRecognizer)
        view.addGestureRecognizer(swipeLeftGestureRecognizer)
        view.addGestureRecognizer(swipeRightGestureRecognizer)
        view.addGestureRecognizer(playPauseGestureRecognizer)
        view.addGestureRecognizer(menuGestureRecognizer)
        view.addGestureRecognizer(upTapGestureRecognizer)
        view.addGestureRecognizer(downTapGestureRecognizer)
        view.addGestureRecognizer(leftTapGestureRecognizer)
        view.addGestureRecognizer(rightTapGestureRecognizer)
        view.addGestureRecognizer(longTouchGestureRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(controllerConnected(note:)), name: .GCControllerDidConnect, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    func swipeUpWasReceived() {
        log(gesture: "🔼 swipeUpWasReceived")
    }
    
    @objc
    func swipeDownWasReceived() {
        log(gesture: "🔽 swipeDownWasReceived")
    }
    
    @objc
    func swipeLeftWasReceived() {
        log(gesture: "◀️ swipeLeftWasReceived")
    }
    
    @objc
    func swipeRightWasReceived() {
        log(gesture: "▶️ swipeRightWasReceived")
    }
    
    @objc
    func playPauseWasReceived() {
        log(gesture: "⏯ playPauseWasReceived")
    }
    
    @objc
    func menuWasReceived() {
        log(gesture: "🔵 menuWasReceived")
    }
    
    @objc
    func selectUpWasPressed() {
        log(gesture: "✊👆 selectUpWasPressed")
    }
    
    @objc
    func selectDownWasPressed() {
        log(gesture: "✊👇 selectDownWasPressed")
    }
    
    
    @objc
    func selectLeftWasPressed() {
        log(gesture: "✊👈 selectLeftWasPressed")
    }
    
    @objc
    func selectRightWasPressed() {
        log(gesture: "✊👉 selectRightWasPressed")
    }
    
    @objc
    func selectWasReceived() {
        log(gesture: "✊ selectWasReceived")
    }

    @objc
    func upTapWasReceived() {
        log(gesture: "👆 upTapWasReceived")
    }
    
    @objc
    func downTapWasReceived() {
        log(gesture: "👇 downTapWasReceived")
    }
    
    @objc
    func leftTapWasReceived() {
        log(gesture: "👈 leftTapWasReceived")
    }
    
    @objc
    func rightTapWasReceived() {
        log(gesture: "👉 rightTapWasReceived")
    }
    
    @objc
    func longTouchWasReceived() {
        
        switch dPadState {
        case .down:
            log(gesture: "⏱👇 downLongTouchWasReceived")
        case .up:
            log(gesture: "⏱👆 upLongTouchWasReceived")
        case .left:
            log(gesture: "⏱👈 leftLongTouchWasReceived")
        case .right:
            log(gesture: "⏱👉 rightLongTouchWasReceived")
        default:
            log(gesture: "⏱ longTouchWasReceived")
        }
    }
    
    @objc private func controllerConnected(note: NSNotification) {
        guard let controller = note.object as? GCController else { return }
        guard let micro = controller.microGamepad else { return }
        
        let threshold: Float = 0.7
        micro.reportsAbsoluteDpadValues = true
        micro.dpad.valueChangedHandler = {
            [weak self] (pad, x, y) in
            
            if y > threshold {
                self?.dPadState = .up
            }
            else if y < -threshold {
                self?.dPadState = .down
            }
            else if x < -threshold {
                self?.dPadState = .left
            }
            else if x > threshold {
                self?.dPadState = .right
            }
            else {
                self?.dPadState = .select
            }
        }
    }
    
    // MARK: - Private
    
    private enum DPadState {
        case select
        case right
        case left
        case up
        case down
    }
    
    private var dPadState: DPadState = .select

    private func log(gesture: String) {
        gestureLabel.text = gesture
        print(gesture)
    }
}
