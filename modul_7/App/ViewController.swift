//
//  ViewController.swift
//  App
//
//  Created by Admin on 14.03.2024.
//

import UIKit

class ViewController: UIViewController {
    

    var counter: Int = 0
    //let textColor = UIColor(red: 155/255, green: 250/255, blue: 248/255, alpha: 1)
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var colorBtnStart: UIButton!
    @IBOutlet weak var colorBtnRemove: UIButton!
    
    
    
    @IBAction func startButton(_ sender: Any) {
        counter += 1
        label.text = "Нажатый: \(String(counter))"
    }
    
    
    @IBAction func removeButton(_ sender: Any) {
        counter = 0
        label.text = "Нажатый: \(String(counter))"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorStartButton()
        colorRemoveButton()
        //counterLabel()
        
        
        
    }
    
    func colorStartButton()  {
        colorBtnStart.tintColor = .black
        colorBtnStart.backgroundColor = colorButton
        //colorBtnStart.backgroundColor = textColor
    }
    
    func colorRemoveButton() {
        colorBtnRemove.tintColor = .black
        colorBtnRemove.backgroundColor = colorButton
        //colorBtnRemove.backgroundColor = textColor
    }
    
//    func counterLabel() {
//        label.text = "Нажатый: \(String(counter))"
//    }


}

