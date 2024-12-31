//
//  AudioPlayer.swift
//  Restart
//
//  Created by Macky Ramirez on 12/31/24.
//
import Foundation
import AVFoundation
var audioPlayer: AVAudioPlayer?
// MARK: - 
func playSound(sound: String,
               type: String) {
    if let path = Bundle.main.path(forResource: sound,
                                   ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            if audioPlayer != nil {
                audioPlayer?.play()
            }
        } catch {
            print("Counldn't find sound")
        }
    }
}

