import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow, NSWindowDelegate {
    override func awakeFromNib() {
        let flutterViewController = FlutterViewController()
        self.contentViewController = flutterViewController
        RegisterGeneratedPlugins(registry: flutterViewController)

        self.delegate = self
        
        // Make sure we're not resizable
        self.styleMask.remove(.resizable)
        
        super.awakeFromNib()
        
        // Set initial size and position
        DispatchQueue.main.async {
            self.adjustWindowSize()
        }
    }

    func adjustWindowSize() {
        if let screen = self.screen ?? NSScreen.main {
            let visibleFrame = screen.visibleFrame
            
            // First set size to match the visible frame
            self.setFrame(visibleFrame, display: true, animate: false)
            
            // Force window to top-left of visible frame
            let topLeftPoint = NSPoint(x: visibleFrame.minX, y: visibleFrame.maxY)
            self.setFrameTopLeftPoint(topLeftPoint)
        }
    }
    
    // This method positions the top-left corner of the window at the specified point
    override func setFrameTopLeftPoint(_ point: NSPoint) {
        var frame = self.frame
        frame.origin.x = point.x
        frame.origin.y = point.y - frame.size.height
        self.setFrame(frame, display: true, animate: false)
    }

    // Handle screen changes
    func windowDidChangeScreen(_ notification: Notification) {
        DispatchQueue.main.async {
            self.adjustWindowSize()
        }
    }
}
