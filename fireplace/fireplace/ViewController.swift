import AVFoundation
import AVKit
import UIKit

class ViewController: UIViewController {
    private var playerView: PlayerView = .init()
    private var videoPlayer: VideoPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.activate), name: .applicationDidBecomeActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.activate), name: .applicationWillEnterForeground, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.deactivate), name: .applicationWillResignActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.deactivate), name: .applicationDidEnterBackground, object: nil)
        
        view.addSubview(playerView)
        preparePlayer()
        
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
    }

    private func preparePlayer() {
        if let filePath = Bundle.main.path(forResource: "fire", ofType: "mp4") {
            let fileURL = NSURL(fileURLWithPath: filePath)
            videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        deactivate(nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activate(nil)
    }
    
    @objc func activate(_ notification: Notification?) {
        if let player = videoPlayer {
            player.playerRate = 1.0
        }
    }
    
    @objc func deactivate(_ notification: Notification?) {
        if let player = videoPlayer {
            player.playerRate = 0.0
        }
    }
}
