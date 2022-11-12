//
//  ViewController.swift
//  EggTimer
//
//  Created by Linas Nutautas on 11/11/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var uiViewOutlet: UIView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var eggsImages: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    
    enum Page {
        case soft
        case medium
        case hard
    }
    
    var currentPage: Page = .soft
    var timer = Timer()
    var alarm: AVAudioPlayer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segment()
        timeLabel.isHidden = true
    }
    
    
    @IBAction func onSegmentControllTapped(_ sender: Any) {
        if segmentController.selectedSegmentIndex == 0 {
            currentPage = .soft
        } else if segmentController.selectedSegmentIndex == 1 {
            currentPage = .medium
        } else {
            currentPage = .hard
        }
        
        switch currentPage {
        case .soft:
            eggsImages.image = UIImage(named: "soft_egg")
            timeLabel.isHidden = true
        case .medium:
            eggsImages.image = UIImage(named: "medium_egg")
            timeLabel.isHidden = true
        case .hard:
            eggsImages.image = UIImage(named: "hard_egg")
            timeLabel.isHidden = true
        }
        
    }
    
    
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        
        if segmentController.selectedSegmentIndex == 0 {
            timer.invalidate()
            var soft = 300
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
                if soft >= 0 {
                    self.timeLabel.isHidden = false
                    self.timeLabel.text = showTime(interval: Float(soft))
                    soft -= 1
                } else {
                    self.timer.invalidate()
                    self.timeLabel.text = "DONE"
                }
                
            }
        } else if segmentController.selectedSegmentIndex ==  1 {
            timer.invalidate()
            var medium = 420
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
                if medium >= 0 {
                    self.timeLabel.isHidden = false
                    self.timeLabel.text = showTime(interval: Float(medium))
                    medium -= 1
                } else {
                    self.timer.invalidate()
                    self.timeLabel.text = "DONE"
                }
                
            }
        } else {
            timer.invalidate()
            var hard = 720
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
                if hard >= 0 {
                    self.timeLabel.isHidden = false
                    self.timeLabel.text = showTime(interval: Float(hard))
                    hard -= 1
                } else {
                    self.timer.invalidate()
                    self.timeLabel.text = "DONE"
                }
                
            }
        }
        
    }
    
    
    @IBAction func stopActionButton(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    func showTime(interval: Float) -> String{
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        
        let formattedString = formatter.string(from: TimeInterval(interval))!
        return formattedString
    }
    
    func segment() { segmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        segmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        
    }
    
}
