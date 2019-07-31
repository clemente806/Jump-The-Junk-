//
//  GameViewController.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 28/06/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation


class GameViewController: UIViewController {
    
    static var player: AVAudioPlayer?
    static var player2: AVAudioPlayer?
    static var player3: AVAudioPlayer?

    static var score = 0

    var gameScene : SKScene? {
        return (self.view as! SKView).scene
    }

    override func viewDidLoad() {
        GameViewController.playSoundStoria()
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            
            if let scene = storia(fileNamed: "storia") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene, transition: SKTransition.fade(withDuration: TimeInterval(1)));
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        guard let press = presses.first else { return }
        if press.type == .menu {
            super.pressesBegan(presses, with: event)

            } else {
            gameScene?.pressesBegan(presses, with: event)
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    static func playSound() {
        GameViewController.player3?.stop()
        GameViewController.player?.stop()
        guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            GameViewController.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            GameViewController.player!.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
   static func playSoundLevel1() {
    
        GameViewController.player?.stop()
        guard let url = Bundle.main.url(forResource: "musicaStoria", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            GameViewController.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            GameViewController.player!.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    static func playSoundButtonPress() {
       
        guard let url = Bundle.main.url(forResource: "ButtonPress", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            GameViewController.player2 = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            GameViewController.player2!.volume = 1.0
            GameViewController.player2!.play()
        
        } catch let error {
            print(error.localizedDescription)
        }
    }

    static func playSoundGameOver() {
        GameViewController.player?.stop()
        guard let url = Bundle.main.url(forResource: "GameOverMusic", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            GameViewController.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            GameViewController.player?.volume = 3
            GameViewController.player!.play()
            
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

    static func pauseSound() {
        GameViewController.player!.pause()
    }
    
    static func resumeSound(){
        GameViewController.player!.play()
    }
    
    static func playSoundStoria() {
        
        guard let url = Bundle.main.url(forResource: "songStoria", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            GameViewController.player3 = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            GameViewController.player3!.volume = 1.0
//            player3?.volume = 3.0
            GameViewController.player3!.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

}
